#import "@preview/cetz:0.1.2"
#import "@preview/commute:0.2.0": node, arr, commutative-diagram
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge
#import "theorem.typ": theorem, claim, proof, definition, note, theorem_rules

#set block(breakable: false)
#show: theorem_rules.with(qed-symbol: $square$)

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
#theorem(none)[
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

#definition(none)[
  有限次元線型空間 $V$ 

  $exp : "End"(V) -> "End"(V)$を以下のように定める。

  線型写像 $X in "End"(V)$ について、
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

#definition(none)[
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


== $e^(X) Y e^(-X) = e^("ad"(X))(Y)$ の証明
=== リー群リー環を使うノリ
*参考) Lie群とLie環1 の 定理 5.49*

#box[
  #diagram(
    cell-size: 15mm,
    $
      frak(g) edge(dif phi, ->) edge("d", exp, ->) & frak(h) edge("d", exp, ->) \
      G edge(phi, ->) & H
    $
  )
]

$G, H:$ Lie群, 連続な準同型写像 $phi: G -> H$ について、
- $phi$は$C^(omega)$級である。
- Lie環$frak(g) := "Lie"(G)$から$frak(h) := "Lie"(H)$への準同型写像$dif phi_(e): frak(g) -> frak(h)$が存在し、$phi(exp(X)) = exp(dif phi_(e)(X))$を満たす。

この定理の証明を参考に、以下の定理を示したい。
#definition(none)[
  $G:$リー群, $frak(g):$リー環

  #mapDef("Ad", $G$, $"Aut"(G)$, $g$, $(x -> g x g^(-1))$, "")
  #mapDef("ad", $frak(g)$, $"End"(frak(g))$, $X$, $(Y -> [X, Y])$, "")
]
#theorem(none)[
  $G:$ Lie群, $frak(g):$ Lie環

  $
    "Ad"(exp(X))= exp("ad"(X))
  $
  #proof[
    TODO:
    もし、$"Aut"(G)$がLie群であり、$"End"(frak(g))$がそれに付随するLie環(接空間)であるならば、上の定理がそのまま使える。
    そうでないなら、$phi$を$G->"Aut"(H)$とした別の定理を示す必要がある。
  ]
]


=== 式変形を頑張るノリ

- $M(n:CC)$を$CC^(n times n)$と同一視することで、$M(n:CC)$上に内積が定まる
- その内積からノルムと距離が定まる
- そのノルムから具体的な位相が定まるので、収束の議論がわかりやすくできる
   - 「収束」の定義だけしておく。一般の位相構造には触れないで良いのでは？

#definition([$M(n:CC)$の内積])[TODO]
#definition([$M(n:CC)$のノルム])[TODO]
#definition([$M(n:CC)$の収束])[TODO]

#theorem("Lie Groups, Lie Algebras, and Representations excise 14")[
  $K := bb(R)$もしくは$bb(C)$, $d in bold(Z)_(gt.eq)$

  $X, Y in M(K, d)$について、
  
  $
    overbrace(
      #$[X, [X, dots.c , [X, Y] dots.c ]$,
      m "times"
    )
    =
    sum_(k=0)^m binom(m, k) X^k Y(-X)^(m-k)
  $
  #proof[
    TODO:
    帰納法で行ける
  ]
]

#definition("Lie Groups, Lie Algebras, and Representations Definition 1.4")[
  $"GL"(n, CC) := { x"は可逆" | x in "M"(n, CC)}$

  このとき、$"GL"(n, CC)$は群になる。
  
  TODO: これを2組でちゃんと書く

  $bold("GL")(n, CC) := ("GL"(n, CC), dot)$
]

#definition("Lie Groups, Lie Algebras, and Representations Definition 1.4")[
  $G subset bold("GL")(n, CC)$ で、以下の性質を満たす
  1. $G$は部分群
  2. $forall A_m : M(n, CC)"上収束する"G"の元の列" A := lim_(m->oo) A_m"とするとき、"A in G or A in.not bold("GL")(n, CC) $

  このとき、$G$を Matrix Lie群という
]

// #definition("Lie Groups, Lie Algebras, and Representations Definition 3.18")[
//   $G$ : Matrix Lie群について、

//   $frak(g) := {X in M(n, CC) | exp(t X) in G "for all" t in RR}$

//   $frak(g)$を$G$のLie環という
// ]

// #theorem([$frak(g)$が和と交換子で閉じていることの証明])[
//   TODO
// ]

// #definition([$G$と$frak(g)$の共通集合])[
//   $cal(G) subset M(n, CC)$を、
//   $
//   cal(G) := G sect frak(g)
//   $
//   と定める。
// ]


#definition("Lie Groups, Lie Algebras, and Representations Definition 3.32")[
  // $G$ : Matrix Lie群, $frak(g)$ : $G$のLie環
  $G$ : Matrix Lie群

  $g in G$について、
  #mapDef($"Ad"_g$, $G$, $G$, $h$, $g h g^(-1)$, "")

  // $X in frak(g)$について、
  // #mapDef($"ad"_X$, $frak(g)$, $frak(g)$, $Y$, $[X, Y]$, "")
  $X in M(n, CC)$について、
  #mapDef($"ad"_X$, $M(n, CC)$, $M(n, CC)$, $Y$, $[X, Y]$, "")
]

#theorem("Lie Groups, Lie Algebras, and Representations Proposition 3.35")[
  // $forall X in frak(g), forall Y in cal(G)$
  $forall X, Y in M(n, CC)$

  $
  e^(op("ad")_X)(Y)
  &= sum_(n=0)^(infinity) (1/n!) overbrace(
      #$[X, [X, dots.c , [X, Y] dots.c ]$,
      n "times"
    )\
  &= Y + [X, Y] + 1/2 [X, [X, Y]] + 1/6 [X, [X, [X, Y]]] + dots
  $

  ただし、$overbrace(
    #$[X, [X, dots.c , [X, Y] dots.c ]$,
    0 "times"
  )
  =
  Y$
  とする。
]<brianhall_exc14>

#theorem("Lie Groups, Lie Algebras, and Representations Proposition 3.35")[
  // $forall X in frak(g), forall Y in cal(G)$
  $forall X in M(n, CC) s.t. (forall t in RR exp(t X) in G), forall Y in G$

  $
  exp(X) Y exp(-X) = op("Ad")_(exp(X))(Y) = exp(op("ad")_X)(Y)
  $
]<brianhall_3.35>

TODO: 一旦 $e^(X) Y e^(-X) = e^("ad"(X))(Y)$ (@brianhall_3.35) の証明は後回して、これが成り立ってるとして計算がどう進むかを見てみる

== $T_(V_(1))(hat(Z))$と$hat(Z),hat(Y)$の関係

#claim([$H_1^((plus.minus))$,$H_2$と$hat(Z)_mu^((plus.minus))$, $hat(Y)_mu$の交換関係])[
  $ 
    [H_1^((plus.minus)), hat(Z)_mu^((plus.minus))] 
    &= 
    -2 exp(
        -sqrt(-1) (2 pi mu)/(M)
    )
    dot.op
    hat(Y)_mu
    \

    [H_1^((plus.minus)), hat(Y)_mu] 
    &= 
    2 exp(
        -sqrt(-1) (2 pi mu)/(M)
    )
    dot.op
    hat(Z)_mu^((plus.minus))
    \

    [H_2, hat(Z)_mu^((plus.minus))] 
    &= 
    2
    dot.op
    hat(Y)_mu
    \

    [H_2, hat(Y)_mu] 
    &= 
    -2
    dot.op
    hat(Z)_mu^((-))
    \
    $
]

#claim(none)[
  $n >= 0$について、
  $
    overbrace(
      [
        K_1 dot.op H_1^((plus.minus)),
        dots,
        [K_1 dot.op H_1^((plus.minus)), hat(Z)_mu^((plus.minus))]
        dots
      ]
      ,
      n "times"
    )
    =
    cases(
      (-1)^((n+1)/2)
      dot.op
      (2 K_1 exp(-sqrt(-1) (2 pi mu)/(M)))^(n)
      dot.op
      hat(Y)_mu
      & (n "is odd"),
      (-1)^(n/2)
      dot.op
      (2 K_1 exp(-sqrt(-1) (2 pi mu)/(M)))^(n)
      dot.op
      hat(Z)_mu^((plus.minus))
      & (n "is even"),
    )
  $

  #note[
    $n = 0$
    $
    overbrace(
      [
        K_1 dot.op H_1^((plus.minus)),
        dots,
        [K_1 dot.op H_1^((plus.minus)), hat(Z)_mu^((plus.minus))]
        dots
      ]
      ,
      0 "times"
    )
    =
    hat(Z)_mu^((plus.minus))
    $
    $n = 1$
    $
    [
      K_1 dot.op H_1^((plus.minus)),
      hat(Z)_mu^((plus.minus))
    ]
    &=
    (-1)^(1) dot.op 2 K_1 exp(-sqrt(-1) (2 pi mu)/(M)) dot.op hat(Y)_mu
    $

    $n = 2$
    $
    [
      K_1 dot.op H_1^((plus.minus)),
      [
        K_1 dot.op H_1^((plus.minus)),
        hat(Z)_mu^((plus.minus))
      ]
    ]
    &=
    K_1
    dot.op
    -2 K_1 exp(-sqrt(-1) (2 pi mu)/(M))
    dot.op
    [
      H_1^((plus.minus)),
      hat(Y)_mu
    ]
    \
    &=
    K_1
    dot.op
    -2 K_1 exp(-sqrt(-1) (2 pi mu)/(M))
    dot.op
    2 exp(-sqrt(-1) (2 pi mu)/(M))
    dot.op
    hat(Z)_mu^((plus.minus))
    \
    &=
    (-1)^(1)
    dot.op
    (2 K_1 exp(-sqrt(-1) (2 pi mu)/(M)))^(2)
    dot.op
    hat(Z)_mu^((plus.minus))
    $

    $n = 3$
    $
    [
      K_1 dot.op H_1^((plus.minus)),
      [
        K_1 dot.op H_1^((plus.minus)),
        [
          K_1 dot.op H_1^((plus.minus)),
          hat(Z)_mu^((plus.minus))
        ]
      ]
    ]
    &=
    [
      K_1 dot.op H_1^((plus.minus)),
      (n=2)"の結果"
    ]
    \
    &=
    [
      K_1 dot.op H_1^((plus.minus)),
      (-1)^(1)
      dot.op
      (2 K_1 exp(-sqrt(-1) (2 pi mu)/(M)))^(2)
      dot.op
      hat(Z)_mu^((plus.minus))
    ]
    \
    &=
    K_1
    dot.op
    (-1)^(1)
    dot.op
    (2 K_1 exp(-sqrt(-1) (2 pi mu)/(M)))^(2)
    dot.op
    [
      H_1^((plus.minus)),
      hat(Z)_mu^((plus.minus))
    ]
    \
    &=
    K_1
    dot.op
    (-1)^(1)
    dot.op
    (2 K_1 exp(-sqrt(-1) (2 pi mu)/(M)))^(2)
    dot.op
    - 2 exp(-sqrt(-1) (2 pi mu)/(M))
    dot.op
    hat(Y)_mu
    \
    &=
    (-1)^(2)
    dot.op
    (2 K_1 exp(-sqrt(-1) (2 pi mu)/(M)))^(3)
    dot.op
    hat(Y)_mu
    $

    $n = 4$
    $
    [
      K_1 dot.op H_1^((plus.minus)),
      [
        K_1 dot.op H_1^((plus.minus)),
        [
          K_1 dot.op H_1^((plus.minus)),
          [
            K_1 dot.op H_1^((plus.minus)),
            hat(Z)_mu^((plus.minus))
          ]
        ]
      ]
    ]
    \
    &=
    [
      K_1 dot.op H_1^((plus.minus)),
      (n=3)"の結果"
    ]
    \
    &=
    [
      K_1 dot.op H_1^((plus.minus)),
      (-1)^(2)
      dot.op
      (2 K_1 exp(-sqrt(-1) (2 pi mu)/(M)))^(3)
      dot.op
      hat(Y)_mu
    ]
    \
    &=
    K_1
    dot.op
    (-1)^(2)
    dot.op
    (2 K_1 exp(-sqrt(-1) (2 pi mu)/(M)))^(3)
    dot.op
    [
      H_1^((plus.minus)),
      hat(Y)_mu
    ]
    \
    &=
    K_1
    dot.op
    (-1)^(2)
    dot.op
    (2 K_1 exp(-sqrt(-1) (2 pi mu)/(M)))^(3)
    dot.op
    2 exp(-sqrt(-1) (2 pi mu)/(M))
    dot.op
    hat(Z)_mu^((plus.minus))
    \
    &=
    (-1)^(2)
    dot.op
    (2 K_1 exp(-sqrt(-1) (2 pi mu)/(M)))^(4)
    dot.op
    hat(Z)_mu^((plus.minus))
    $
  ]

  #proof[
    TODO : note参考にして、帰納法で行ける
  ]
]<nesting_of_commutator_of_H_and_Z>



#claim("ホロノミック量子場 p142下段 1>")[
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

  #note[  
    $
    exp(X) Y exp(-X) = op("Ad")_(exp(X))(Y) = exp(op("ad")_X)(Y) = e^(op("ad")_X)(Y) = Y + [X, Y] + 1/2 [X, [X, Y]] + dots
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
    (exp(K_1 dot.op H_1^((plus.minus))))^(-1/2)\
    &=
    hat(Z)_mu^((plus.minus))
    +
    [
      K_1 dot.op H_1^((plus.minus)), hat(Z)_mu^((plus.minus))
    ]
    +
    1/2 [
      K_1 dot.op H_1^((plus.minus)), [
        K_1 dot.op H_1^((plus.minus)), hat(Z)_mu^((plus.minus))
      ]
    ]
    +
    dots
    quad (because #ref(<brianhall_exc14>) ) \
    &=
    hat(Z)_mu^((plus.minus))
    +
    (-1)^(1) (2 K_1 exp(-sqrt(-1) (2 pi mu)/(M)))^(1)
    dot.op
    hat(Y)_mu
    \
    &quad +
    1/2
    dot.op
    (-1)^(1) (2 K_1 exp(-sqrt(-1) (2 pi mu)/(M)))^(2)
    dot.op
    hat(Z)_mu^((plus.minus))
    \
    &quad +
    1/6
    dot.op
    (-1)^(2) (2 K_1 exp(-sqrt(-1) (2 pi mu)/(M)))^(3)
    dot.op
    hat(Y)_mu
    \
    &quad +
    dots
    \
    &quad quad (because #ref(<nesting_of_commutator_of_H_and_Z>) ) \
    \
    &=
    (
      sum_(n=0 \ n "is even")^(infinity)
        (1/n!) 
        dot.op
        (-1)^(n/2)
        dot.op
        (2 K_1 exp(-sqrt(-1) (2 pi mu)/(M)))^(n)
    )
    dot.op
    hat(Z)_mu^((plus.minus))
    \
    &quad +
    (
      sum_(n=0 \ n "is odd")^(infinity)
        (1/n!)
        dot.op
        (-1)^((n+1)/2)
        dot.op
        (2 K_1 exp(-sqrt(-1) (2 pi mu)/(M)))^(n)
    )
    dot.op
    hat(Y)_mu
    $
  ]
]<ホロノミック量子場_p142下段_1>


次回(10/27)
- ↑の @ホロノミック量子場_p142下段_1 のproofを続ける
- Lie Groups, Lie Algebras, and RepresentationsのProposition 3.35.の証明の概略はたどりたい
  - 続き
  - 公式の意味は定まったので、計算は進みそう
      - Lie群であることはどこで使われるか？(収束性の話)
- 文献管理 Bibliography https://typst.app/docs/reference/model/bibliography/ やってみる


= 全体のノリ
- 分配関数を行列環の元のtraceに対応させる $<-$ この元の固有値を求めたい
- その元が、行列環の「群をなす部分集合(かつ次元の低い部分空間の中にある)」の元だとわかると、リー群 リー環の対応によって計算が進む
- なので、行列環とクリフォード代数の同型が見つけたい
  - かつ、分配関数がクリフォード群の元のtraceに対応するとわかりたい