# e^X Y e^{-X} = e^{ad(X)}(Y) の証明

## 概要

e^X Y e^{-X} = Ad(exp(X))(Y) = e^{ad(X)}(Y) を証明する (BrianHall Prop 3.35)。

## 背景・前提

- `parts/005_exp(X)Yexp(-X)=exp(ad(X))(Y)の証明/008_theorem_exp(X)Yexp(-X)=Ad(exp(X))(Y)=exp(ad_X)(Y)_BrianHall_Prop3.35.typ:12` — 現在 `TODO: 一旦後回し`
- 本スコープの 000 (exp 収束), 020 (Ad=exp(ad)), 030 (二項定理的公式) が前提
- `parts/005_exp(X)Yexp(-X)=exp(ad(X))(Y)の証明/007_theorem_exp(ad_X)(Y)の級数展開_BrianHall_Prop3.35.typ` — 級数展開済み

## スコープ

同ファイルの証明を完成させる。現在は「成り立つとして計算を進める」状態。

## 作業内容

### 1. e^X Y e^{-X} = Ad(exp(X))(Y) の証明

行列の場合、Ad(g)(Y) = gYg^{-1} の定義から直接従う。

### 2. Ad(exp(X))(Y) = e^{ad(X)}(Y) の証明

本スコープ 020 の結果を適用する。

## 対象ファイル

- `parts/005_exp(X)Yexp(-X)=exp(ad(X))(Y)の証明/008_theorem_exp(X)Yexp(-X)=Ad(exp(X))(Y)=exp(ad_X)(Y)_BrianHall_Prop3.35.typ`

## 完了条件

- [ ] e^X Y e^{-X} = e^{ad(X)}(Y) が証明されている
- [ ] Ad の定義、exp(ad) との等式の両方が示されている
- [ ] ステートメントと証明が整合している
- [ ] `typst compile main.typ` がエラーなしで通過する
