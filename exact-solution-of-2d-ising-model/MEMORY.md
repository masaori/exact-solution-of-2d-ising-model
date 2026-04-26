# MEMORY — exact-solution-of-2d-ising-model

## 次回やること（優先度順）

### 1. 031 psi の反交換関係 b) の修正（クリティカルパス）

`[psi†_mu, psi_nu]_+ = delta_{mu≡nu (mod M)}` の証明が途中。問題:
1. delta の添字: 計算結果は `delta^M_{mu+nu,0}`（nu≡-mu）だがステートメントは `delta_{mu≡nu}`
2. 正規化定数: `-4M|gamma_2|^2` が消えない

原因候補:
- フェルミオンの定義（029）の正規化が合っていない
- ステートメントの delta の形が間違っている

037 の証明が 031 に依存しているので、ここが解決しないと先に進めない。

- 005_fix_P_mu_normalization: P_μ の正規化定数 c を修正する（027, 029, 031, 030, 037 の5ファイル）

### 2. V' の符号問題を解決する

037 の証明で判明: 現在の定義 `V' := exp(-sum gamma(psi†psi - 1/2))` だと符号が逆。
- `T_{V'}(psi†) = e^{-gamma} psi†` だが、030 では `T_V(psi†) = e^{+gamma} psi†`

**031 の問題を先に解決すれば符号も直る可能性が高い。** 031 の正規化・delta 添字の修正後に 037 の交換子を再計算して確認する。

### 3. 038 `T_V = T_{V'}` の proof

031 と符号問題が解決した後。030 + 033 + 037 を合わせて示す。

### 4. 039 `V = cV'` の proof

T の単射性が必要。009（クリフォード群の定義、TODO）に依存。

## 確認すべき項目

- [ ] 本（ホロノミック量子場 付録B）の (B.13) 式の符号: `g psi† g^{-1} = e^{-gamma} psi†` か `e^{+gamma} psi†` か
- [ ] 029 フェルミオンの定義の正規化係数: `1/(2M|gamma_2|)` 等の係数が必要ではないか

## 完了済み（2026-04-04）

- 032: claim → definition に変更（`032_definition_Vprimeの定義.typ`）
- 033: `gamma(theta_mu)` の定義 + `lambda_pm = e^{+-gamma}` の claim/proof
- 034: `det A(theta_mu) = 1` の claim/proof（036 の行列分解を利用）
- 035: `gamma_1(theta_mu) >= 1` の claim/proof
- 036: `A(theta_mu) = B_1 B_2 B_1` の行列分解 claim/proof
- 037: `T_{V'}` の psi への作用 claim/proof（符号問題あり）
- 038, 039: claim のみ（proof TODO）
