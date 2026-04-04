# 自己同型群の完全列の定義と証明

## 概要

自己同型群の完全列 1 → Z(G) → G → Aut(G) → Out(G) → 1 に必要な定義と証明を完成させる。

## 背景・前提

- `parts/008_T_V1_hatZとhatZ_hatYの関係/007_definition_自己同型群の完全列.typ:11,17` — 現在 TODO
- `parts/008_T_V1_hatZとhatZ_hatYの関係/006_definition_自己同型群_内部自己同型群_外部自己同型群.typ` — Aut, Inn, Out の定義済み

## スコープ

同ファイルに以下を追記する:
1. Ker, Im の定義
2. Z(G) (群の中心) の定義
3. 完全列の定義
4. 完全列をなすことの証明

## 作業内容

### 1. 基本的な定義の記述

- Ker(f) = {g ∈ G | f(g) = e} の定義
- Im(f) = {f(g) | g ∈ G} の定義
- Z(G) = {g ∈ G | ∀h ∈ G, gh = hg} の定義
- 完全列: Im(f\_i) = Ker(f\_{i+1}) の定義

### 2. 完全列の証明

各ステップで Im = Ker を示す:
- Im(Z(G) → G) = Ker(G → Aut(G)) を示す
- Im(G → Aut(G)) = Ker(Aut(G) → Out(G)) を示す

## 対象ファイル

- `parts/008_T_V1_hatZとhatZ_hatYの関係/007_definition_自己同型群の完全列.typ`

## 完了条件

- [ ] Ker, Im, Z(G), 完全列の4つの定義が記述されている
- [ ] 完全列をなすことが証明されている
- [ ] ステートメントと証明が整合している
- [ ] `typst compile main.typ` がエラーなしで通過する
