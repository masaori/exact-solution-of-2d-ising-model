# T\_V の hatZ, hatY への作用の式変形による証明

## 概要

T\_V(hatZ), T\_V(hatY) の作用を式変形で証明する。現在は Mathematica で数値的に正しいことが確認されているが、証明は未記述。

## 背景・前提

- `parts/008_T_V1_hatZとhatZ_hatYの関係/017_claim_T_VのhatZ_hatYへの作用.typ:594` — 現在 `TODO: mathematicaに計算させたらステートメントは正しいことはわかったので、一旦具体の計算は飛ばす (0426)`
- `parts/008_T_V1_hatZとhatZ_hatYの関係/016_definition_A_theta.typ` — A(theta) の定義
- `parts/008_T_V1_hatZとhatZ_hatYの関係/005_claim_exp_X_Y_exp_minus_X.typ` — e^X Y e^{-X} の公式

## スコープ

`parts/008_T_V1_hatZとhatZ_hatYの関係/017_claim_T_VのhatZ_hatYへの作用.typ` の TODO 部分を式変形で証明する。

## 作業内容

### 1. T\_{V1} の hatZ, hatY への作用

e^X Y e^{-X} = e^{ad(X)}(Y) の公式を適用し、H1 との交換子のネスト (001\_claim) の結果を利用して計算する。

### 2. T\_{V2} の hatZ, hatY への作用

同様に H2 との交換子のネストを利用する。

### 3. T\_V = T\_{V1} T\_{V2} の合成

両者を合成して A(theta) の行列で表現されることを示す。

## 対象ファイル

- `parts/008_T_V1_hatZとhatZ_hatYの関係/017_claim_T_VのhatZ_hatYへの作用.typ`

## 完了条件

- [ ] T\_V(hatZ\_mu), T\_V(hatY\_mu) の式変形が完成している
- [ ] A(theta) 行列との対応が示されている
- [ ] ステートメントと証明が整合している
- [ ] `typst compile main.typ` がエラーなしで通過する
