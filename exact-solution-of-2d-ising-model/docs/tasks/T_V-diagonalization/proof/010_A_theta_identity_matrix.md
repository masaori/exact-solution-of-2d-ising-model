# γ₂(θ\_μ) = 0 のとき A(θ\_μ) が単位行列になる証明

## 概要

γ₂(θ\_μ) = 0 の場合に A(θ\_μ) が単位行列になることを証明する。

## 背景・前提

- `parts/008_T_V1_hatZとhatZ_hatYの関係/026_claim_A_thetaの対角化_固有値と固有ベクトル.typ:554` — 現在 `(この時 A(theta_mu) は単位行列になっている　TODO: 証明)`
- `parts/008_T_V1_hatZとhatZ_hatYの関係/016_definition_A_theta.typ` — A(theta) の定義
- `parts/008_T_V1_hatZとhatZ_hatYの関係/019_definition_A_thetaの対角化の準備.typ` — γ₁, γ₂ の定義

## スコープ

026 ファイル内の TODO コメント部分を証明で置き換える。

## 作業内容

### 1. A(theta) の定義に γ₂ = 0 を代入

A(theta) の各成分を γ₁, γ₂ で表した式に γ₂(θ\_μ) = 0 を代入し、単位行列になることを直接確認する。

## 対象ファイル

- `parts/008_T_V1_hatZとhatZ_hatYの関係/026_claim_A_thetaの対角化_固有値と固有ベクトル.typ`

## 完了条件

- [ ] γ₂ = 0 のとき A(θ\_μ) = I が証明されている
- [ ] ステートメントと証明が整合している
- [ ] `typst compile main.typ` がエラーなしで通過する
