# CLAUDE.md

## リポジトリ概要

数学研究プロジェクトのモノレポ。各プロジェクトはトップレベルのサブディレクトリに配置する。

### プロジェクト一覧

- `exact-solution-of-2d-ising-model/` — 2次元Ising模型の厳密解の証明

## 全体構成

```
├── CLAUDE.md              # 全体ルール（このファイル）
├── docs/
│   ├── research/          # プロジェクト横断の研究ノート
│   └── typst_tips.md      # Typst 記法の共通 tips
├── <project-name>/        # 各プロジェクト（下記テンプレート参照）
└── .claude/, .github/     # ツール設定
```

## プロジェクトテンプレート

新規プロジェクト作成時は以下の構成に従う。

```
<project-name>/
├── MEMORY.md              # プロジェクト固有の引き継ぎメモ（次回やること・未解決問題・完了済み）
├── main.typ               # メインの Typst ファイル
├── parts/                 # 証明の各パート（Typst ファイル群）
│   └── <NNN>_<セクション名>/
│       └── <NNN>_<type>_<内容>.typ    # type: definition, claim, theorem, remark, note
├── sagemath/              # SageMath による数値検証コード
│   ├── _shared/defs.sage  # 共通定義
│   └── check/<NNN>_<対象>/# parts/ のファイル番号に対応
├── docs/
│   └── tasks/             # タスク管理・作業指示書
└── _old/                  # 非推奨・旧コード（削除候補の退避先）
```

### 命名規則

- `parts/` 内のディレクトリ・ファイルは3桁の連番プレフィックス（`000_`, `001_`, ...）
- ファイル名に type を含める: `definition`, `claim`, `theorem`, `remark`, `note`
- `sagemath/check/` のディレクトリ名は対応する `parts/` のファイル番号に揃える

## MEMORY.md の運用

- 各プロジェクト内に `MEMORY.md` を置く: 次回やること・未解決問題・確認事項・完了済み作業
- commit/push 時に該当プロジェクトの MEMORY.md を更新すること

## 共通ルール

### コミュニケーション

- Claim, Definition, Theorem 等に言及するときは、対応する .typ ファイル名で伝えること

### Typst 記法

- 数式中の分数の書き方については [docs/typst_tips.md](docs/typst_tips.md) を必ず参照すること
