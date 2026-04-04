# Ad(exp(X)) = exp(ad(X)) の証明

## 概要

リー群上で Ad(exp(X)) = exp(ad(X)) が成り立つことを証明する。

## 背景・前提

- `parts/005_exp(X)Yexp(-X)=exp(ad(X))(Y)の証明/001_theorem_リー群上のAd(exp(X))=exp(ad(X)).typ:10` — 現在 `TODO:`
- BrianHall の Lie Groups, Lie Algebras, and Representations が参考文献
- 本スコープの 010 (内積・ノルム・収束の定義) と 050 (Matrix Lie群の定義) が前提

## スコープ

`parts/005_exp(X)Yexp(-X)=exp(ad(X))(Y)の証明/001_theorem_リー群上のAd(exp(X))=exp(ad(X)).typ` の証明を完成させる。

## 作業内容

### 1. BrianHall の対応する定理を参照し証明方針を確定

### 2. γ(t) = exp(tX) の微分を用いた証明

- d/dt Ad(exp(tX))(Y)|_{t=0} = ad(X)(Y) を示す
- ODE の一意性から Ad(exp(X)) = exp(ad(X)) を導く

## 対象ファイル

- `parts/005_exp(X)Yexp(-X)=exp(ad(X))(Y)の証明/001_theorem_リー群上のAd(exp(X))=exp(ad(X)).typ`

## 完了条件

- [ ] Ad(exp(X)) = exp(ad(X)) が証明されている
- [ ] ステートメントと証明が整合している
- [ ] `typst compile main.typ` がエラーなしで通過する
