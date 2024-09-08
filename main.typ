#import "@preview/cetz:0.1.2"
#import "@preview/commute:0.2.0": node, arr, commutative-diagram
#import "@preview/ctheorems:1.1.2": *
#show: thmrules.with(qed-symbol: $square$)

#set block(breakable: false)
#set heading(numbering: "1.1.")

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong,
  fill: rgb("#ffeeee")
)
#let claim = thmbox("claim", "Claim", fill: rgb("#eeeeff"))
#let definition = thmbox("definition", "Definition", fill: rgb("#eeefef"))
#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof", fill: rgb("#eeffee"))

#let mapDef(f, A, B, a, b, comment) = {
  $
  #grid(
    columns: 6,
    gutter: 5pt,
    $#f$, $:$, $#A$, $->$, $#B$, $#comment$,
    "", "", rotate(-90deg, $in$), "", rotate(-90deg, $in$), "",
    "", "", $#a$, $|->$, $#b$,  ""
  )
  $
}

== 線型写像のexp
#theorem[
  体$K$: $RR$または$CC$, $V$: 有限次元$K$-ノルム線型空間

  線型写像 $X$ : $V -> V$ について、
  $
  sum_(n=0)^(infinity) (1/n!) overbrace(X compose X compose dots compose X, n "times")
  $
  は、線型写像 $V -> V$に各点収束する
]
#proof[

  $V$は有限次元なので、基底$E subset V$が存在するので、$X$は有限次元行列$A in M(K)$として表せる。
  
  $v in V$について、$v$は数ベクトル$w in K^d$として表せて、$(sum_(n=0)^(infinity) (1/n!) A^n)w$の各成分は、絶対収束する。 (証明略)
]

#definition[
  有限次元線型空間 $V$ 

  線型写像 $X$ : $V -> V$ について、

  $
  exp(X) := sum_(n=0)^(infinity) (1/n!) overbrace(X compose X compose dots compose X, n "times")
  $
]




= 対角化の計算 (ホロノミック量子場 付録B)
== 記号の定義
- $cal(F) := (CC^2)^(times.circle M)$
- $sigma_k^x := I times.circle dots.c times.circle limits(k"th")(sigma^x) times.circle dots.c times.circle I in "End"(cal(F))$
- $sigma_k^y := I times.circle dots.c times.circle limits(k"th")(sigma^y) times.circle dots.c times.circle I in "End"(cal(F))$
- $sigma_k^z := I times.circle dots.c times.circle limits(k"th")(sigma^z) times.circle dots.c times.circle I in "End"(cal(F))$
- $V_1 := exp (sqrt(-1) K_1 dot.op (sigma_1^z sigma_2^z + sigma_2^z sigma_3^z + dots.c + sigma_M^z sigma_1^z)) in "End"(cal(F))$
- $V_2 := (2 sinh 2K_2)^(M/2) exp (K_2^* dot.op (sigma_1^x + sigma_2^x + dots.c + sigma_M^x)) in "End"(cal(F))$
- $Z_m := sigma_1^x dots.c sigma_(m-1)^x sigma_m^z in "End"(cal(F)) quad "ただし、" Z_1 := sigma_1^z quad ("ホロノミック量子場では" p_m)$

正し、$Z_(M+1) := Z_1$

- $Y_m := sigma_1^x dots.c sigma_(m-1)^x sigma_m^y in "End"(cal(F)) quad "ただし、" Y_1 := sigma_1^y quad ("ホロノミック量子場では" q_m)$

正し、$Y_(M+1) := Y_1$

- $K_1^* := -1/2 log(tanh K_1) arrow.l.r sinh(K_1) sinh(K_1^*) = 1$
- $K_2^* := -1/2 log(tanh K_2) arrow.l.r sinh(K_2) sinh(K_2^*) = 1$
- $c_i := cosh 2K_i, quad s_i := sinh 2K_i,$
- $c_i^* := cosh 2K_i^, quad s_i^ := sinh 2K_i^*$
- $epsilon := sigma_1^x dots.c sigma_M^x = (sqrt(-1))^M Z_1 Y_1 dots.c Y_M Y_M in "End"(cal(F))$

TODO: Z Zhatを定義

#definition[
  $
  H_1^((plus.minus)) := Y_1 Z_2 + Y_2 Z_3 + dots.c minus.plus 1_("End"(cal(F))) Y_M Z_1
  $
  $
  H_2 := Z_1 Y_1 + Z_2 Y_2 + dots.c + Z_M Y_M
  $
]

よって、
$
V_1^((plus.minus)) = exp(K_1 dot.op H_1^((plus.minus))), quad V_1^((-)) = exp(K_1 dot.op H_2)
$

#claim[$H_1^((plus.minus)), H_2$を$hat(Z),hat(Y)$で表す][
  $
  H_1^((plus.minus)) &= 1/M sum_(j in {1, dots.c, M}) (
    hat(Y)_j
    hat(Z)_(-j)^((plus.minus))
    exp(
      -
      sqrt(-1)
      (2 pi j) / M
    )
  ) \

  H_2 &= 1/M sum_(j in {1, dots.c, M}) (
    hat(Z)_(-j)^((-))
    hat(Y)_j
  )
  $
]


== $T_(V_(1))(hat(Z))$と$hat(Z),hat(Y)$の関係

#claim[
  $
  T_((V_1^((plus.minus)))^(1/2))(hat(Z)_mu^((plus.minus)))
  &=
  (V_1^((plus.minus)))^(1/2)
  dot
  hat(Z)_mu^((plus.minus))
  dot
  (V_1^((plus.minus)))^(-1/2) \
  &=
  cosh(K_1)
  dot
  hat(Z)_mu^((plus.minus))
  +
  sqrt(-1)
  exp(
    -
    sqrt(-1)
    (2 pi mu) / M
  )
  sinh(K_1)
  dot
  hat(Y)_mu
  \

  T_((V_1^((-)))^(1/2))(hat(Y)_mu)
  &=
  (V_1^((-)))^(1/2)
  dot
  hat(Y)_mu
  dot
  (V_1^((-)))^(-1/2) \
  &=
  -
  sqrt(-1)
  exp(
    -
    sqrt(-1)
    (2 pi mu) / M
  )
  hat(Z)_mu^((-))
  dot
  +
  cosh(K_1)
  dot
  hat(Y)_mu \

  T_(V_2)(hat(Z)_mu^((plus.minus)))
  &=
  V_2
  dot
  hat(Z)_mu^((plus.minus))
  dot
  V_2^(-1) \
  &=
  c_2^*
  dot
  hat(Z)_mu^((plus.minus))
  -
  sqrt(-1)
  s_2^*
  dot
  hat(Y)_mu
  \

  T_(V_2)(hat(Y)_mu)
  &=
  V_2
  dot
  hat(Y)_mu
  dot
  V_2^(-1) \
  &=
  sqrt(-1)
  s_2
  dot
  hat(Z)_mu^((-))
  +
  c_2
  dot
  hat(Y)_mu
  \
  $
]

#proof[
  
  $T_((V_1^((plus.minus)))^(1/2))(hat(Z)_mu^((plus.minus)))$について、

  $
  T_((V_1^((plus.minus)))^(1/2))(hat(Z)_mu^((plus.minus)))
  &=
  (V_1^((plus.minus)))^(1/2)
  dot
  hat(Z)_mu^((plus.minus))
  dot
  (V_1^((plus.minus)))^(-1/2) \
  &=
  (exp(K_1 dot.op H_1^((plus.minus))))^(1/2)
  dot
  hat(Z)_mu^((plus.minus))
  dot
  (exp(K_1 dot.op H_1^((plus.minus))))^(-1/2) \
  $
]

次回 (9/1)
- 公式 : $e^(X) Y e^(-X) = e^("ad"(X))(Y)$ を、リー郡リー間を勉強して理解する

#definition[
  $G:$リー群, $frak(g):$リー環

  #mapDef("Ad", $G$, $"Aut"(G)$, $g$, $(x -> g x g^(-1))$, "")
  #mapDef("ad", $frak(g)$, $"End"(frak(g))$, $X$, $(Y -> [X, Y])$, "")
]

#theorem("Lie Groups, Lie Algebras, and Representations excise 14/Proposition 3.35")[
  
  $frak(g):$リー環
  X, Y in frak(g)について、
  $
    ("ad"(X) compose "ad"(X) compose dots compose "ad"(X))(Y) = sum_(k=0)^m binom(m, k) X^k Y(-X)^(m-k)

  $
  #proof[
次回(9/8)
- ここから

  ]
  
]


#theorem[
  $G:$リー群, $frak(g):$リー環
  
  準同型 $phi:G -> G$について、微分 $dif phi:frak(g) -> frak(g)$が考えられ、以下を満たす

  $
  phi(exp(X)) = exp(dif phi(X))
  $
]

$

$


= 全体のノリ
- 分配関数を行列環の元に対応させる $<-$ これの固有値を求めたい
- その元が、行列環の「群をなす部分集合(かつ次元の低い部分空間の中にある)」の元だとわかると、リー群 リー環の対応によって計算が進む
- なので、行列環とクリフォード代数の同型が見つけたい
  - かつ、分配関数がクリフォード群の元に対応するとわかりたい