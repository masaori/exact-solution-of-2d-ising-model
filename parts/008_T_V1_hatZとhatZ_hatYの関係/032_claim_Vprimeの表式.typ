#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules
#claim([$V'$の表式])[
  $cal(M) := {-M, dots, -2, -1, 1, 2, dots, M}$ とする。

  $
    V' = exp(
      - sum_(mu in cal(M)) gamma(theta_mu) (psi_mu^dagger psi_mu - 1/2)
    )
  $
]

(次回 0531)
- $gamma_(theta_mu)$を求める
    - (B.13)の関係式からexpの指数としてでてくるのでは？
    - 出てこんかった
    - (次回 20250614)
      - 固有ベクトルが間違えている？ので再度チェック
      - $v
      &= 
      c
      mat(
        plus.minus
        sqrt(
          -1
        )
        sqrt(
          gamma_2(theta_(mu))
          gamma_2(-theta_(mu))
        );
        sqrt(
          -1
        )
        gamma_2(-theta_(mu))
      )$ こうなってくれると都合が良い
以下の数値計算による
```sagemath
i = I

M = 8
mu = 1
nu = -1
c1 = 1.0
c2 = 2.0
s1 = 0.5
s2_star = 1.0

theta_mu = 2 * pi * mu / M
theta_nu = 2 * pi * nu / M

a = i * exp(i * theta_mu) * s2_star * (c1 * cos(theta_mu) - i * sin(theta_mu) - s1 * c2)
b = i * exp(i * theta_nu) * s2_star * (c1 * cos(theta_nu) - i * sin(theta_nu) - s1 * c2)

ab = a * b

ab_real = ab.real()
ab_imag = ab.imag()

is_real = abs(ab_imag.n()) < 1e-10 # 許容誤差
is_nonneg = ab_real.n() >= 0

# 偏角の取得
arg_a = arg(a)
arg_b = arg(b)
arg_ab = arg(a) + arg(b)

print(f"a = {a.n()}")
print(f"b = {b.n()}")
print(f"ab = {ab.n()}")
print(f"ab の実部: {ab_real.n()}, 虚部: {ab_imag.n()}")
print(f"ab は実数か? {is_real}")
print(f"ab は非負か? {is_nonneg}")
print(f"arg(a) = {arg_a.n()}")
print(f"arg(b) = {arg_b.n()}")
print(f"arg_ab = {arg_ab.n()}")
print(f"2pi = {(2 + pi).n()}")
```

- こうすると$g' = V'$が本の表式通り定義できる
     - この時に $Psi$の係数Mが消えたりして嬉しいのでは？
- $T_(V)$と$T_(V')$が同じことを示す (B.13/14から示せるらしい)

(次回 0510)
- 対角化まで終わった
- いまのところ、$g^prime = exp(-sum_mu gamma_mu (psi_mu^dagger psi_mu - 1/2))$ これが見つかる理由が全然わからん


(次回 0403)
P.「したがって 転送行列 の 対角化は,各 μ ごとに 4行 4列 の 行列 ス (θ″ )① ス (― =0,π (し )自 身 θ μ のと きはス )を 対角化する問題 に 帰着 された 。」これを正当化しなくても計算は進むか？

- A(theta)の固有ベクトルが (B.11/12)で天下りてきに与えられているので固有値は簡単に求まる
- その組み合わせ(多分)で Vの固有値が命題2.4で与えられているので、これが本当に固有値かはチェック可能？
  - むずいかもなので、命題2.4で与えられている固有値に属する固有ベクトルをなんらか求めたい
  - 本にはヒントなさそうなので自分でひねりだす
  - これが捻り出せたら、結局Pを正当化する必要はない
- 計算めんどそうなところ
  - ガンマの定義から、e^(gamma)を計算するところが?になりそう？
  - Vの固有ベクトルを捻り出すところ
      - A(theta)の固有ベクトルの組み合わせを色々試す？
      - なんか一般論がないか文献当たってみる

(次回0313-3)
- ホロノミック　付録 B の計算を続ける
    - 付録A(Clifford群の一般論)を眺めないといけないかも
    - 大変そうだったら色々認めて進める
  - $T_(V)$と$V$がほぼ1:1対応している？
    - 具体的な変換規則を知りたい
  - 変換規則がわかれば、$T_(V)$の対角化によって$V$の対角化ができる(?)
  - 


- ↑の @ホロノミック量子場_p142下段_1 のproofを続ける
- Lie Groups, Lie Algebras, and RepresentationsのProposition 3.35.の証明の概略はたどりたい
  - 続き
  - 公式の意味は定まったので、計算は進みそう
      - Lie群であることはどこで使われるか？(収束性の話)
- 文献管理 Bibliography https://typst.app/docs/reference/model/bibliography/ やってみる
