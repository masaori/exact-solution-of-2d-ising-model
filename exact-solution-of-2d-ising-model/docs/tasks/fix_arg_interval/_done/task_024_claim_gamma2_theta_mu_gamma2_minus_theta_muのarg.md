# Task: 024_claim_gamma2_theta_mu_gamma2_minus_theta_muのarg.typ の修正

ステータス：未完了

## 対象ファイル
`parts/008_T_V1_hatZとhatZ_hatYの関係/024_claim_gamma2_theta_mu_gamma2_minus_theta_muのarg.typ`

## 変更概要
`arg^((-pi, pi])` を `arg^([0, 2pi))` に変更する。
$\gamma_2(\theta_\mu) \gamma_2(-\theta_\mu)$ の偏角に関する claim を修正する。変更は1箇所のみ。

## 変更のポイント

### 記号の変更
- `arg^((-pi, pi])` → `arg^([0, 2pi))`

### 不等式の変更
旧: `-pi < ... <= pi` 系
新: `0 <= ... < 2pi` 系

**注意: 等号のつく場所が逆になる。**

### 参照先の変更
- `#ref(<arg_of_gamma_2_mu>)` → 023 の結果を引用している
- `#ref(<range_of_args_of_multiple_of_complex_numbers>)` → 033 の結果を引用している
- どちらも新しい `[0, 2pi)` 版の結果に合わせること

## 変更の参考例
`parts/000_計算公式/031_claim_複素数の積のarg.typ` で既に同様の変更が行われている。
変更前後を比較して、記法変更のパターンを理解すること。

## 注意事項
- 1行も省略しないこと。意図的に冗長に全ての計算ステップを明示している。
- 証明の全行を書き直すこと。途中のステップを省略してはならない。
- 023 と 033 の修正が先に終わっていること。
