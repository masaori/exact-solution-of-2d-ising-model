import { createServer } from 'node:http';
import { readFileSync, watch } from 'node:fs';
import { execSync } from 'node:child_process';
import { resolve } from 'node:path';

const PORT = parseInt(process.env.PORT || '5599');
const typFile = process.argv[2] || 'main.typ';
const pdfFile = typFile.replace(/\.typ$/, '.pdf');

let lastCompileTime = Date.now();
let compileTimer = null;

function compile() {
  try {
    execSync(`typst compile ${typFile} ${pdfFile}`, { stdio: 'pipe' });
    lastCompileTime = Date.now();
    console.log(`[${new Date().toLocaleTimeString()}] compiled ${pdfFile}`);
  } catch (e) {
    console.error(`[${new Date().toLocaleTimeString()}] compile error: ${e.stderr?.toString().slice(0, 200)}`);
  }
}

watch('.', { recursive: true }, (_event, filename) => {
  if (filename && filename.endsWith('.typ')) {
    clearTimeout(compileTimer);
    compileTimer = setTimeout(compile, 300);
  }
});

const PDFJS_CDN = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174';

const HTML = `<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Typst Live Preview</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { background: #2a2a2a; }
  #status {
    position: fixed; top: 8px; right: 12px; padding: 4px 10px;
    background: rgba(0,0,0,0.6); color: #8f8; border-radius: 4px;
    font: 12px monospace; z-index: 999;
  }
  #status.stale { color: #ff8; }
  /* PDF.js mode */
  #pages { display: flex; flex-direction: column; align-items: center; gap: 8px; padding: 8px 0; }
  canvas { display: block; box-shadow: 0 2px 8px rgba(0,0,0,0.5); max-width: 100%; height: auto !important; }
  .tile-placeholder { background: #333; }
  /* iframe mode */
  #pdf-frame { border: none; width: 100%; height: 100vh; display: none; }
</style>
</head>
<body>
<div id="status">loading...</div>
<div id="pages"></div>
<iframe id="pdf-frame"></iframe>
<script>
const isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
const status = document.getElementById('status');
let knownVersion = 0;

if (isMobile) {
  // iframe mode: built-in PDF viewer, no crash risk
  const frame = document.getElementById('pdf-frame');
  frame.style.display = 'block';
  document.getElementById('pages').style.display = 'none';

  async function poll() {
    try {
      const res = await fetch('/version');
      const v = await res.json();
      if (v.t > knownVersion) {
        if (knownVersion > 0) {
          frame.src = '/${pdfFile}?' + v.t;
          status.textContent = 'updated ' + new Date().toLocaleTimeString();
        } else {
          frame.src = '/${pdfFile}';
          status.textContent = 'loaded';
        }
        knownVersion = v.t;
      }
    } catch {
      status.textContent = 'offline';
      status.className = 'stale';
    }
  }
  setInterval(poll, 1000);
  poll();

} else {
  // PDF.js tiled mode with lazy rendering
  const script = document.createElement('script');
  script.src = '${PDFJS_CDN}/pdf.min.js';
  script.onload = () => {
    pdfjsLib.GlobalWorkerOptions.workerSrc = '${PDFJS_CDN}/pdf.worker.min.js';
    const pagesDiv = document.getElementById('pages');
    let rendering = false;
    let currentPdf = null;

    const SCALE = Math.min(window.devicePixelRatio || 2, 2);
    const TILE_CSS_HEIGHT = 1000;
    const TILE_PX_HEIGHT = TILE_CSS_HEIGHT * SCALE;

    const observer = new IntersectionObserver((entries) => {
      for (const entry of entries) {
        if (entry.isIntersecting && !entry.target._rendered && currentPdf) {
          renderTile(entry.target);
        }
      }
    }, { rootMargin: '500px 0px' });

    async function renderTile(el) {
      if (el._rendering || el._rendered) return;
      el._rendering = true;
      try {
        const pageNum = el._pageNum;
        const tileIdx = el._tileIdx;
        const page = await currentPdf.getPage(pageNum);
        const fullVp = page.getViewport({ scale: SCALE });
        const yOff = tileIdx * TILE_PX_HEIGHT;
        const tileH = Math.min(TILE_PX_HEIGHT, fullVp.height - yOff);
        const canvas = document.createElement('canvas');
        canvas.width = fullVp.width;
        canvas.height = tileH;
        canvas.style.width = (fullVp.width / SCALE) + 'px';
        canvas.style.height = (tileH / SCALE) + 'px';
        const ctx = canvas.getContext('2d');
        ctx.save();
        ctx.translate(0, -yOff);
        await page.render({ canvasContext: ctx, viewport: fullVp }).promise;
        ctx.restore();
        el.innerHTML = '';
        el.appendChild(canvas);
        el._rendered = true;
      } catch (e) {
        console.error('tile render error', e);
      }
      el._rendering = false;
    }

    async function loadPdf(url) {
      if (rendering) return;
      rendering = true;
      try {
        const pdf = await pdfjsLib.getDocument(url).promise;
        currentPdf = pdf;
        const oldScroll = window.scrollY;
        pagesDiv.innerHTML = '';
        for (let i = 1; i <= pdf.numPages; i++) {
          const page = await pdf.getPage(i);
          const fullVp = page.getViewport({ scale: SCALE });
          const cssW = fullVp.width / SCALE;
          const numTiles = Math.ceil(fullVp.height / TILE_PX_HEIGHT);
          for (let t = 0; t < numTiles; t++) {
            const tileH = Math.min(TILE_PX_HEIGHT, fullVp.height - t * TILE_PX_HEIGHT);
            const div = document.createElement('div');
            div.className = 'tile-placeholder';
            div.style.width = cssW + 'px';
            div.style.height = (tileH / SCALE) + 'px';
            div._pageNum = i;
            div._tileIdx = t;
            div._rendered = false;
            div._rendering = false;
            pagesDiv.appendChild(div);
            observer.observe(div);
          }
        }
        window.scrollTo(0, oldScroll);
      } catch (e) {
        console.error('load error', e);
      }
      rendering = false;
    }

    async function poll() {
      try {
        const res = await fetch('/version');
        const v = await res.json();
        if (v.t > knownVersion) {
          knownVersion = v.t;
          await loadPdf('/${pdfFile}?' + v.t);
          status.textContent = 'updated ' + new Date().toLocaleTimeString();
          status.className = '';
        }
      } catch {
        status.textContent = 'offline';
        status.className = 'stale';
      }
    }
    setInterval(poll, 1000);
    poll();
  };
  document.head.appendChild(script);
}
</script>
</body>
</html>`;

const server = createServer((req, res) => {
  if (req.url === '/version') {
    res.writeHead(200, {
      'Content-Type': 'application/json',
      'Cache-Control': 'no-store',
    });
    res.end(JSON.stringify({ t: lastCompileTime }));
    return;
  }

  const urlPath = req.url.split('?')[0];
  if (urlPath === `/${pdfFile}` || urlPath === `/${encodeURIComponent(pdfFile)}`) {
    try {
      const pdf = readFileSync(resolve(pdfFile));
      res.writeHead(200, { 'Content-Type': 'application/pdf', 'Cache-Control': 'no-store' });
      res.end(pdf);
    } catch {
      res.writeHead(404);
      res.end('PDF not found - waiting for typst compile');
    }
    return;
  }

  res.writeHead(200, { 'Content-Type': 'text/html' });
  res.end(HTML);
});

server.listen(PORT, '0.0.0.0', () => {
  console.log(`Typst preview: http://127.0.0.1:${PORT}/`);
  console.log(`Watching .typ files, serving ${pdfFile}`);
});
