---
name: typst-live-preview
description: Typstプレビューサーバー + Cloudflare Tunnelを起動し、リアルタイムプレビューの共有URLをクリップボードにコピーする。
---

# Typst Live Preview

Typstドキュメントのリアルタイムプレビューサーバーを起動し、Cloudflare Tunnel経由で外部共有可能にする。

## 前提

- `typst` (`brew install typst`)
- `cloudflared` (`brew install cloudflared`)
- `node` (v18+)

## プレビューサーバー

各プロジェクトの `typst-preview-server.mjs` を使用する。

- `.typ` ファイルの変更を `fs.watch` で検知し、`typst compile` を実行
- コンパイル完了時刻を `/version` エンドポイントで返す
- ブラウザ側は1秒ごとに `/version` をポーリングし、変更があれば PDF iframe を自動リロード
- SSE/WebSocketは使わない（Cloudflare Tunnelのバッファリングで機能しないため）

## 手順

1. 既存のプレビューサーバー / cloudflared プロセスがあれば停止する
   ```
   pkill -f "node typst-preview"; pkill -f cloudflared
   ```
2. 対象プロジェクトのディレクトリに移動し、`typst-preview-server.mjs` が存在するか確認する
3. プレビューサーバーをバックグラウンドで起動する
   ```
   node typst-preview-server.mjs > /tmp/typst-preview.log 2>&1 &
   ```
4. `http://127.0.0.1:5599/` が200を返すことを確認する
5. Cloudflare Tunnel をバックグラウンドで起動し、ログからトンネルURLを取得する
   ```
   cloudflared tunnel --url http://127.0.0.1:5599 > /tmp/cloudflared.log 2>&1 &
   sleep 8
   grep -o 'https://[^ ]*trycloudflare.com' /tmp/cloudflared.log | head -1
   ```
6. 以下のテンプレートでメンバー向けインストラクションを生成し、`pbcopy` でクリップボードにコピーする

### クリップボードにコピーするテンプレート

```
Typstドキュメントのリアルタイムプレビューを共有しています。

URL: <tunnel-url>

- ブラウザで上記URLを開いてください
- .typファイルが更新されるたびに自動的にリロードされます（1秒ポーリング）
- Cloudflare Tunnelの一時URLのため、サーバー再起動時にURLが変わります
```

7. ユーザーにローカルURL・共有URL・停止方法を報告する

### 停止方法の案内

```
pkill -f "node typst-preview"; pkill -f cloudflared
```
