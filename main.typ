#import "@preview/cetz:0.1.2"
#import "@preview/commute:0.2.0": node, arr, commutative-diagram
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge
#import "theorem.typ": theorem, claim, proof, definition, note, theorem_rules

#set page(width: 60cm, height: auto)
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

== 計算公式
#theorem([$cosh, sinh$の掛け算])[
  $forall a, b in RR$

  $
    cosh(a) sinh(b) = 1/2 (sinh(a+b) - sinh(a-b)) \
    cosh(a) cosh(b) = 1/2 (cosh(a+b) + cosh(a-b)) \
  $

  #proof[
    $
      cosh(a) sinh(b)
      &=
      (exp(a) + exp(-a))/2
      (exp(b) - exp(-b))/2
      \
      &=
      1/4
      (
        (exp(a) exp(b) - exp(-a) exp(-b))
        -
        (exp(a) exp(-b) - exp(-a) exp(b))
      )
      \
      &=
      1/2
      (
        (exp(a+b) - exp(-(a+b)))/2
        -
        (exp(a-b) - exp(-(a-b)))/2
      )
      \
      &=
      1/2
      (
        sinh(a+b)
        -
        sinh(a-b)
      )
      \
      cosh(a) cosh(b)
      &=
      (exp(a) + exp(-a))/2
      (exp(b) + exp(-b))/2
      \
      &=
      1/4
      (
        (exp(a) exp(b) + exp(-a) exp(-b))
        +
        (exp(a) exp(-b) + exp(-a) exp(b))
      )
      \
      &=
      1/2
      (
        (exp(a+b) + exp(-(a+b)))/2
        +
        (exp(a-b) + exp(-(a-b)))/2
      )
      \
      &=
      1/2
      (
        cosh(a+b)
        +
        cosh(a-b)
      )
    $
  ]
]

#theorem("行列の分解")[
  $A in "Mat"(n, CC), a, b in CC^n$

  $
    mat(
      A a,
      A b,
    )
    =
    A
    mat(
      a,
      b,
    )
  $
]<mat_mult>

== 2次元ising模型の分配関数
#definition("格子サイズ")[
  $M, N in NN$を格子のサイズとする。
]
#definition("2次元ising模型の分配関数")[
  $Z: RR times RR -> RR$を以下のように定める。

  $frak(S) := "Map"({ 1, dots, M} times { 1, dots, N }, { -1, 1 })$として、

  $
  Z(J, J^(prime))
  :=
  sum_(
    s in frak(S)
  ) (
    exp^((
      sum_(
        i &in {1, ..., M} \
        j &in {1, ..., N}
      )
      (
        J s(i, j)s(i+1, j) + J' s(i, j)s(i, j+1)
      )
    ))
  )
  $

  #note[

    $s$は、格子の状態(スピンの配置)を表している

    $frak(S)$は、全ての状態の集合といえる
  ]
]

#definition("転送行列")[
  $V_1, V_2 in "Mat"(2^N, CC)$を以下のように定める。

  $mu, mu': {1, dots, N} -> {-1, 1}$を添え字として用いて、

  $
    (V_1)_(mu, mu')
    :&=
    delta_(mu = mu')
    exp(
      sum_(
        j &in {1, ..., N}
      ) (
        J mu(j) mu(j + 1)
      )
    )
    \
    (V_2)_(mu, mu')
    :&=
    exp(
      sum_(
        j &in {1, ..., N}
      ) (
        J' mu(j) mu'(j)
      )
    )
  $

  #note[

    $V_1$は、格子のある行内の横の相互作用を表している

    $V_2$は、それを縦に積み上げた時の隣り合う行同士の相互作用を表している

    また、$V_1$は対角行列になっている
  ]
]

#claim("転送行列による分配関数の表式")[
  $
    Z(J, J') = tr((V_1 V_2)^(M))
  $

  #proof[
    $mu ,mu': {1, dots, N} -> {-1, 1}$に対して、
    $
      (V_1 V_2)_(mu, mu')
      &=
      sum_(nu: {1, dots, N} -> {-1, 1}) (
        (V_1)_(mu, nu)
        (V_2)_(nu, mu')
      )
      \
      &=
      sum_(nu: {1, dots, N} -> {-1, 1}) (
        delta_(mu = nu)
        exp(
          sum_(
            j &in {1, ..., N}
          ) (
            J mu(j) mu(j + 1)
          )
        )
        exp(
          sum_(
            j &in {1, ..., N}
          ) (
            J' nu(j) mu'(j)
          )
        )
      )
      \
      &=
      exp(
        sum_(
          j &in {1, ..., N}
        ) (
          J mu(j) mu(j + 1)
        )
      )
      exp(
        sum_(
          j &in {1, ..., N}
        ) (
          J' mu(j) mu'(j)
        )
      )
      \
      &=
      exp(
        sum_(
          j &in {1, ..., N}
        ) (
          J mu(j) mu(j + 1)
        )
        +
        sum_(
          j &in {1, ..., N}
        ) (
          J' mu(j) mu'(j)
        )
      )
      \
      &=
      exp(
        sum_(
          j &in {1, ..., N}
        ) (
          J mu(j) mu(j + 1)
          +
          J' mu(j) mu'(j)
        )
      )
    $


  ]
]

== 線型空間の一般論
#theorem(none)[
  $m, n in Z_(>=1)$,
  $V$ : $m$次元$K$-線型空間 について、$E = { e_1, dots, e_m }$: $V$の基底とするとき、

  $forall (i_1, dots, i_k) in {1, dots, m}^(m)$

  $
    e_{i_1} times.circle dots.c times.circle e_{i_k} "は、" V^(times.circle m)"の基底である"
  $
]

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

  #proof[
    TODO: 証明略
  ]
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
- $I_("Mat"(2, CC))$: $"Mat"(2, CC)$上の単位行列
- $sigma_k^x := I_("Mat"(2, CC)) times.circle dots.c times.circle overbrace(sigma^x,k"th") times.circle dots.c times.circle I_("Mat"(2, CC)) in "Mat"(2, CC)^(times.circle M)$
- $sigma_k^y := I_("Mat"(2, CC)) times.circle dots.c times.circle overbrace(sigma^y,k"th") times.circle dots.c times.circle I_("Mat"(2, CC)) in "Mat"(2, CC)^(times.circle M)$
- $sigma_k^z := I_("Mat"(2, CC)) times.circle dots.c times.circle overbrace(sigma^z,k"th") times.circle dots.c times.circle I_("Mat"(2, CC)) in "Mat"(2, CC)^(times.circle M)$
- $I_(("Mat"(2, CC))^(times.circle M))$ := $I_("Mat"(2, CC)) times.circle dots.c times.circle I_("Mat"(2, CC))$
- $V_1 := exp (sqrt(-1) K_1 dot.op (sigma_1^z sigma_2^z + sigma_2^z sigma_3^z + dots.c + sigma_M^z sigma_1^z)) in "Mat"(2, CC)^(times.circle M)$
- $V_2 := (2 sinh 2K_2)^(M/2) exp (K_2^* dot.op (sigma_1^x + sigma_2^x + dots.c + sigma_M^x)) in "Mat"(2, CC)^(times.circle M)$

- $Z_m := sigma_1^x dots.c sigma_(m-1)^x sigma_m^z in "Mat"(2, CC)^(times.circle M) quad "ただし、" Z_1 := sigma_1^z quad ("ホロノミック量子場では" p_m)$

正し、$Z_(M+1) := Z_1$

- $Y_m := sigma_1^x dots.c sigma_(m-1)^x sigma_m^y in "Mat"(2, CC)^(times.circle M) quad "ただし、" Y_1 := sigma_1^y quad ("ホロノミック量子場では" q_m)$

正し、$Y_(M+1) := Y_1$

- $epsilon := sigma_1^x dots.c sigma_M^x = (sqrt(-1))^M Z_1 Y_1 + dots.c + Z_M Y_M in "Mat"(2, CC)^(times.circle M)$

- $K_1^* := -1/2 log(tanh K_1) arrow.l.r sinh(K_1) sinh(K_1^*) = 1$
- $K_2^* := -1/2 log(tanh K_2) arrow.l.r sinh(K_2) sinh(K_2^*) = 1$
- $c_i := cosh 2K_i, quad s_i := sinh 2K_i,$
- $c_i^* := cosh 2K_i^*, quad s_i^* := sinh 2K_i^*$

#claim([$Z_m,Y_m$は線型独立])[
  $
    { Z_1, dots, Z_M, Y_1, dots, Y_M } "は線型独立"
  $

  #proof[
    TODO: 証明略
  ]
]

#claim([$V_1, V_2$を$Z, Y, epsilon$で表す])[
  $
    V_1 = exp (sqrt(-1) K_1 dot.op (Y_1 Z_2 + Y_2 Z_3 + dots.c + Y_(M-1) Z_M - epsilon Y_M Z_1))\
    V_2 = (2 s_2)^(M/2) exp (sqrt(-1) K_2^* dot.op (Z_1 Y_1 + Z_2 Y_2 + dots.c + Z_M Y_M))
  $
  #proof[TODO]
]

#definition([$epsilon$の固有空間])[
  $
    cal(F) := (CC^2)^(times.circle M) \
    cal(F)^((plus.minus)) := { f in cal(F) | epsilon f = plus.minus f }
  $

  #note[
    $epsilon^2 = 1$ なので、$epsilon$の固有値は$plus.minus 1$ (?:ちょっと計算いる？)
  ]
]

#definition([$"End"(cal(F))と"Mat"(2, CC)^(times.circle M)$の同型])[
  $"End"(cal(F))$と$"Mat"(2, CC)^(times.circle M)$の線形同型写像 を一つ取り、
  $
    bold("end"): "End"(cal(F)) -> "Mat"(2, CC)^(times.circle M)
  $
  とおく。
]


#claim([$V_1$の固有空間への制限])[
  $
    (bold("end")(V_1))|_(cal(F)^((plus.minus))) = (bold("end")( exp (sqrt(-1) K_1 dot.op (Y_1 Z_2 + Y_2 Z_3 + dots.c + Y_(M-1) Z_M minus.plus Y_M Z_1))))|_(cal(F)^((plus.minus)))
  $

  #proof[
    TODO
  ]
]

#definition($V_1^((plus.minus))$)[
  $
    V_1^((plus.minus)) := exp (sqrt(-1) K_1 dot.op (Y_1 Z_2 + Y_2 Z_3 + dots.c + Y_(M-1) Z_M minus.plus Y_M Z_1))
  $

  #note[
    上のclaimがこの定義の正当性を担保している
  ]
]

#definition([$delta^M_((mu, nu))$])[
  $$
  $
  delta_(P) :=
  cases(
    1 & quad P "is True",
    0 & quad P "is False"
  )
  $
]

TODO: ↑こんな感じの定義の方が読みやすく汎用性も高そうなので置き換えたい

#definition([$delta^M_((mu, nu))$])[
  $$
  $
  delta^M_((mu, nu)) :=
  cases(
    1 & (mu equiv nu mod M),
    0 & (mu equiv.not nu mod M)
  )
  $
]

#claim(none)[
  $k in ZZ "について、"$
  $
    \
    sum_(j=1)^M exp(k dot (2 pi sqrt(-1) j)/M) = M delta^M_((k, 0))
  $

  #proof[
    $(a) k equiv 0 mod M$のとき、
    $l in ZZ$を用いて$k = l M$とおけるので、
    $
      sum_(j=1)^M exp(l M dot.op (2 pi sqrt(-1) j)/M)
      &= sum_(j=1)^M exp(l dot.op 2 pi sqrt(-1) j)
      \
      &= sum_(j=1)^M cos(2 pi l j) + sqrt(-1) sin(2 pi l j)
      \
      &= sum_(j=1)^M (1 + sqrt(-1) dot.op 0)
      \
      &= sum_(j=1)^M 1
      = M
    $

    $(b)$その他のとき、
    $
      sum_(j=1)^M exp(k dot.op (2 pi sqrt(-1) j)/M)
      &=
      overbrace(
        exp(k dot.op (2 pi sqrt(-1))/M)
        ,
        "初項"
      )
      dot.op
      (
        1
        -
        (
          overbrace(
            exp(k dot.op (2 pi sqrt(-1))/M)
            ,
            "公比"
          )
        )
        ^M
      )
      /
      (
        1
        -
        overbrace(
          exp(k dot.op (2 pi sqrt(-1))/M)
          ,
          "公比"
        )
      )
      \
      &=
      (
        overbrace(
          exp(k dot.op (2 pi sqrt(-1))/M)
          ,
          "初項"
        )
      )
      /
      (
        1
        -
        overbrace(
          exp(k dot.op (2 pi sqrt(-1))/M)
          ,
          "公比"
        )
      )
      dot.op
      (
        1
        -
        (
          overbrace(
            exp(k dot.op (2 pi sqrt(-1))/M)
            ,
            "公比"
          )
        )
        ^M
      )
      \
      &=
      (
        exp(k dot.op (2 pi sqrt(-1))/M)
      )
      /
      (
        1
        -
        exp(k dot.op (2 pi sqrt(-1))/M)
      )
      dot.op
      (
        1
        -
        exp(k dot.op (2 pi sqrt(-1))/M dot.op M)
      )
      \
      &=
      (
        exp(k dot.op (2 pi sqrt(-1))/M)
      )
      /
      (
        1
        -
        exp(k dot.op (2 pi sqrt(-1))/M)
      )
      dot.op
      (
        1
        -
        underbrace(
          exp(k dot.op 2 pi sqrt(-1))
          ,
          1
        )
      )
      \
      &=
      0
    $
  ]
]<exp_sum>

#definition($hat(Z), hat(Y)"の定義"$)[
  $cal(M) := {-M, dots, -2, -1, 1, 2, dots, M}$ とする。

  $mu in cal(M)$について、

  $
  hat(Z)_mu^((plus.minus))
  :&= 
  sum_(j=1)^M (
    (
      cases(
        minus.plus 1 "if" j = 1,
        1 "if" j != 1,
      )
    )
    dot
    Z_j
    exp(
      -
      sqrt(-1)
      j
      (2 pi mu) / M
    )
  )
  \
  &=
  minus.plus
  Z_1
  exp(
    -
    sqrt(-1)
    (2 pi mu) / M
  )
  +
  sum_(j=2)^M (
    Z_j
    exp(
      -
      sqrt(-1)
      j
      (2 pi mu) / M
    )
  )
  \
  hat(Y)_mu
  :&=
  sum_(j=1)^M (
    Y_j
    exp(
      -
      sqrt(-1)
      j
      (2 pi mu) / M
    )
  )
  $
]

#definition(none)[
  $
  H_1^((plus.minus)) :&= Y_1 Z_2 + Y_2 Z_3 + dots.c + Y_(M-1) Z_M minus.plus Y_M Z_1 \
  H_2 :&= Z_1 Y_1 + Z_2 Y_2 + dots.c + Z_M Y_M
  $
]

よって、
$
V_1^((plus.minus)) &= exp(sqrt(-1) K_1 dot.op H_1^((plus.minus)))
\
V_2 &= (2s_2)^(M/2)exp(sqrt(-1) K_2^* dot.op H_2)
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

  #note[
    $
    hat(Z)_mu^((plus.minus))
    &:= 
    sum_(j=1)^M (
      (
        cases(
          1 "if" j != 1,
          minus.plus 1 "if" j = 1
        )
      )
      dot
      Z_j
      exp(
        -
        sqrt(-1)
        j
        (2 pi mu) / M
      )
    )
    \
    &=
    minus.plus
    Z_1
    exp(
      -
      sqrt(-1)
      (2 pi mu) / M
    )
    +
    sum_(j=2)^M (
      Z_j
      exp(
        -
        sqrt(-1)
        j
        (2 pi mu) / M
      )
    )
    \
    hat(Y)_mu
    &:=
    sum_(j=1)^M (
      Y_j
      exp(
        -
        sqrt(-1)
        j
        (2 pi mu) / M
      )
    )
    $

    $
      sum_(j=1)^M exp(k dot (2 pi sqrt(-1) j)/M) = M delta^M_((k, 0))
    $
  ]

  #proof[
    $H_1^((plus.minus))$について、
    $
    "(右辺)"
    &=
    1/M sum_(j in {1, dots.c, M}) (
      hat(Y)_j
      hat(Z)_(-j)^((plus.minus))
      exp(
        -
        sqrt(-1)
        (2 pi j) / M
      )
    ) 
    \
    &=
    1/M sum_(j in {1, dots.c, M}) (
      overbrace(
        (
          sum_(k_1=1)^M (
            Y_(k_1)
            exp(
              -
              sqrt(-1)
              k_1
              (2 pi j) / M
            )
          )
        ),
        hat(Y)_j
      )
      dot.c
      overbrace(
        (
          sum_(k_2=1)^M (
            (
              cases(
                1 "if" k_2 != 1,
                minus.plus 1 "if" k_2 = 1
              )
            )
            dot
            Z_(k_2)
            exp(
              -
              sqrt(-1)
              k_2
              (2 pi (-j)) / M
            )
          )
        ),
        hat(Z)_(-j)^((plus.minus))
      )
      exp(
        -
        sqrt(-1)
        (2 pi j) / M
      )
    ) 
    \
    &=
    1/M sum_(j in {1, dots.c, M}) (
      sum_(k_1, k_2=1)^M (
        (
          Y_(k_1)
          exp(
            -
            sqrt(-1)
            k_1
            (2 pi j) / M
          )
        )
        dot.c
        (
          (
            cases(
              1 "if" k_2 != 1,
              minus.plus 1 "if" k_2 = 1,
            )
          )
          dot
          Z_(k_2)
          exp(
            -
            sqrt(-1)
            k_2
            (2 pi (-j)) / M
          )
        )
      )
      exp(
        -
        sqrt(-1)
        (2 pi j) / M
      )
    ) 
    \
    &=
    1/M sum_(j in {1, dots.c, M}) (
      sum_(k_1, k_2=1)^M (
        (
          Y_(k_1)
        )
        dot.c
        (
          (
            cases(
              1 "if" k_2 != 1,
              minus.plus 1 "if" k_2 = 1,
            )
          )
          dot
          Z_(k_2)
        )
        dot.c
        exp(
          -
          sqrt(-1)
          k_1
          (2 pi j) / M
        )
        dot.c
        exp(
          -
          sqrt(-1)
          k_2
          (2 pi (-j)) / M
        )
        dot.c
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
      )
    ) 
    \
    &quad quad ("expを後ろに移動")
    \
    &=
    1/M sum_(j in {1, dots.c, M}) (
      sum_(k_1, k_2=1)^M (
        (
          cases(
            1 "if" k_2 != 1,
            minus.plus 1 "if" k_2 = 1,
          )
        )
        dot.c
        exp(
          -
          sqrt(-1)
          k_1
          (2 pi j) / M
        )
        dot.c
        exp(
          -
          sqrt(-1)
          k_2
          (2 pi (-j)) / M
        )
        dot.c
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.c
        (
          Y_(k_1)
          Z_(k_2)
        )
      )
    ) 
    \
    &quad quad ("符号を前に、YZを後ろに移動")
    \
    &=
    1/M sum_(j in {1, dots.c, M}) (
      sum_(k_1, k_2=1)^M (
        (
          cases(
            1 "if" k_2 != 1,
            minus.plus 1 "if" k_2 = 1,
          )
        )
        dot.c
        exp(
          -
          sqrt(-1)
          k_1
          (2 pi j) / M
          -
          sqrt(-1)
          k_2
          (2 pi (-j)) / M
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.c
        (
          Y_(k_1)
          Z_(k_2)
        )
      )
    ) 
    \
    &quad quad ("expをまとめる")
    \
    &=
    1/M sum_(j in {1, dots.c, M}) (
      sum_(k_1, k_2=1)^M (
        (
          cases(
            1 "if" k_2 != 1,
            minus.plus 1 "if" k_2 = 1,
          )
        )
        dot.c
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
          (
            k_1
            -
            k_2
            +
            1
          )
        )
        dot.c
        (
          Y_(k_1)
          Z_(k_2)
        )
      )
    ) 
    \
    &=
    1/M (
      sum_(k_1, k_2=1)^M (
        (
          cases(
            1 "if" k_2 != 1,
            minus.plus 1 "if" k_2 = 1,
          )
        )
        dot.c
        sum_(j in {1, dots.c, M}) (
          exp(
            -
            sqrt(-1)
            (2 pi j) / M
            (
              k_1
              -
              k_2
              +
              1
            )
          )
        )
        dot.c
        (
          Y_(k_1)
          Z_(k_2)
        )
      )
    ) 
    \
    &=
    1/M (
      sum_(k_1, k_2=1)^M (
        (
          cases(
            1 "if" k_2 != 1,
            minus.plus 1 "if" k_2 = 1,
          )
        )
        dot.c
        sum_(j in {1, dots.c, M}) (
          exp(
            -
            (
              k_1
              -
              k_2
              +
              1
            )
            sqrt(-1)
            (2 pi j) / M
          )
        )
        dot.c
        (
          Y_(k_1)
          Z_(k_2)
        )
      )
    )
    \
    &=
    1/M (
      sum_(k_1, k_2=1)^M (
        (
          cases(
            1 "if" k_2 != 1,
            minus.plus 1 "if" k_2 = 1,
          )
        )
        dot.c
        M delta^M_((
          -
          (
            k_1
            -
            k_2
            +
            1
          ),
          0
        ))
        dot.c
        (
          Y_(k_1)
          Z_(k_2)
        )
      )
    )
    \
    &quad quad (because #ref(<exp_sum>))
    \
    &=
    1/M (
      sum_(k_1, k_2 in {1, dots, M} \ -(k_1-k_2+1) equiv 0 mod M) (
        (
          cases(
            1 "if" k_2 != 1,
            minus.plus 1 "if" k_2 = 1,
          )
        )
        dot.c
        M
        dot.c
        (
          Y_(k_1)
          Z_(k_2)
        )
      )
    )
    \
    &=
    1/M (
      sum_(k_1 in {1, dots, M} \ k_2 in {2, dots, M} \ -(k_1-k_2+1) equiv 0 mod M) (
        M
        dot.c
        (
          Y_(k_1)
          Z_(k_2)
        )
      )
    )
    +
    1/M (
      sum_(k_1 in {1, dots, M} \ -k_1 equiv 0 mod M) (
        minus.plus
        M
        dot.c
        (
          Y_(k_1)
          Z_(1)
        )
      )
    )
    \
    &=
    (
      overbrace(
        Y_1 Z_2 + Y_2 Z_3 + dots.c + Y_(M-1) Z_M,
        because k_1 in {1, dots, M} and k_2 in {2, dots, M} and -(k_1-k_2+1) equiv 0 mod M
          \ => k_1 in {1, dots, M} and k_2 in {2, dots, M} and k_1 equiv k_2-1 mod M
          \ => k_1 in {1, dots, M} and k_2-1 in {1, dots, M-1} and k_1 equiv k_2-1 mod M
          \ => k_1 in {1, dots, M-1} and k_1 = k_2-1
          \ (because k_2-1 in {1, dots, M-1}"かつ"k_1 equiv k_2-1 mod M"を満たすような"k_1"は"{1, dots, M-1}"に限る")
      )
    )
    +
    (
      overbrace(
        minus.plus
        (
          Y_((M))
          Z_(1)
        ),
        because k_1 in {1, dots, M} and -k_1 equiv 0 mod M => k_1 = M
      )
    )
    \
    &=
    H_1^((plus.minus))
    \
    qed
    $

    $H_2$について、
    $
    "(右辺)"
    &=
    1/M sum_(j in {1, dots.c, M}) (
      hat(Z)_(-j)^((-))
      hat(Y)_j
    )
    \
    &=
    1/M
    sum_(j in {1, dots.c, M}) (
      overbrace(
        (
          sum_(k_1=1)^M (
            (
              cases(
                1 "if" k_1 != 1,
                plus 1 "if" k_1 = 1
              )
            )
            dot.op
            Z_k_1
            dot.op
            exp(
              -
              sqrt(-1)
              k_1
              (2 pi (-j)) / M
            )
          )
        ),
        hat(Z)_(-j)^((-))
      )
      dot.op
      overbrace(
        (
          sum_(k_2=1)^M (
            Y_(k_2)
            dot.op
            exp(
              -
              sqrt(-1)
              k_2
              (2 pi j) / M
            )
          )
        ),
        hat(Y)_j
      )
    )
    \
    &=
    1/M
    sum_(j in {1, dots.c, M}) (
      (
        sum_(k_1=1)^M (
          Z_k_1
          dot.op
          exp(
            -
            sqrt(-1)
            k_1
            (2 pi (-j)) / M
          )
        )
      )
      dot.op
      (
        sum_(k_2=1)^M (
          Y_(k_2)
          dot.op
          exp(
            -
            sqrt(-1)
            k_2
            (2 pi j) / M
          )
        )
      )
    )
    \
    &=
    1/M
    sum_(j in {1, dots.c, M}) (
      (
        sum_(k_1, k_2=1)^M (
          (
            Z_k_1
            dot.op
            exp(
              -
              sqrt(-1)
              k_1
              (2 pi (-j)) / M
            )
          )
          dot.op
          (
            Y_(k_2)
            dot.op
            exp(
              -
              sqrt(-1)
              k_2
              (2 pi j) / M
            )
          )
        )
      )
    )
    \
    &=
    1/M
    sum_(j in {1, dots.c, M}) (
      (
        sum_(k_1, k_2=1)^M (
          exp(
            -
            sqrt(-1)
            k_1
            (2 pi (-j)) / M
          )
          dot.op
          exp(
            -
            sqrt(-1)
            k_2
            (2 pi j) / M
          )
          dot.op
          Z_k_1
          Y_(k_2)
        )
      )
    )
    \
    &=
    1/M
    sum_(j in {1, dots.c, M}) (
      (
        sum_(k_1, k_2=1)^M (
          exp(
            -
            sqrt(-1)
            k_1
            (2 pi (-j)) / M
            -
            sqrt(-1)
            k_2
            (2 pi j) / M
          )
          dot.op
          Z_k_1
          Y_(k_2)
        )
      )
    )
    \
    &=
    1/M
    (
      sum_(k_1, k_2=1)^M (
        underbrace(
          sum_(j in {1, dots.c, M}) (
            exp(
              (
                k_1
                -
                k_2
              )
              dot.op
              (2 pi sqrt(-1) j) / M
            )
          ),
          #ref(<exp_sum>)"を適用"
        )
        dot.op
        Z_k_1
        Y_(k_2)
      )
    )
    \
    &=
    1/M
    sum_(k_1, k_2=1)^M (
      overbrace(
        M delta^M_((k_1-k_2, 0)),
        because #ref(<exp_sum>)
      )
      dot.op
      Z_k_1
      Y_(k_2)
    )
    \
    &=
    sum_(k_1, k_2=1)^M (
      delta^M_((k_1-k_2, 0))
      dot.op
      Z_k_1
      Y_(k_2)
    )
    \
    &=
    sum_(
      k_1 in {1, dots, M} \
      k_2 in {1, dots, M} \
      k_1 - k_2 equiv 0 mod M
    ) (
      Z_k_1
      Y_(k_2)
    )
    \
    &=
    sum_(
      k_1 in {1, dots, M} \
      k_1 = k_2
    ) (
      Z_k_1
      Y_(k_2)
    )
    \
    &=
    Z_1 Y_1 + Z_2 Y_2 + dots.c + Z_M Y_M
    \
    &=
    H_2
    \
    qed
    $
  ]
]


== $e^(X) Y e^(-X) = e^("ad"(X))(Y)$ の証明
=== リー群リー環を使うノリ
*参考) Lie群とLie環1 の 定理 5.49*

// #box[
//   #diagram(
//     cell-size: 15mm,
//     $
//       frak(g) edge(dif phi, ->) edge("d", exp, ->) & frak(h) edge("d", exp, ->) \
//       G edge(phi, ->) & H
//     $
//   )
// ]

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

== $Z$と$Y$の反交換関係
#claim([$Z$と$Y$の反交換関係])[
  $
  [Z_mu, Z_nu]_+ = 2I_((CC^2)^(times.circle M)) delta^M_((mu, nu)), quad
  [Z_mu, Y_nu]_+ = 0, quad
  [Y_mu, Y_nu]_+ = 2I_((CC^2)^(times.circle M)) delta^M_((mu, nu))
  $

  #proof[
    $mu, nu in M$について、

    $mu = nu$ のとき、
    $
    [Z_mu, Z_mu]_+
    &=
    Z_mu Z_mu + Z_mu Z_mu
    \
    &=
    2 I_((CC^2)^(times.circle M))
    $

    $mu < nu$のとき、
    $
    [Z_mu, Z_nu]_+
    &=
    Z_mu Z_nu + Z_nu Z_mu
    \
    &=
    (sigma_1^x dots.c sigma_(mu-1)^x dot.op sigma_mu^z)
    dot.op 
    (sigma_1^x dots.c sigma_mu^x dots.c sigma_(nu-1)^x sigma_nu^z)
    +
    (sigma_1^x dots.c sigma_mu^x dots.c sigma_(nu-1)^x sigma_nu^z)
    dot.op
    (sigma_1^x dots.c sigma_(mu-1)^x dot.op sigma_mu^z)
    \
    &=
    (
      sigma^x 
      times.circle dots.c times.circle 
      overbrace(sigma^x,mu-1"th") 
      times.circle 
      overbrace(sigma^z,mu"th")
    )
    dot.op
    (
      sigma^x
      times.circle dots.c times.circle 
      overbrace(sigma^x,mu-1"th") 
      times.circle 
      overbrace(sigma^x,mu"th") 
      times.circle dots.c times.circle 
      overbrace(sigma^x,nu-1"th") 
      times.circle 
      overbrace(sigma^z,nu)
    )
    \
    &quad +
    (
      sigma^x
      times.circle dots.c times.circle 
      overbrace(sigma^x,mu-1"th") 
      times.circle 
      overbrace(sigma^x,mu"th") 
      times.circle dots.c times.circle 
      overbrace(sigma^x,nu-1"th") 
      times.circle 
      overbrace(sigma^z,nu)
    )
    dot.op
    (
      sigma^x 
      times.circle dots.c times.circle 
      overbrace(sigma^x,mu-1"th") 
      times.circle 
      overbrace(sigma^z,mu"th")
    )
    \
    &=
    (
      sigma^x dot.op sigma^x
      times.circle dots.c times.circle 
      overbrace(sigma^x dot.op sigma^x,mu-1"th") 
      times.circle 
      overbrace(sigma^z dot.op sigma^x,mu"th")
      times.circle 
      overbrace(sigma^x,mu+1"th")
      times.circle dots.c times.circle
      overbrace(sigma^x,nu-1"th")
      times.circle
      overbrace(sigma^z,nu)
    )
    \
    &quad +
    (
      sigma^x dot.op sigma^x
      times.circle dots.c times.circle 
      overbrace(sigma^x dot.op sigma^x,mu-1"th") 
      times.circle 
      overbrace(sigma^x dot.op sigma^z,mu"th")
      times.circle 
      overbrace(sigma^x,mu+1"th")
      times.circle dots.c times.circle
      overbrace(sigma^x,nu-1"th")
      times.circle
      overbrace(sigma^z,nu)
    )
    \
    &=
    (
      I_((CC^2)^(times.circle M))
      times.circle dots.c times.circle 
      overbrace(I_((CC^2)^(times.circle M)),mu-1"th") 
      times.circle 
      overbrace(sigma^z dot.op sigma^x,mu"th")
      times.circle 
      overbrace(sigma^x,mu+1"th")
      times.circle dots.c times.circle
      overbrace(sigma^x,nu-1"th")
      times.circle
      overbrace(sigma^z,nu)
    )
    \
    &quad +
    (
      I_((CC^2)^(times.circle M))
      times.circle dots.c times.circle 
      overbrace(I_((CC^2)^(times.circle M)),mu-1"th") 
      times.circle 
      overbrace(sigma^x dot.op sigma^z,mu"th")
      times.circle 
      overbrace(sigma^x,mu+1"th")
      times.circle dots.c times.circle
      overbrace(sigma^x,nu-1"th")
      times.circle
      overbrace(sigma^z,nu)
    )
    \
    &=
    (
      I_((CC^2)^(times.circle M))
      times.circle dots.c times.circle 
      overbrace(I_((CC^2)^(times.circle M)),mu-1"th") 
      times.circle 
      overbrace(sigma^z dot.op sigma^x,mu"th")
      times.circle 
      overbrace(sigma^x,mu+1"th")
      times.circle dots.c times.circle
      overbrace(sigma^x,nu-1"th")
      times.circle
      overbrace(sigma^z,nu)
    )
    \
    &quad -
    (
      I_((CC^2)^(times.circle M))
      times.circle dots.c times.circle 
      overbrace(I_((CC^2)^(times.circle M)),mu-1"th") 
      times.circle 
      overbrace(sigma^z dot.op sigma^x,mu"th")
      times.circle 
      overbrace(sigma^x,mu+1"th")
      times.circle dots.c times.circle
      overbrace(sigma^x,nu-1"th")
      times.circle
      overbrace(sigma^z,nu)
    )
    \
    &=
    0
    $
    Q.E.D.

    $
    [Z_mu, Y_nu]_+
    $
    TODO: 同様

    $
    [Y_mu, Y_nu]_+
    $
    TODO
  ]
]<anticommutator_of_Z_and_Y>



== $hat(Z)$と$hat(Y)$の反交換関係
#claim([$hat(Z)$と$hat(Y)$の反交換関係])[
  $
    [hat(Z)_mu^((plus.minus)), hat(Z)_nu^((plus.minus))]_(+) = 2M delta^M_(mu + nu, 0) I
    quad ("複合同順")
    \
    [hat(Z)_mu^((plus.minus)), hat(Z)_nu^((minus.plus))]_(+) = underbrace(
        2M delta^M_(mu + nu, 0)
        I_((CC^2)^(times.circle M))
        ,
        [hat(Z)_mu^((plus.minus)), hat(Z)_nu^((plus.minus))]_(+)
        )
        +
        (
          -2
          exp(
            -
            sqrt(-1)
            (2 pi) / M
            (
              mu
              +
              nu
            )
          )
          dot.op
          2I_((CC^2)^(times.circle M))
        )
    quad ("複合同順")
    \
    [hat(Z)_mu^((plus.minus)), hat(Y)_nu]_(+) = 0
    \
    [hat(Y)_mu, hat(Y)_nu]_(+) = 2M delta^M_(mu + nu, 0) I
  $

  #proof[
    $
      [hat(Z)_mu^((plus.minus)), hat(Z)_nu^((plus.minus))]_(+)
      &=
      [
        sum_(j=1)^M (
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot
          Z_j
          exp(
            -
            sqrt(-1)
            j
            (2 pi mu)/(M)
          )
        ),
        sum_(k=1)^M (
          (
            cases(
              +1 "if " k != 1,
              minus.plus 1 "if " k = 1
            )
          )
          dot
          Z_k
          exp(
            -
            sqrt(-1)
            k
            (2 pi nu)/(M)
          )
        )
      ]_(+)
      \
      &=
      (
        sum_(j=1)^M (
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot
          Z_j
          exp(
            -
            sqrt(-1)
            j
            (2 pi mu)/(M)
          )
        )
      )
      dot.op
      (
        sum_(k=1)^M (
          (
            cases(
              +1 "if " k != 1,
              minus.plus 1 "if " k = 1
            )
          )
          dot
          Z_k
          exp(
            -
            sqrt(-1)
            k
            (2 pi nu)/(M)
          )
        )
      )
      \
      & quad +
      (
        sum_(k=1)^M (
          (
            cases(
              +1 "if " k != 1,
              minus.plus 1 "if " k = 1
            )
          )
          dot
          Z_k
          exp(
            -
            sqrt(-1)
            k
            (2 pi nu)/(M)
          )
        )
      )
      dot.op
      (
        sum_(j=1)^M (
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot
          Z_j
          exp(
            -
            sqrt(-1)
            j
            (2 pi mu)/(M)
          )
        )
      )
      \
      &=
      sum_(j,k=1)^M (
        (
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot
          Z_j
          exp(
            -
            sqrt(-1)
            j
            (2 pi mu)/(M)
          )
        )
        dot.op
        (
          (
            cases(
              +1 "if " k != 1,
              minus.plus 1 "if " k = 1
            )
          )
          dot
          Z_k
          exp(
            -
            sqrt(-1)
            k
            (2 pi nu)/(M)
          )
        )
      )
      \
      & quad +
      sum_(j,k=1)^M (
        (
          (
            cases(
              +1 "if " k != 1,
              minus.plus 1 "if " k = 1
            )
          )
          dot
          Z_k
          exp(
            -
            sqrt(-1)
            k
            (2 pi nu)/(M)
          )
        )
        dot.op
        (
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot
          Z_j
          exp(
            -
            sqrt(-1)
            j
            (2 pi mu)/(M)
          )
        )
      )
      \
      &=
      sum_(j,k=1)^M (
        (
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot.op
          Z_j
          exp(
            -
            sqrt(-1)
            j
            (2 pi mu)/(M)
          )
          dot.op
          (
            cases(
              +1 "if " k != 1,
              minus.plus 1 "if " k = 1
            )
          )
          dot
          Z_k
          exp(
            -
            sqrt(-1)
            k
            (2 pi nu)/(M)
          )
        )
      )
      \
      & quad +
      sum_(j,k=1)^M (
        (
          (
            cases(
              +1 "if " k != 1,
              minus.plus 1 "if " k = 1
            )
          )
          dot.op
          Z_k
          exp(
            -
            sqrt(-1)
            k
            (2 pi nu)/(M)
          )
          dot.op
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot
          Z_j
          exp(
            -
            sqrt(-1)
            j
            (2 pi mu)/(M)
          )
        )
      )
      \
      &=
      sum_(j,k=1)^M (
        (
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot.op
          (
            cases(
              +1 "if " k != 1,
              minus.plus 1 "if " k = 1
            )
          )
          dot.op
          Z_j
          exp(
            -
            sqrt(-1)
            j
            (2 pi mu)/(M)
          )
          dot.op
          Z_k
          exp(
            -
            sqrt(-1)
            k
            (2 pi nu)/(M)
          )
        )
      )
      \
      & quad +
      sum_(j,k=1)^M (
        (
          (
            cases(
              +1 "if " k != 1,
              minus.plus 1 "if " k = 1
            )
          )
          dot.op
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot.op
          Z_k
          exp(
            -
            sqrt(-1)
            k
            (2 pi nu)/(M)
          )
          dot.op
          Z_j
          exp(
            -
            sqrt(-1)
            j
            (2 pi mu)/(M)
          )
        )
      )
      \
      &=
      sum_(j,k=1)^M (
        (
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot.op
          (
            cases(
              +1 "if " k != 1,
              minus.plus 1 "if " k = 1
            )
          )
          dot.op
          Z_j
          Z_k
          exp(
            -
            sqrt(-1)
            j
            (2 pi mu)/(M)
            -
            sqrt(-1)
            k
            (2 pi nu)/(M)
          )
        )
      )
      \
      & quad +
      sum_(j,k=1)^M (
        (
          (
            cases(
              +1 "if " k != 1,
              minus.plus 1 "if " k = 1
            )
          )
          dot.op
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot.op
          Z_k
          Z_j
          exp(
            -
            sqrt(-1)
            k
            (2 pi nu)/(M)
            -
            sqrt(-1)
            j
            (2 pi mu)/(M)
          )
        )
      )
      \
      &=
      sum_(j,k=1)^M (
        (
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot.op
          (
            cases(
              +1 "if " k != 1,
              minus.plus 1 "if " k = 1
            )
          )
          dot.op
          Z_j
          Z_k
          exp(
            -
            sqrt(-1)
            (2 pi) / M
            (
              j mu
              +
              k nu
            )
          )
        )
      )
      \
      & quad +
      sum_(j,k=1)^M (
        (
          (
            cases(
              +1 "if " k != 1,
              minus.plus 1 "if " k = 1
            )
          )
          dot.op
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot.op
          Z_k
          Z_j
          exp(
            -
            sqrt(-1)
            (2 pi) / M
            (
              k nu
              +
              j mu
            )
          )
        )
      )
      \
      &=
      sum_(j,k=1)^M (
        (
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot.op
          (
            cases(
              +1 "if " k != 1,
              minus.plus 1 "if " k = 1
            )
          )
          dot.op
          Z_j
          Z_k
          exp(
            -
            sqrt(-1)
            (2 pi) / M
            (
              j mu
              +
              k nu
            )
          )
        )
        \
        & quad +
        (
          (
            cases(
              +1 "if " k != 1,
              minus.plus 1 "if " k = 1
            )
          )
          dot.op
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot.op
          Z_k
          Z_j
          exp(
            -
            sqrt(-1)
            (2 pi) / M
            (
              k nu
              +
              j mu
            )
          )
        )
      )
      \
      &=
      sum_(j,k=1)^M (
        (
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot.op
          (
            cases(
              +1 "if " k != 1,
              minus.plus 1 "if " k = 1
            )
          )
          dot.op
          Z_j
          Z_k
          exp(
            -
            sqrt(-1)
            (2 pi) / M
            (
              j mu
              +
              k nu
            )
          )
        )
        \
        & quad +
        (
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot.op
          (
            cases(
              +1 "if " k != 1,
              minus.plus 1 "if " k = 1
            )
          )
          dot.op
          Z_k
          Z_j
          exp(
            -
            sqrt(-1)
            (2 pi) / M
            (
              k nu
              +
              j mu
            )
          )
        )
      )
      \
      &=
      sum_(j,k=1)^M (
        (
          cases(
            +1 "if " j != 1,
            minus.plus 1 "if " j = 1
          )
        )
        dot.op
        (
          cases(
            +1 "if " k != 1,
            minus.plus 1 "if " k = 1
          )
        )
        \
        & quad 
        dot.op
        (
          (
            Z_j
            Z_k
            exp(
              -
              sqrt(-1)
              (2 pi) / M
              (
                j mu
                +
                k nu
              )
            )
          )
          +
          (
            Z_k
            Z_j
            exp(
              -
              sqrt(-1)
              (2 pi) / M
              (
                k nu
                +
                j mu
              )
            )
          )
        )
      )
      \
      &=
      sum_(j,k=1)^M (
        (
          cases(
            +1 "if " j != 1,
            minus.plus 1 "if " j = 1
          )
        )
        dot.op
        (
          cases(
            +1 "if " k != 1,
            minus.plus 1 "if " k = 1
          )
        )
        \
        & quad 
        dot.op
        (
          (
            Z_j
            Z_k
            exp(
              -
              sqrt(-1)
              (2 pi) / M
              (
                j mu
                +
                k nu
              )
            )
          )
          +
          (
            Z_k
            Z_j
            exp(
              -
              sqrt(-1)
              (2 pi) / M
              (
                j mu
                +
                k nu
              )
            )
          )
        )
      )
      \
      &=
      sum_(j,k=1)^M (
        (
          cases(
            +1 "if " j != 1,
            minus.plus 1 "if " j = 1
          )
        )
        dot.op
        (
          cases(
            +1 "if " k != 1,
            minus.plus 1 "if " k = 1
          )
        )
        dot.op
        exp(
          -
          sqrt(-1)
          (2 pi) / M
          (
            j mu
            +
            k nu
          )
        )
        dot.op
        (
          Z_j
          Z_k
          +
          Z_k
          Z_j
        )
      )
      \
      &=
      sum_(j,k=1)^M (
        (
          cases(
            +1 "if " j != 1,
            minus.plus 1 "if " j = 1
          )
        )
        dot.op
        (
          cases(
            +1 "if " k != 1,
            minus.plus 1 "if " k = 1
          )
        )
        dot.op
        exp(
          -
          sqrt(-1)
          (2 pi) / M
          (
            j mu
            +
            k nu
          )
        )
        dot.op
        [
          Z_j
          ,
          Z_k
        ]_(+)
      )
      \
      &=
      sum_(j,k=1)^M (
        (
          cases(
            +1 "if " j != 1,
            minus.plus 1 "if " j = 1
          )
        )
        dot.op
        (
          cases(
            +1 "if " k != 1,
            minus.plus 1 "if " k = 1
          )
        )
        dot.op
        exp(
          -
          sqrt(-1)
          (2 pi) / M
          (
            j mu
            +
            k nu
          )
        )
        dot.op
        2I_((CC^2)^(times.circle M)) delta^M_((j, k))
      )
      \
      &=
      sum_(j=1)^M (
        underbrace(
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot.op
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          ,
          "符号がjに関わらず一致しているので" =1
        )
        dot.op
        exp(
          -
          sqrt(-1)
          (2 pi) / M
          (
            j mu
            +
            j nu
          )
        )
        dot.op
        2I_((CC^2)^(times.circle M))
      )
      \
      &=
      sum_(j=1)^M (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
          (
            mu
            +
            nu
          ) 
        )
        dot.op
        2I_((CC^2)^(times.circle M))
      )
      \
      &=
      2M delta^M_(mu + nu, 0) I_((CC^2)^(times.circle M))
      quad
      (because #ref(<exp_sum>))
    $

    $
      [hat(Z)_mu^((plus.minus)), hat(Z)_nu^((minus.plus))]_(+)

      &=
      sum_(j=1)^M (
        underbrace(
          (
            cases(
              +1 "if " j != 1,
              minus.plus 1 "if " j = 1
            )
          )
          dot.op
          (
            cases(
              +1 "if " j != 1,
              plus.minus 1 "if " j = 1
            )
          )
          ,
          j=1"の時のみ"-1", その他の場合は"+1
        )
        dot.op
          exp(
            -
            sqrt(-1)
            (2 pi) / M
            (
              j mu
              +
              j nu
            )
          )
          dot.op
          2I_((CC^2)^(times.circle M))
        )
        \
        &=
        underbrace(
          (
            -2
            exp(
              -
              sqrt(-1)
              (2 pi) / M
              (
                mu
                +
                nu
              )
            )
            dot.op
            2I_((CC^2)^(times.circle M))
          ),
          j=1"の項を打ち消すために2回引く"
        )
        +
        sum_(j=1)^M (
          exp(
            -
            sqrt(-1)
            (2 pi) / M
            (
              j mu
              +
              j nu
            )
          )
          dot.op
          2I_((CC^2)^(times.circle M))
        )
        \
        &=
        underbrace(
        2M delta^M_(mu + nu, 0)
        I_((CC^2)^(times.circle M))
        ,
        [hat(Z)_mu^((plus.minus)), hat(Z)_nu^((plus.minus))]_(+)
        )
        +
        (
          -2
          exp(
            -
            sqrt(-1)
            (2 pi) / M
            (
              mu
              +
              nu
            )
          )
          dot.op
          2I_((CC^2)^(times.circle M))
        )
    $
    $[hat(Z)_mu^((plus.minus)), hat(Y)_nu]_(+), [hat(Y)_mu, hat(Y)_nu]_(+)$についても同様
  ]
]<anticommutator_of_hat_Z_and_hat_Y>




== $T_(V_(1))(hat(Z))$と$hat(Z),hat(Y)$の関係

#claim([$H_1^((plus.minus))$,$H_2$と$hat(Z)_mu^((plus.minus))$, $hat(Y)_mu$の交換関係])[
  $
    [H_1^((plus.minus)), hat(Z)_mu^((plus.minus))]
    =&
    2
    dot.op
    (
      cases(
        exp(
          -
          sqrt(-1)
          (2 pi (-mu)) / M
        )
        dot.op
        hat(Y)_((-mu))
        & quad (mu = -M),
        exp(
          -
          sqrt(-1)
          (2 pi (M + mu)) / M
        )
        dot.op
        hat(Y)_((M + mu))
        & quad (-M + 1 <= mu <= -1),
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        dot.op
        hat(Y)_((mu))
        & quad (1 <= mu <= M),
      )
    )
    \
    =&
    2
    dot.op
    (
      cases(
        hat(Y)_((M))
        & quad (mu = -M),
        exp(
          -
          sqrt(-1)
          (2 pi (M + mu)) / M
        )
        dot.op
        hat(Y)_((M + mu))
        & quad (-M + 1 <= mu <= -1),
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        dot.op
        hat(Y)_((mu))
        & quad (1 <= mu <= M - 1),
        hat(Y)_((M))
        & quad (mu = M),
      )
    )
    \
    &=
    2
    dot.op
    (
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      dot.op
      hat(Y)_((mu))
    )
    \
    & quad
    (
      #block(
        $
          because & hat(Y)"の定義より、"M"ズレは値が等しくなるので、"
          \ &
          hat(Y)_((mu)) = hat(Y)_((M + mu)),
          \ &
          exp(
            -
            sqrt(-1)
            (2 pi (-M)) / M
          )
          dot.op
          hat(Y)_((-M))
          =
          1
          dot.op
          hat(Y)_((M - 2M))
          =
          exp(
            -
            sqrt(-1)
            (2 pi M) / M
          )
          dot.op
          hat(Y)_((M))
        $
      )
    )
    \
    [H_1^((plus.minus)), hat(Z)_mu^((minus.plus))]
    =&
    2
    dot.op
    (
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      dot.op
      hat(Y)_((mu))
    )
    \
    [H_1^((plus.minus)), hat(Y)_mu]
    =&
    -
    2
    dot.op
    (
      cases(
        exp(
          -
          sqrt(-1)
          (2 pi (-mu)) / M
        )
        dot.op
        hat(Z)_((mu))^((plus.minus))
        & quad (mu <= -1),
        exp(
          -
          sqrt(-1)
          (2 pi (M - mu)) / M
        )
        dot.op
        hat(Z)_((-M + mu))^((plus.minus))
        & quad (1 <= mu <= M-1),
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        dot.op
        hat(Z)_((-mu))^((plus.minus))
        & quad (mu = M),
      )
    )
    \
    =&
    -
    2
    dot.op
    (
      cases(
        hat(Z)_((-M))^((plus.minus))
        & quad (mu = -M),
        exp(
          -
          sqrt(-1)
          (2 pi (-mu)) / M
        )
        dot.op
        hat(Z)_((mu))^((plus.minus))
        & quad (-M+1 <= mu <= -1),
        exp(
          -
          sqrt(-1)
          (2 pi (M - mu)) / M
        )
        dot.op
        hat(Z)_((-M + mu))^((plus.minus))
        & quad (1 <= mu <= M-1),
        hat(Z)_((-M))^((plus.minus))
        & quad (mu = M),
      )
    )
    \
    =&
    -
    2
    dot.op
    (
      exp(
        -
        sqrt(-1)
        (2 pi (-mu)) / M
      )
      dot.op
      hat(Z)_((mu))^((plus.minus))
    )
    \
    =&
    -
    2
    dot.op
    (
      exp(
        sqrt(-1)
        (2 pi mu) / M
      )
      dot.op
      hat(Z)_((mu))^((plus.minus))
    )
    \ &
    (
      #block(
        $
          because & hat(Z)"の定義より、"M"ズレは値が等しくなるので、"
          \ &
          hat(Z)_((mu))^((plus.minus)) = hat(Z)_((-M + mu))^((plus.minus)),
          \ &
          exp(
            -
            sqrt(-1)
            (2 pi (M)) / M
          )
          dot.op
          hat(Z)_((-M))^((plus.minus))
          =
          1
          dot.op
          hat(Z)_((M - 2M))^((plus.minus))
          =
          exp(
            -
            sqrt(-1)
            (2 pi (-M)) / M
          )
          dot.op
          hat(Z)_((M))^((plus.minus))
        $
      )
    )
    \
    [H_2, hat(Z)_mu^((minus))]
    =&
    -2
    (  
      cases(
        hat(Y)_((-mu))
        & quad (mu = -M),
        hat(Y)_((M + mu))
        & quad (-M + 1 <= mu <= -1),
        hat(Y)_mu
        & quad (1 <= mu <= M),
      )
    )
    \
    =&
    -2
    dot.op
    hat(Y)_mu
    \
    & (
      because "同様"
    )
    \
    [H_2, hat(Z)_mu^((plus))]
    =&
    -2
    (
      cases(
        hat(Y)_((-mu))
        & quad (mu = -M),
        hat(Y)_((M + mu))
        & quad (-M + 1 <= mu <= -1),
        hat(Y)_mu
        & quad (1 <= mu <= M),
      )
    )
    \
    &quad +
    1/M
    (  
      sum_(j in {1, dots.c, M}) (
        -2
        exp(
          -
          sqrt(-1)
          (2 pi) / M
          (
            (-j)
            +
            mu
          )
        )
        dot.op
        hat(Y)_j
      )
    )
    \
    =&
    -2
    dot.op
    hat(Y)_mu
    \
    &quad +
    1/M
    (  
      sum_(j in {1, dots.c, M}) (
        -2
        exp(
          -
          sqrt(-1)
          (2 pi) / M
          (
            (-j)
            +
            mu
          )
        )
        dot.op
        hat(Y)_j
      )
    )
    \
    [H_2, hat(Y)_mu]
    =&
    2
    dot.op
    (
      cases(
        hat(Z)_(mu)^((-))
        & quad (mu <= -1),
        hat(Z)_((-M + mu))^((-))
        & quad (1 <= mu <= M-1),
        hat(Z)_((-mu))^((-))
        & quad (mu = M),
      )
    )
    \
    =&
    2
    dot.op
    hat(Z)_(mu)^((-))
  $

  #note[
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
      \
      [hat(Z)_mu^((plus.minus)), hat(Z)_nu^((plus.minus))]_(+) &= 2M delta^M_(mu + nu, 0) I_((CC^2)^(times.circle M))
      \
      [hat(Z)_mu^((plus.minus)), hat(Z)_nu^((minus.plus))]_(+) &= underbrace(
        2M delta^M_(mu + nu, 0)
        I_((CC^2)^(times.circle M))
        ,
        [hat(Z)_mu^((plus.minus)), hat(Z)_nu^((plus.minus))]_(+)
        )
        +
        (
          -2
          exp(
            -
            sqrt(-1)
            (2 pi) / M
            (
              mu
              +
              nu
            )
          )
          dot.op
          2I_((CC^2)^(times.circle M))
        )
      \
      [hat(Z)_mu^((plus.minus)), hat(Y)_nu]_(+) &= 0
      \
      [hat(Y)_mu, hat(Y)_nu]_(+) &= 2M delta^M_(mu + nu, 0) I
      \
      sum_(j=1)^M exp(k dot (2 pi sqrt(-1) j)/M) &= M delta^M_((k, 0))
    $
  ]
  #proof[
    1. $[H_1^((plus.minus)), hat(Z)_mu^((plus.minus))]$について、
    $mu in cal(M)$について、
    $
    [H_1^((plus.minus)), hat(Z)_mu^((plus.minus))]
    &=
    [
      overbrace(
        1/M sum_(j in {1, dots.c, M}) (
          hat(Y)_j
          hat(Z)_(-j)^((plus.minus))
          exp(
            -
            sqrt(-1)
            (2 pi j) / M
          )
        ),
        H_1^((plus.minus))
      )
      ,
      hat(Z)_mu^((plus.minus))
    ]
    \
    &=
    1/M
    (
      (
        sum_(j in {1, dots.c, M}) (
          hat(Y)_j
          hat(Z)_(-j)^((plus.minus))
          exp(
            -
            sqrt(-1)
            (2 pi j) / M
          )
        )
      )
      dot.op
      hat(Z)_mu^((plus.minus))
      -
      hat(Z)_mu^((plus.minus))
      dot.op
      (
        sum_(j in {1, dots.c, M}) (
          hat(Y)_j
          hat(Z)_(-j)^((plus.minus))
          exp(
            -
            sqrt(-1)
            (2 pi j) / M
          )
        )
      )
    )
    \
    &=
    1/M
    (
      (
        sum_(j in {1, dots.c, M}) (
          exp(
            -
            sqrt(-1)
            (2 pi j) / M
          )
          dot.op
          hat(Y)_j
          hat(Z)_(-j)^((plus.minus))
          hat(Z)_mu^((plus.minus))
        )
      )
      -
      (
        sum_(j in {1, dots.c, M}) (
          exp(
            -
            sqrt(-1)
            (2 pi j) / M
          )
          dot.op
          hat(Z)_mu^((plus.minus))
          hat(Y)_j
          hat(Z)_(-j)^((plus.minus))
        )
      )
    )
    \
    &=
    1/M
    (
      sum_(j in {1, dots.c, M}) (
      (
          exp(
            -
            sqrt(-1)
            (2 pi j) / M
          )
          dot.op
          hat(Y)_j
          hat(Z)_(-j)^((plus.minus))
          hat(Z)_mu^((plus.minus))
        )
        -
        (
          exp(
            -
            sqrt(-1)
            (2 pi j) / M
          )
          dot.op
          hat(Z)_mu^((plus.minus))
          hat(Y)_j
          hat(Z)_(-j)^((plus.minus))
        )
      )
    )
    \
    &=
    1/M
    (
      sum_(j in {1, dots.c, M}) (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        (  
          hat(Y)_j
          hat(Z)_(-j)^((plus.minus))
          hat(Z)_mu^((plus.minus))
          -
          hat(Z)_mu^((plus.minus))
          hat(Y)_j
          hat(Z)_(-j)^((plus.minus))
        )
      )
    )
    \
    &=
    1/M
    (
      sum_(j in {1, dots.c, M}) (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        (  
          hat(Y)_j
          hat(Z)_(-j)^((plus.minus))
          hat(Z)_mu^((plus.minus))
          +
          hat(Y)_j
          hat(Z)_mu^((plus.minus))
          hat(Z)_(-j)^((plus.minus))
        )
      )
    )
    quad
    (
      because #ref(<anticommutator_of_hat_Z_and_hat_Y>)
      "より、"hat(Z)_mu^((plus.minus)) hat(Y)_j = -hat(Y)_j hat(Z)_mu^((plus.minus)) 
    )
    \
    &=
    1/M
    (
      sum_(j in {1, dots.c, M}) (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        hat(Y)_j
        dot.op
        (  
          hat(Z)_(-j)^((plus.minus))
          hat(Z)_mu^((plus.minus))
          +
          hat(Z)_mu^((plus.minus))
          hat(Z)_(-j)^((plus.minus))
        )
      )
    )
    \
    &=
    1/M
    (
      sum_(j in {1, dots.c, M}) (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        hat(Y)_j
        dot.op
        [
          hat(Z)_(-j)^((plus.minus)),
          hat(Z)_mu^((plus.minus))
        ]_(+)
      )
    )
    \
    &=
    1/M
    (
      sum_(j in {1, dots.c, M}) (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        hat(Y)_j
        dot.op
        (
          2M
          dot.op
          delta^M_((-j) + mu, 0)
          dot.op
          I_((CC^2)^(times.circle M))
        )
      )
    )
    quad (
      because #ref(<anticommutator_of_hat_Z_and_hat_Y>)
    )
    \
    &=
    2
    dot.op
    (
      sum_(j in {1, dots.c, M}) (
        (
          delta^M_((-j) + mu, 0)
        )
        dot.op
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        hat(Y)_j
        dot.op
        I_((CC^2)^(times.circle M))
      )
    )
    \
    &=
    2
    dot.op
    (
      sum_(
        j in {1, dots.c, M} \
        (-j) + mu equiv 0 mod M
      ) (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        hat(Y)_j
      )
    )
    \
    &note(
      &(-j+mu = 2M, M, 0, -M, -2M)\
      &(
          mu - j = cases(
            2M,
            M,
            0,
            -M,
            -2M
          )
          \
          j - mu = cases(
            2M,
            M,
            0,
            -M,
            -2M
          )
          \
          j = cases(
            2M + mu,
            M + mu,
            0 + mu,
            -M + mu,
            -2M + mu
          )
          \
          j = cases(
            -mu & quad (mu = -M),
            M + mu & quad (-M + 1 <= mu <= -1),
            mu & quad (1 <= mu <= M),
          )
      )
      \
    )
    \
    &=
    2
    dot.op
    (
      sum_(
        cases(
          j = M & quad (mu = -M),
          j = M + mu & quad (-M + 1 <= mu <= -1),
          j = mu & quad (1 <= mu <= M),
        )
      ) (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        hat(Y)_j
      )
    )
    \
    &=
    2
    dot.op
    (
      cases(
        exp(
          -
          sqrt(-1)
          (2 pi M) / M
        )
        dot.op
        hat(Y)_M
        & quad (mu = -M),
        exp(
          -
          sqrt(-1)
          (2 pi (M + mu)) / M
        )
        dot.op
        hat(Y)_((M + mu))
        & quad (-M + 1 <= mu <= -1),
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        dot.op
        hat(Y)_mu
        & quad (1 <= mu <= M),
      )
    )
    \
    &=
    2
    dot.op
    (
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      dot.op
      hat(Y)_mu
    )
    \
    qed
    $

    $2. [H_1^((plus.minus)), hat(Z)_mu^((minus.plus))]$について、

    $mu in cal(M)$について、

    $
      [H_1^((plus.minus)), hat(Z)_mu^((minus.plus))]
      &=
      [
        overbrace(
          1/M sum_(j in {1, dots.c, M}) (
            hat(Y)_j
            hat(Z)_(-j)^((plus.minus))
            exp(
              -
              sqrt(-1)
              (2 pi j) / M
            )
          ),
          H_1^((plus.minus))
        )
        ,
        hat(Z)_mu^((minus.plus))
      ]
      \
      &=
      1/M
      sum_(j in {1, dots.c, M})
      (
        [
          hat(Y)_j
          hat(Z)_(-j)^((plus.minus))
          exp(
            -
            sqrt(-1)
            (2 pi j) / M
          )
          ,
          hat(Z)_mu^((minus.plus))
        ]
      )
      \
      &=
      1/M
      sum_(j in {1, dots.c, M})
      (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        [
          hat(Y)_j
          hat(Z)_(-j)^((plus.minus))
          ,
          hat(Z)_mu^((minus.plus))
        ]
      )
      \
      &=
      1/M
      sum_(j in {1, dots.c, M})
      (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        (
          hat(Y)_j
          hat(Z)_(-j)^((plus.minus))
          hat(Z)_mu^((minus.plus))
          -
          hat(Z)_mu^((minus.plus))
          hat(Y)_j
          hat(Z)_(-j)^((plus.minus))
        )
      )
      \
      &=
      1/M
      sum_(j in {1, dots.c, M})
      (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        (
          hat(Y)_j
          hat(Z)_(-j)^((plus.minus))
          hat(Z)_mu^((minus.plus))
          -
          hat(Z)_mu^((minus.plus))
          hat(Y)_j
          hat(Z)_(-j)^((plus.minus))
        )
      )
      \
      &=
      1/M
      sum_(j in {1, dots.c, M})
      (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        (
          hat(Y)_j
          hat(Z)_(-j)^((plus.minus))
          hat(Z)_mu^((minus.plus))
          +
          hat(Y)_j
          hat(Z)_mu^((minus.plus))
          hat(Z)_(-j)^((plus.minus))
        )
      )
      quad
      (
        because #ref(<anticommutator_of_hat_Z_and_hat_Y>)
        "より、"hat(Z)_mu^((minus.plus)) hat(Y)_j = -hat(Y)_j hat(Z)_mu^((minus.plus))
      )
      \
      &=
      1/M
      sum_(j in {1, dots.c, M})
      (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        hat(Y)_j
        dot.op
        (
          hat(Z)_(-j)^((plus.minus))
          hat(Z)_mu^((minus.plus))
          +
          hat(Z)_mu^((minus.plus))
          hat(Z)_(-j)^((plus.minus))
        )
      )
      \
      &=
      1/M
      sum_(j in {1, dots.c, M})
      (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        hat(Y)_j
        dot.op
        [
          hat(Z)_(-j)^((plus.minus)),
          hat(Z)_mu^((minus.plus))
        ]_(+)
      )
      \
      &=
      1/M
      sum_(j in {1, dots.c, M})
      (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        hat(Y)_j
        dot.op
        (
          underbrace(
            2M delta^M_((-j) + mu, 0)
            I_((CC^2)^(times.circle M))
            ,
            [hat(Z)_(-j)^((plus.minus)), hat(Z)_mu^((plus.minus))]_(+)
          )
          +
          (
            -2
            exp(
              -
              sqrt(-1)
              (2 pi) / M
              (
                (-j)
                +
                mu
              )
            )
            dot.op
            2I_((CC^2)^(times.circle M))
          )
        )
      )
      \
      &=
      1/M
      sum_(j in {1, dots.c, M})
      (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        hat(Y)_j
        dot.op
        (
          2M delta^M_((-j) + mu, 0)
          I_((CC^2)^(times.circle M))
        )
      )
      \
      &
      quad
      quad
      +
      1/M
      sum_(j in {1, dots.c, M})
      (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        hat(Y)_j
        dot.op
        (
          -2
          exp(
            -
            sqrt(-1)
            (2 pi) / M
            (
              (-j)
              +
              mu
            )
          )
          dot.op
          2I_((CC^2)^(times.circle M))
        )
      )
      \
      &=
      2
      sum_(j in {1, dots.c, M})
      (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        hat(Y)_j
        dot.op
        delta^M_((-j) + mu, 0)
      )
      \
      &
      quad
      quad
      -
      4/M
      sum_(j in {1, dots.c, M})
      (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
          -
          sqrt(-1)
          (2 pi) / M
          (
            (-j)
            +
            mu
          )
        )
        dot.op
        hat(Y)_j
      )
      \
      &=
      2
      sum_(j in {1, dots.c, M})
      (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        hat(Y)_j
        dot.op
        delta^M_((-j) + mu, 0)
      )
      -
      4/M
      sum_(j in {1, dots.c, M})
      (
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        dot.op
        hat(Y)_j
      )
      \
      &=
      2
      sum_(j in {1, dots.c, M})
      (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        hat(Y)_j
        dot.op
        delta^M_((-j) + mu, 0)
      )
      -
      4/M
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      dot.op
      sum_(j in {1, dots.c, M})
      (
        hat(Y)_j
      )
      \
      &=
      2
      sum_(j in {1, dots.c, M})
      (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        hat(Y)_j
        dot.op
        delta^M_((-j) + mu, 0)
      )
      -
      4/M
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      dot.op
      sum_(j in {1, dots.c, M})
      (
        sum_(k=1)^M (
          Y_k
          exp(
            -
            sqrt(-1)
            k
            (2 pi j) / M
          )
        )
      )
      \
      &=
      2
      sum_(j in {1, dots.c, M})
      (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        hat(Y)_j
        dot.op
        delta^M_((-j) + mu, 0)
      )
      -
      4/M
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      dot.op
      sum_(k=1)^M (
      sum_(j in {1, dots.c, M})
      (
          Y_k
          exp(
            -
            sqrt(-1)
            k
            (2 pi j) / M
          )
        )
      )
      \
      &=
      2
      sum_(j in {1, dots.c, M})
      (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        hat(Y)_j
        dot.op
        delta^M_((-j) + mu, 0)
      )
      -
      4/M
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      dot.op
      sum_(k=1)^M (
      Y_k 
      dot.op
      sum_(j in {1, dots.c, M})
      (
          exp(
            -
            k
            sqrt(-1)
            (2 pi j) / M
          )
        )
      )
      \
      &=
      2
      sum_(j in {1, dots.c, M})
      (
        exp(
          -
          sqrt(-1)
          (2 pi j) / M
        )
        dot.op
        hat(Y)_j
        dot.op
        delta^M_((-j) + mu, 0)
      )
      -
      4/M
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      dot.op
      sum_(k=1)^M (
        Y_k 
        dot.op
        M delta^M_((k, 0))
      )
      quad
      ( because #ref(<exp_sum>) )

      \
      &
      #note[
        $
          (-j) + mu equiv 0 mod M
          \
          (-j) + mu = cases(
            0,
            M,
            2M,
            -M,
            -2M
          )
          \
          -j = cases(
            0 - mu,
            M - mu,
            2M - mu,
            -M - mu,
            -2M - mu,
          )
          \
          j = cases(
            mu & (1 <= mu <= M),
            #strike[-M + mu],
            #strike[-2M + mu],
            M + mu & (-M + 1 <= mu <= -1),
            2M + mu & (mu = -M),
          )
        $
      ]
      \
      &=
      2
      cases(
        exp(
          -
          sqrt(-1)
          (2 pi (2M + mu)) / M
        )
        dot.op
        hat(Y)_((2M + mu))
        & quad (mu = -M),
         exp(
          -
          sqrt(-1)
          (2 pi (M + mu)) / M
        )
        dot.op
        hat(Y)_((M + mu))
        & quad (-M + 1 <= mu <= -1),
         exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        dot.op
        hat(Y)_mu
        & quad (1 <= mu <= M),
      )
      -
      0
      \
      &=
      2
      dot.op
      (
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        dot.op
        hat(Y)_mu
      )
      
    $


    $2. [H_1^((plus.minus)), hat(Y)_mu]$について、

    $mu in cal(M)$について、

    $
      [H_1^((plus.minus)), hat(Y)_mu]
      &=
      [
        overbrace(
          1/M sum_(j in {1, dots.c, M}) (
            hat(Y)_j
            hat(Z)_(-j)^((plus.minus))
            exp(
              -
              sqrt(-1)
              (2 pi j) / M
            )
          ),
          H_1^((plus.minus))
        )
        ,
        hat(Y)_mu
      ] \ &quad ("note": "交換関係カッコはなるべく外さずに進めた方が計算見やすそう")
      \
      &=
      1/M
      (
        (
          sum_(j in {1, dots.c, M}) (
            hat(Y)_j
            hat(Z)_(-j)^((plus.minus))
            exp(
              -
              sqrt(-1)
              (2 pi j) / M
            )
          )
        )
        dot.op
        hat(Y)_mu
        -
        hat(Y)_mu
        dot.op
        (
          sum_(j in {1, dots.c, M}) (
            hat(Y)_j
            hat(Z)_(-j)^((plus.minus))
            exp(
              -
              sqrt(-1)
              (2 pi j) / M
            )
          )
        )
      )
      \
      &=
      1/M
      (
        (
          sum_(j in {1, dots.c, M}) (
            exp(
              -
              sqrt(-1)
              (2 pi j) / M
            )
            dot.op
            hat(Y)_j
            hat(Z)_(-j)^((plus.minus))
            hat(Y)_mu
          )
        )
        -
        (
          sum_(j in {1, dots.c, M}) (
            exp(
              -
              sqrt(-1)
              (2 pi j) / M
            )
            dot.op
            hat(Y)_mu
            hat(Y)_j
            hat(Z)_(-j)^((plus.minus))
          )
        )
      )
      \
      &=
      1/M
      (
        sum_(j in {1, dots.c, M}) (
          (
            exp(
              -
              sqrt(-1)
              (2 pi j) / M
            )
            dot.op
            hat(Y)_j
            hat(Z)_(-j)^((plus.minus))
            hat(Y)_mu
          )
          -
          (
            exp(
              -
              sqrt(-1)
              (2 pi j) / M
            )
            dot.op
            hat(Y)_mu
            hat(Y)_j
            hat(Z)_(-j)^((plus.minus))
          )
        ) 
      )
      \
      &=
      1/M
      (
        sum_(j in {1, dots.c, M}) (
          exp(
            -
            sqrt(-1)
            (2 pi j) / M
          )
          dot.op
          (
            hat(Y)_j
            hat(Z)_(-j)^((plus.minus))
            hat(Y)_mu
            -
            hat(Y)_mu
            hat(Y)_j
            hat(Z)_(-j)^((plus.minus))
          )
        ) 
      )
      \
      &=
      1/M
      (
        sum_(j in {1, dots.c, M}) (
          exp(
            -
            sqrt(-1)
            (2 pi j) / M
          )
          dot.op
          (
            -
            hat(Y)_j
            hat(Y)_mu
            hat(Z)_(-j)^((plus.minus))
            -
            hat(Y)_mu
            hat(Y)_j
            hat(Z)_(-j)^((plus.minus))
          )
        ) 
      )
      quad
      (
        because #ref(<anticommutator_of_hat_Z_and_hat_Y>)
        "より、"hat(Z)_(-j)^((plus.minus)) hat(Y)_mu = -hat(Y)_mu hat(Z)_(-j)^((plus.minus))
      )
      \
      &=
      1/M
      (
        sum_(j in {1, dots.c, M}) (
          exp(
            -
            sqrt(-1)
            (2 pi j) / M
          )
          dot.op
          (
            -
            hat(Y)_j
            hat(Y)_mu
            -
            hat(Y)_mu
            hat(Y)_j
          )
          dot.op
          hat(Z)_(-j)^((plus.minus))
        ) 
      )
      \
      &=
      1/M
      (
        sum_(j in {1, dots.c, M}) (
          exp(
            -
            sqrt(-1)
            (2 pi j) / M
          )
          dot.op
          (
            -
            [
              hat(Y)_j,
              hat(Y)_mu
            ]_(+)
          )
          dot.op
          hat(Z)_(-j)^((plus.minus))
        ) 
      )
      \
      &=
      1/M
      (
        sum_(j in {1, dots.c, M}) (
          exp(
            -
            sqrt(-1)
            (2 pi j) / M
          )
          dot.op
          (
            -
            2M delta^M_(j + mu, 0)
            dot.op
            I_((CC^2)^(times.circle M))
          )
          dot.op
          hat(Z)_(-j)^((plus.minus))
        ) 
      )
      \
      &=
      -
      2
      dot.op
      (
        sum_(j in {1, dots.c, M}) (
          delta^M_(j + mu, 0)
          dot.op
          exp(
            -
            sqrt(-1)
            (2 pi j) / M
          )
          dot.op
          hat(Z)_(-j)^((plus.minus))
        ) 
      )
      \
      &note(
        &(j+mu = 2M, M, 0, -M, -2M)\
        &(
            cases(
              mu = -M => j = M,
              mu = -M + 1 => j = M - 1,
              ...,
              mu = -1 => j = 1,
              mu = 1 => j = M - 1,
              mu = 2 => j = M - 2,
              ...,
              mu = M - 1 => j = 1,
              mu = M => j = M
            )
        )
      )
      \
      &=
      -
      2
      dot.op
      (
        sum_(
          underbrace(
          cases(
            j = -mu & quad (mu <= -1),
            j = M - mu & quad (1 <= mu <= M-1),
            j = M & quad (mu = M),
          ),
          )
        ) (
          exp(
            -
            sqrt(-1)
            (2 pi j) / M
          )
          dot.op
          hat(Z)_(-j)^((plus.minus))
        ) 
      )
      \
      &=
      -
      2
      dot.op
      (
        sum_(
          cases(
            j = -mu & quad (mu <= -1),
            j = M - mu & quad (1 <= mu <= M-1),
            j = M & quad (mu = M),
          )
        ) (
          exp(
            -
            sqrt(-1)
            (2 pi j) / M
          )
          dot.op
          hat(Z)_(-j)^((plus.minus))
        ) 
      )
      \
      &=
      -
      2
      dot.op
      (
        cases(
          exp(
            -
            sqrt(-1)
            (2 pi (-mu)) / M
          )
          dot.op
          hat(Z)_(-(-mu))^((plus.minus))
          & quad (mu <= -1),
          exp(
            -
            sqrt(-1)
            (2 pi (M - mu)) / M
          )
          dot.op
          hat(Z)_(-(M - mu))^((plus.minus))
          & quad (1 <= mu <= M-1),
          exp(
            -
            sqrt(-1)
            (2 pi M) / M
          )
          dot.op
          hat(Z)_(-M)^((plus.minus))
          & quad (mu = M),
        )
      )
      \
      qed
    $

    $3. [H_2, hat(Z)_mu^((plus.minus))]$について、

    $mu in cal(M)$について、

    $
      [H_2, hat(Z)_mu^((plus.minus))]
      &=
      [
        overbrace(
          1/M sum_(j in {1, dots.c, M}) (
            hat(Z)_(-j)^((-))
            hat(Y)_j
          ),
          H_2
        )
        ,
        hat(Z)_mu^((plus.minus))
      ]
      \
      &=
      1/M
      (
        (
          sum_(j in {1, dots.c, M}) (
            hat(Z)_(-j)^((-))
            hat(Y)_j
          )
        )
        dot.op
        hat(Z)_mu^((plus.minus))
        -
        hat(Z)_mu^((plus.minus))
        dot.op
        (
          sum_(j in {1, dots.c, M}) (
            hat(Z)_(-j)^((-))
            hat(Y)_j
          )
        )
      )
      \
      &=
      1/M
      (
        (
          sum_(j in {1, dots.c, M}) (
            hat(Z)_(-j)^((-))
            hat(Y)_j
          )
        )
        dot.op
        hat(Z)_mu^((plus.minus))
        -
        hat(Z)_mu^((plus.minus))
        dot.op
        (
          sum_(j in {1, dots.c, M}) (
            hat(Z)_(-j)^((-))
            hat(Y)_j
          )
        )
      )
      \
      &=
      1/M
      (
        (
          sum_(j in {1, dots.c, M}) (
            hat(Z)_(-j)^((-))
            hat(Y)_j
            hat(Z)_mu^((plus.minus))
          )
        )
        -
        (
          sum_(j in {1, dots.c, M}) (
            hat(Z)_mu^((plus.minus))
            hat(Z)_(-j)^((-))
            hat(Y)_j
          )
        )
      )
      \
      &=
      1/M
      (  
        sum_(j in {1, dots.c, M}) (
          hat(Z)_(-j)^((-))
          hat(Y)_j
          hat(Z)_mu^((plus.minus))
          -
          hat(Z)_mu^((plus.minus))
          hat(Z)_(-j)^((-))
          hat(Y)_j
        )
      )
      \
      &=
      1/M
      (  
        sum_(j in {1, dots.c, M}) (
          -
          hat(Z)_(-j)^((-))
          hat(Z)_mu^((plus.minus))
          hat(Y)_j
          -
          hat(Z)_mu^((plus.minus))
          hat(Z)_(-j)^((-))
          hat(Y)_j
        )
      )
      quad
      (
        because #ref(<anticommutator_of_hat_Z_and_hat_Y>)
        "より、"hat(Z)_mu^((plus.minus)) hat(Y)_j = -hat(Y)_j hat(Z)_mu^((plus.minus))
      )
      \
      &=
      1/M
      (  
        sum_(j in {1, dots.c, M}) (
          (
            -
            hat(Z)_(-j)^((-))
            hat(Z)_mu^((plus.minus))
            -
            hat(Z)_mu^((plus.minus))
            hat(Z)_(-j)^((-))
          ) 
          dot.op
          hat(Y)_j
        )
      )
      \
      &=
      1/M
      (  
        sum_(j in {1, dots.c, M}) (
          (
            -
            [
              hat(Z)_(-j)^((-)),
              hat(Z)_mu^((plus.minus))
            ]_(+)
          ) 
          dot.op
          hat(Y)_j
        )
      )
      \
      &=
      1/M
      (  
        sum_(j in {1, dots.c, M}) (
            underbrace(
            (
              -
              [
                hat(Z)_mu^((plus.minus)),
                hat(Z)_(-j)^((-))
              ]_(+)
            )
            ,
            hat(Z)"の符号によって計算結果が分岐する"
          ) 
          dot.op
          hat(Y)_j
        )
      )
      \
    $

    $quad 3.1. [H_2, hat(Z)_mu^((minus))]$について、

    $
      1/M
      (  
        sum_(j in {1, dots.c, M}) (
          (
            -
            [
              hat(Z)_mu^((minus)),
              hat(Z)_(-j)^((-))
            ]_(+)
          ) 
          dot.op
          hat(Y)_j
        )
      )
      &=
      1/M
      (  
        sum_(j in {1, dots.c, M}) (
          (
            -
            2M delta^M_((-j) + mu, 0)
            I_((CC^2)^(times.circle M))
          ) 
          dot.op
          hat(Y)_j
        )
      )
      \
      &=
      -2
      (  
        sum_(j in {1, dots.c, M}) (
          (
            delta^M_((-j) + mu, 0)
            I_((CC^2)^(times.circle M))
          ) 
          dot.op
          hat(Y)_j
        )
      )
      \
      &=
      -2
      (  
        sum_(j in {1, dots.c, M}) (
          (
            delta^M_((-j) + mu, 0)
            I_((CC^2)^(times.circle M))
          ) 
          dot.op
          hat(Y)_j
        )
      )
      \
      &=
      -2
      (  
        sum_(
          cases(
            j = M & quad (mu = -M),
            j = M + mu & quad (-M + 1 <= mu <= -1),
            j = mu & quad (1 <= mu <= M),
          )
        ) (
          hat(Y)_j
        )
      )
      \
      &=
      -2
      (  
        cases(
          hat(Y)_M
          & quad (mu = -M),
          hat(Y)_((M + mu))
          & quad (-M + 1 <= mu <= -1),
          hat(Y)_mu
          & quad (1 <= mu <= M),
        )
      )
    $

    $quad 3.2. [H_2, hat(Z)_mu^((plus))]$について、

    $
      &1/M
      (  
        sum_(j in {1, dots.c, M}) (
          (
            -
            [
              hat(Z)_mu^((plus)),
              hat(Z)_(-j)^((-))
            ]_(+)
          ) 
          dot.op
          hat(Y)_j
        )
      )
      \
      &=
      1/M
      (  
        sum_(j in {1, dots.c, M}) (
          (
            -
            underbrace(
              2M delta^M_((-j) + mu, 0)
              I_((CC^2)^(times.circle M))
              ,
              [hat(Z)_mu^((plus.minus)), hat(Z)_((-j))^((plus.minus))]_(+)
            )
            +
            (
              -2
              exp(
                -
                sqrt(-1)
                (2 pi) / M
                (
                  (-j)
                  +
                  mu
                )
              )
              dot.op
              2I_((CC^2)^(times.circle M))
            )
          )
          dot.op
          hat(Y)_j
        )
      )
      \
      &=
      1/M
      (  
        sum_(j in {1, dots.c, M}) (
          (
            -
            2M delta^M_((-j) + mu, 0)
            dot.op
            hat(Y)_j
            +
            (
              -2
              exp(
                -
                sqrt(-1)
                (2 pi) / M
                (
                  (-j)
                  +
                  mu
                )
              )
              dot.op
              hat(Y)_j
            )
          )
        )
      )
      \
      &=
      1/M
      (  
        sum_(
          cases(
            j = M & quad (mu = -M),
            j = M + mu & quad (-M + 1 <= mu <= -1),
            j = mu & quad (1 <= mu <= M),
          )
        ) (
          -
          2M
          dot.op
          hat(Y)_j
        )
        +
        sum_(j in {1, dots.c, M}) (
          -2
          exp(
            -
            sqrt(-1)
            (2 pi) / M
            (
              (-j)
              +
              mu
            )
          )
          dot.op
          hat(Y)_j
        )
      )
      \
      &=
      -2
      (
        sum_(
          cases(
            j = M & quad (mu = -M),
            j = M + mu & quad (-M + 1 <= mu <= -1),
            j = mu & quad (1 <= mu <= M),
          )
        ) (
          hat(Y)_j
        )
      )
      +
      1/M
      (  
        sum_(j in {1, dots.c, M}) (
          -2
          exp(
            -
            sqrt(-1)
            (2 pi) / M
            (
              (-j)
              +
              mu
            )
          )
          dot.op
          hat(Y)_j
        )
      )
      \
      &=
      -2
      (
        cases(
          hat(Y)_M
          & quad (mu = -M),
          hat(Y)_((M + mu))
          & quad (-M + 1 <= mu <= -1),
          hat(Y)_mu
          & quad (1 <= mu <= M),
        )
      )
      +
      1/M
      (  
        sum_(j in {1, dots.c, M}) (
          -2
          exp(
            -
            sqrt(-1)
            (2 pi) / M
            (
              (-j)
              +
              mu
            )
          )
          dot.op
          hat(Y)_j
        )
      )
      
    $

    $[H_2, hat(Y)_mu]$について、
    
    $
    &[H_2, hat(Y)_mu]
    \
    &=
    [
      overbrace(
        1/M sum_(j in {1, dots.c, M}) (
          hat(Z)_(-j)^((-))
          hat(Y)_j
        ),
        H_2
      )
      ,
      hat(Y)_mu
    ]
    \
    &=
    1/M
    (
      (
        sum_(j in {1, dots.c, M}) (
          hat(Z)_(-j)^((-))
          hat(Y)_j
        )
      )
      dot.op
      hat(Y)_mu
      -
      hat(Y)_mu
      dot.op
      (
        sum_(j in {1, dots.c, M}) (
          hat(Z)_(-j)^((-))
          hat(Y)_j
        )
      )
    )
    \
    &=
    1/M
    (
      sum_(j in {1, dots.c, M}) (
        hat(Z)_(-j)^((-))
        hat(Y)_j
        hat(Y)_mu
      )
      -
      sum_(j in {1, dots.c, M}) (
        hat(Y)_mu
        hat(Z)_(-j)^((-))
        hat(Y)_j
      )
    )
    \
    &=
    1/M
    (
      sum_(j in {1, dots.c, M}) (
        hat(Z)_(-j)^((-))
        hat(Y)_j
        hat(Y)_mu
        -
        hat(Y)_mu
        hat(Z)_(-j)^((-))
        hat(Y)_j
      )
    )
    \
    &=
    1/M
    (
      sum_(j in {1, dots.c, M}) (
        hat(Z)_(-j)^((-))
        hat(Y)_j
        hat(Y)_mu
        +
        hat(Z)_(-j)^((-))
        hat(Y)_mu
        hat(Y)_j
      )
    )
    quad (because #ref(<anticommutator_of_hat_Z_and_hat_Y>))
    \
    &=
    1/M
    (
      sum_(j in {1, dots.c, M}) (
        hat(Z)_(-j)^((-))
        (
          hat(Y)_j
          hat(Y)_mu
          +
          hat(Y)_mu
          hat(Y)_j
        )
      )
    )
    \
    &=
    1/M
    (
      sum_(j in {1, dots.c, M}) (
        hat(Z)_(-j)^((-))
        [
          hat(Y)_j,
          hat(Y)_mu
        ]_(+)
      )
    )
    \
    &=
    1/M
    (
      sum_(j in {1, dots.c, M}) (
        2M delta^M_(j + mu, 0)
        dot.op
        hat(Z)_(-j)^((-))
      )
    )
    \
    &=
    2
    (
      sum_(
        cases(
          j = -mu & quad (mu <= -1),
          j = M - mu & quad (1 <= mu <= M-1),
          j = M & quad (mu = M),
        )
      ) (
        hat(Z)_(-j)^((-))
      )
    )
    \
    &=
    2
    (
      cases(
        hat(Z)_(mu)^((-))
        & quad (mu <= -1),
        hat(Z)_((-M + mu))^((-))
        & quad (1 <= mu <= M-1),
        hat(Z)_((-M))^((-))
        & quad (mu = M),
      )
    )
  
      
    $

  ]
]<commutator_of_H_and_Z_Y>

#claim(none)[

  $n >= 0$とする。

  $(h_1.z)$
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
      (-1)^((n-1)/2)
      dot.op
      (2 K_1)^(n)
      dot.op
      exp(-sqrt(-1) (2 pi mu)/(M))
      dot.op
      hat(Y)_mu
      & (n "is odd"),
      (-1)^(n/2)
      dot.op
      (2 K_1)^(n)
      dot.op
      hat(Z)_mu^((plus.minus))
      & (n "is even"),
    )
  $

  ただし$n = 0$のときは、
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

  と定める。

  $(h_1.y)$
  $
    overbrace(
      [
        K_1 dot.op H_1^((plus.minus)),
        dots,
        [K_1 dot.op H_1^((plus.minus)), hat(Y)_mu]
        dots
      ]
      ,
      n "times"
    )
    =
    cases(
      (-1)^((n+1)/2)
      dot.op
      (2 K_1)^(n)
      dot.op
      exp(sqrt(-1) (2 pi mu)/(M))
      dot.op
      hat(Z)_mu^((plus))
      & (n "is odd"),
      (-1)^(n/2)
      dot.op
      (2 K_1)^(n)
      dot.op
      hat(Y)_mu
      & (n "is even"),
    )
  $

  ただし$n = 0$のときは、
  $
  overbrace(
    [
      K_1 dot.op H_1^((plus.minus)),
      dots,
      [K_1 dot.op H_1^((plus.minus)), hat(Y)_mu]
      dots
    ]
    ,
    0 "times"
  )
  =
  hat(Y)_mu
  $
  と定める。

  $(h_2.z^+)$

  $
    overbrace(
      [
        K_2^(*) dot.op H_2,
        dots,
        [K_2^(*) dot.op H_2, hat(Z)_mu^((plus))]
        dots
      ]
      ,
      n "times"
    )
    =
    "メモ(0322) これは使われない"
  $
  ただし$n = 0$のときは、
  $
  overbrace(
    [
      K_2^(*) dot.op H_2,
      dots,
      [K_2^(*) dot.op H_2, hat(Z)_mu^((plus))]
      dots
    ]
    ,
    0 "times"
  )
  =
  hat(Z)_mu^((plus))
  $
  と定める。

  $(h_2.z^-)$
  $
    overbrace(
      [
        K_2^(*) dot.op H_2,
        dots,
        [K_2^(*) dot.op H_2, hat(Z)_mu^((-))]
        dots
      ]
      ,
      n "times"
    )
    =
    cases(
      (-1)^((n+1)/2)
      dot.op
      (2 K_2^(*))^(n)
      dot.op
      hat(Y)_mu
      & (n "is odd"),
      (-1)^(n/2)
      dot.op
      (2 K_2^(*))^(n)
      dot.op
      hat(Z)_mu^((-))
      & (n "is even"),
    )
  $
  ただし$n = 0$のときは、
  $
  overbrace(
    [
      K_2^(*) dot.op H_2,
      dots,
      [K_2^(*) dot.op H_2, hat(Z)_mu^((-))]
      dots
    ]
    ,
    0 "times"
  )
  =
  hat(Z)_mu^((-))
  $
  と定める。

  $(h_2.y)$
  $
    overbrace(
      [
        K_2^(*) dot.op H_2,
        dots,
        [K_2^(*) dot.op H_2, hat(Y)_mu]
        dots
      ]
      ,
      n "times"
    )
    =
    cases(
      (-1)^((n-1)/2)
      dot.op
      (2 K_2^(*))^(n)
      dot.op
      hat(Z)_mu^((minus))
      & (n "is odd"),
      (-1)^(n/2)
      dot.op
      (2 K_2^(*))^(n)
      dot.op
      hat(Y)_mu
      & (n "is even"),
    )
  $
  ただし$n = 0$のときは、
  $
  overbrace(
    [
      K_2^(*) dot.op H_2,
      dots,
      [K_2^(*) dot.op H_2, hat(Y)_mu]
      dots
    ]
    ,
    0 "times"
  )
  =
  hat(Y)_mu
  $
  と定める。

  #note[
    @commutator_of_H_and_Z_Y
  ]

  #note[

    $(h_1.z)$
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
    K_1
    dot.op
    [
      H_1^((plus.minus)),
      hat(Z)_mu^((plus.minus))
    ]
    \
    &=
    K_1
    dot.op
    2
    dot.op
    (
      cases(
        hat(Y)_((M))
        & quad (mu = -M),
        exp(
          -
          sqrt(-1)
          (2 pi (M + mu)) / M
        )
        dot.op
        hat(Y)_((M + mu))
        & quad (-M + 1 <= mu <= -1),
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        dot.op
        hat(Y)_((mu))
        & quad (1 <= mu <= M - 1),
        hat(Y)_((M))
        & quad (mu = M),
      )
    )
    \
    &=
    K_1
    dot.op
    2
    dot.op
    (
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      dot.op
      hat(Y)_((mu))
    )
    \
    & quad
    (
      because
      hat(Y)"の定義より、Mズレは値が等しくなるので、" hat(Y)_((mu)) = hat(Y)_((M + mu)),
      exp(
        -
        sqrt(-1)
        (2 pi (-M)) / M
      )
      dot.op
      hat(Y)_((-M))
      =
      1
      dot.op
      hat(Y)_((M - 2M))
      =
      exp(
        -
        sqrt(-1)
        (2 pi M) / M
      )
      dot.op
      hat(Y)_((M))
    )
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
    [
      K_1
      dot.op
      H_1^((plus.minus)),
      K_1
      dot.op
      2
      dot.op
      (
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        dot.op
        hat(Y)_((mu))
      )
    ]
    \
    &=
    K_1^2
    dot.op
    2
    dot.op
    exp(
      -
      sqrt(-1)
      (2 pi mu) / M
    )
    dot.op
    [
      H_1^((plus.minus)),
      hat(Y)_((mu))
    ]
    \
    &=
    K_1^2
    dot.op
    2
    dot.op
    exp(
      -
      sqrt(-1)
      (2 pi mu) / M
    )
    dot.op
    (
      -
      2
      dot.op
      (
        exp(
          -
          sqrt(-1)
          (2 pi (-mu)) / M
        )
        dot.op
        hat(Z)_((mu))^((plus.minus))
      )
    )
    \
    &=
    K_1^2
    dot.op
    2^2
    dot.op
    (-1)^1
    dot.op
    exp(
      overbrace(
        -
        sqrt(-1)
        (2 pi mu) / M
        -
        sqrt(-1)
        (2 pi (-mu)) / M
        ,
        0
      )
    )
    dot.op
    hat(Z)_((mu))^((plus.minus))
    \
    &=
    K_1^2
    dot.op
    2^2
    dot.op
    (-1)^1
    dot.op
    hat(Z)_((mu))^((plus.minus))
    $

    $n = 3$
    $
    [
      K_1 dot.op H_1^((plus.minus)),
      overbrace(
      [
        K_1 dot.op H_1^((plus.minus)),
        [
          K_1 dot.op H_1^((plus.minus)),
          hat(Z)_mu^((plus.minus))
        ]
      ],
      n = 2
      )
    ]
    &=
    [
      K_1 dot.op H_1^((plus.minus)),
      K_1^2
      dot.op
      2^2
      dot.op
      (-1)^1
      dot.op
      hat(Z)_((mu))^((plus.minus))
    ]
    \
    &=
    K_1
    dot.op
    K_1^2
    dot.op
    2^2
    dot.op
    (-1)^1
    dot.op
    [
      H_1^((plus.minus)),
      hat(Z)_((mu))^((plus.minus))
    ]
    \
    &=
    K_1
    dot.op
    K_1^2
    dot.op
    2^2
    dot.op
    (-1)^1
    dot.op
    (
      2
      dot.op
      (
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        dot.op
        hat(Y)_((mu))
      )
    )
    \
    &=
    K_1^3
    dot.op
    2^3
    dot.op
    (-1)^1
    dot.op
    exp(
      -
      sqrt(-1)
      (2 pi mu) / M
    )
    dot.op
    hat(Y)_((mu))
    $

    $n = 4$
    $
    [
      K_1 dot.op H_1^((plus.minus)),
      overbrace(
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
        ,
        n = 3
      )
    ]
    &=
    [
      K_1 dot.op H_1^((plus.minus)),
      K_1^3
      dot.op
      2^3
      dot.op
      (-1)^1
      dot.op
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      dot.op
      hat(Y)_((mu))
    ]
    \
    &=
    K_1
    dot.op
    K_1^3
    dot.op
    2^3
    dot.op
    (-1)^1
    dot.op
    exp(
      -
      sqrt(-1)
      (2 pi mu) / M
    )
    dot.op
    [
      H_1^((plus.minus)),
      hat(Y)_((mu))
    ]
    \
    &=
    K_1
    dot.op
    K_1^3
    dot.op
    2^3
    dot.op
    (-1)^1
    dot.op
    exp(
      -
      sqrt(-1)
      (2 pi mu) / M
    )
    dot.op
    (
      -
      2
      dot.op
      (
        exp(
          -
          sqrt(-1)
          (2 pi (-mu)) / M
        )
        dot.op
        hat(Z)_((mu))^((plus.minus))
      )
    )
    \
    &=
    K_1^4
    dot.op
    2^4
    dot.op
    (-1)^2
    dot.op
    exp(
      -
      sqrt(-1)
      (2 pi mu) / M
    )
    dot.op
    exp(
      -
      sqrt(-1)
      (2 pi (-mu)) / M
    )
    dot.op
    hat(Z)_((mu))^((plus.minus))
    \
    &=
    K_1^4
    dot.op
    2^4
    dot.op
    (-1)^2
    dot.op
    exp(
      overbrace(
        -
        sqrt(-1)
        (2 pi mu) / M
        -
        sqrt(-1)
        (2 pi (-mu)) / M
        ,
        0
      )
    )
    dot.op
    hat(Z)_((mu))^((plus.minus))
    \
    &=
    K_1^4
    dot.op
    2^4
    dot.op
    (-1)^2
    dot.op
    hat(Z)_((mu))^((plus.minus))
    $

    $(h_1.y)$

    $n = 0$
    $
    overbrace(
      [
        K_1 dot.op H_1^((plus.minus)),
        dots,
        [K_1 dot.op H_1^((plus.minus)), hat(Y)_mu]
        dots
      ]
      ,
      0 "times"
    )
    =
    hat(Y)_mu
    $

    $n = 1$
    $
    [
      K_1 dot.op H_1^((plus.minus)),
      hat(Y)_mu
    ]
    &=
    K_1
    dot.op
    [
      H_1^((plus.minus)),
      hat(Y)_mu
    ]
    \
    &=
    K_1
    dot.op
    (
      -
      2
      dot.op
      (
        exp(
          -
          sqrt(-1)
          (2 pi (-mu)) / M
        )
        dot.op
        hat(Z)_((mu))^((plus.minus))
      )
    )
    \
    &=
    K_1
    dot.op
    2
    dot.op
    (-1)
    dot.op
    exp(
      -
      sqrt(-1)
      (2 pi (-mu)) / M
    )
    dot.op
    hat(Z)_((mu))^((plus.minus))
    $

    $n = 2$
    $
    [
      K_1 dot.op H_1^((plus.minus)),
      overbrace(
        [
          K_1 dot.op H_1^((plus.minus)),
          hat(Y)_mu
        ]
        ,
        n = 1
      )
    ]
    &=
    [
      K_1 dot.op H_1^((plus.minus)),
      K_1
      dot.op
      2
      dot.op
      (-1)
      dot.op
      exp(
        -
        sqrt(-1)
        (2 pi (-mu)) / M
      )
      dot.op
      hat(Z)_((mu))^((plus.minus))
    ]
    \
    &=
    K_1^2
    dot.op
    2
    dot.op
    (-1)
    dot.op
    exp(
      -
      sqrt(-1)
      (2 pi (-mu)) / M
    )
    dot.op
    [
      H_1^((plus.minus)),
      hat(Z)_((mu))^((plus.minus))
    ]
    \
    &=
    K_1^2
    dot.op
    2
    dot.op
    (-1)
    dot.op
    exp(
      -
      sqrt(-1)
      (2 pi (-mu)) / M
    )
    dot.op
    (
      2
      dot.op
      (
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        dot.op
        hat(Y)_((mu))
      )
    )
    \
    &=
    K_1^2
    dot.op
    2^2
    dot.op
    (-1)
    dot.op
    exp(
      -
      sqrt(-1)
      (2 pi (-mu)) / M
    )
    dot.op
    exp(
      -
      sqrt(-1)
      (2 pi mu) / M
    )
    dot.op
    hat(Y)_((mu))
    \
    &=
    K_1^2
    dot.op
    2^2
    dot.op
    (-1)
    dot.op
    exp(
      overbrace(
        -
        sqrt(-1)
        (2 pi (-mu)) / M
        -
        sqrt(-1)
        (2 pi mu) / M
        ,
        0
      )
    )
    dot.op
    hat(Y)_((mu))
    \
    &=
    K_1^2
    dot.op
    2^2
    dot.op
    (-1)
    dot.op
    hat(Y)_((mu))
    $

    $n = 3$

    $
    [
      K_1 dot.op H_1^((plus.minus)),
      overbrace(
        [
          K_1 dot.op H_1^((plus.minus)),
          [
            K_1 dot.op H_1^((plus.minus)),
            hat(Y)_mu
          ]
        ]
        ,
        n = 2
      )
    ]
    &=
    [
      K_1 dot.op H_1^((plus.minus)),
      K_1^2
      dot.op
      2^2
      dot.op
      (-1)
      dot.op
      hat(Y)_((mu))
    ]
    \
    &=
    K_1^3
    dot.op
    2^2
    dot.op
    (-1)
    dot.op
    [
      H_1^((plus.minus)),
      hat(Y)_((mu))
    ]
    \
    &=
    K_1^3
    dot.op
    2^2
    dot.op
    (-1)
    dot.op
    (
      -
      2
      dot.op
      (
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        dot.op
        hat(Z)_((mu))^((plus.minus))
      )
    )
    \
    &=
    K_1^3
    dot.op
    2^3
    dot.op
    (-1)^2
    dot.op
    exp(
      -
      sqrt(-1)
      (2 pi mu) / M
    )
    dot.op
    hat(Z)_((mu))^((plus.minus))
    $

    $(h_2.z-)$

    $n = 1$
    $
    [
      (K_2^(*)) dot.op H_2,
      hat(Z)_mu^((-))
    ]
    &=
    (K_2^(*))
    dot.op
    [
      H_2,
      hat(Z)_mu^((-))
    ]
    \
    &=
    (K_2^(*))
    dot.op
    (
      -2
      dot.op
      hat(Y)_mu
    )
    \
    &=
    (K_2^(*))^1
    dot.op
    2^1
    dot.op
    (-1)^1
    dot.op
    hat(Y)_mu
    $

    $n = 2$

    $
    [
      (K_2^(*)) dot.op H_2,
      overbrace(
        [
          (K_2^(*)) dot.op H_2,
          hat(Z)_mu^((-))
        ]
        ,
        n = 1
      )
    ]
    &=
    [
      (K_2^(*)) dot.op H_2,
      (K_2^(*))^1
      dot.op
      2^1
      dot.op
      (-1)^1
      dot.op
      hat(Y)_mu
    ]
    \
    &=
    (K_2^(*))^2
    dot.op
    2^1
    dot.op
    (-1)^1
    dot.op
    [
      H_2,
      hat(Y)_mu
    ]
    \
    &=
    (K_2^(*))^2
    dot.op
    2^1
    dot.op
    (-1)^1
    dot.op
    (
      2
      dot.op
      hat(Z)_(mu)^((-))
    )
    \
    &=
    (K_2^(*))^2
    dot.op
    2^2
    dot.op
    (-1)^1
    dot.op
    hat(Z)_(mu)^((-))
    \
    $

    $n = 3$

    $
    [
      (K_2^(*)) dot.op H_2,
      overbrace(
        [
          (K_2^(*)) dot.op H_2,
          [
            (K_2^(*)) dot.op H_2,
            hat(Z)_mu^((-))
          ]
        ]
        ,
        n = 2
      )
    ]
    &=
    [
      (K_2^(*)) dot.op H_2,
      (K_2^(*))^2
      dot.op
      2^2
      dot.op
      (-1)^1
      dot.op
      hat(Z)_(mu)^((-))
    ]
    \
    &=
    (K_2^(*))^3
    dot.op
    2^2
    dot.op
    (-1)^1
    dot.op
    [
      H_2,
      hat(Z)_(mu)^((-))
    ]
    \
    &=
    (K_2^(*))^3
    dot.op
    2^2
    dot.op
    (-1)^1
    dot.op
    (
      -2
      dot.op
      hat(Y)_mu
    )
    \
    &=
    (K_2^(*))^3
    dot.op
    2^3
    dot.op
    (-1)^2
    dot.op
    hat(Y)_mu
    \
    $
  ]

  #proof[
    TODO : note参考にして、帰納法で行ける
  ]
]<nesting_of_commutator_of_H_and_Z>

#claim($#ref(<nesting_of_commutator_of_H_and_Z>)"を使い、consh/sinhの展開係数っぽくする"$)[
  $(h_1.z)$
  $
    overbrace(
      [
        (1/2) sqrt(-1) dot.op K_1 dot.op H_1^((plus.minus)),
        dots,
        [
          (1/2) sqrt(-1) dot.op K_1 dot.op H_1^((plus.minus)),
          hat(Z)_mu^((plus.minus))
        ]
        dots
      ]
      ,
      n "times"
    )
    &=
    cases(
      sqrt(-1)
      dot.op
      K_1^(n)
      dot.op
      exp(-sqrt(-1) (2 pi mu)/(M))
      dot.op
      hat(Y)_mu
      & (n "is odd"),
      K_1^(n)
      dot.op
      hat(Z)_mu^((plus.minus))
      & (n "is even"),
    )
  $

  $(h_1.y)$
  $
    overbrace(
      [
        (1/2) sqrt(-1) dot.op K_1 dot.op H_1^((plus.minus)),
        dots,
        [
          (1/2) sqrt(-1) dot.op K_1 dot.op H_1^((plus.minus)),
          hat(Y)_mu
        ]
        dots
      ]
      ,
      n "times"
    )
    &=
    cases(
      sqrt(-1)
      dot.op
      K_1^(n)
      dot.op
      exp(-sqrt(-1) (2 pi mu)/(M))
      \
      "(次回 0419) expの方の符号がミスっている"
      \
      dot.op
      hat(Z)_mu^((plus))
      & (n "is odd"),
      K_1^(n)
      dot.op
      hat(Y)_mu
      & (n "is even"),
    )
  $

  $(h_2.z^(minus))$
  $
    overbrace(
      [
        sqrt(-1) dot.op K_2^(*) dot.op H_2,
        dots,
        [
          sqrt(-1) dot.op K_2^(*) dot.op H_2,
          hat(Z)_mu^((-))
        ]
        dots
      ]
      ,
      n "times"
    )
    &=
    cases(
      -
      sqrt(-1)
      dot.op
      (2K_2^(*))^(n)
      dot.op
      hat(Y)_mu
      & (n "is odd"),
      (2K_2^(*))^(n)
      dot.op
      hat(Z)_mu^((-))
      & (n "is even"),
    )
  $

  $(h_2.y)$
  $
    overbrace(
      [
        sqrt(-1) dot.op K_2^(*) dot.op H_2,
        dots,
        [
          sqrt(-1) dot.op K_2^(*) dot.op H_2,
          hat(Y)_mu
        ]
        dots
      ]
      ,
      n "times"
    )
    &=
    cases(
      sqrt(-1)
      dot.op
      (2K_2^(*))^(n)
      dot.op
      hat(Z)_mu^((-))
      & (n "is odd"),
      (2K_2^(*))^(n)
      dot.op
      hat(Y)_mu
      & (n "is even"),
    )
  $

  #proof[
  $
    overbrace(
      [
        (1/2) sqrt(-1) dot.op K_1 dot.op H_1^((plus.minus)),
        dots,
        [
          (1/2) sqrt(-1) dot.op K_1 dot.op H_1^((plus.minus)),
          hat(Z)_mu^((plus.minus))
        ]
        dots
      ]
      ,
      n "times"
    )
    &=
    cases(
      (-1)^((n-1)/2)
      dot.op
      (2 (1/2) sqrt(-1) dot.op K_1)^(n)
      dot.op
      exp(-sqrt(-1) (2 pi mu)/(M))
      dot.op
      hat(Y)_mu
      & (n "is odd"),
      (-1)^(n/2)
      dot.op
      (2 (1/2) sqrt(-1) dot.op K_1)^(n)
      dot.op
      hat(Z)_mu^((plus.minus))
      & (n "is even"),
    )
    \
    &=
    cases(
      (-1)^((n-1)/2)
      dot.op
      (sqrt(-1))^n
      dot.op
      K_1^(n)
      dot.op
      exp(-sqrt(-1) (2 pi mu)/(M))
      dot.op
      hat(Y)_mu
      & (n "is odd"),
      (-1)^(n/2)
      dot.op
      (sqrt(-1))^n
      dot.op
      K_1^(n)
      dot.op
      hat(Z)_mu^((plus.minus))
      & (n "is even"),
    )
    \
    &=
    cases(
      (-1)^((n-1)/2)
      dot.op
      (-1)^(n/2)
      dot.op
      K_1^(n)
      dot.op
      exp(-sqrt(-1) (2 pi mu)/(M))
      dot.op
      hat(Y)_mu
      & (n "is odd"),
      (-1)^(n/2)
      dot.op
      (-1)^(n/2)
      dot.op
      K_1^(n)
      dot.op
      hat(Z)_mu^((plus.minus))
      & (n "is even"),
    )
    \
    &=
    cases(
      (-1)^(((n-1)/2 + n/2))
      dot.op
      K_1^(n)
      dot.op
      exp(-sqrt(-1) (2 pi mu)/(M))
      dot.op
      hat(Y)_mu
      & (n "is odd"),
      (-1)^((n/2 + n/2))
      dot.op
      K_1^(n)
      dot.op
      hat(Z)_mu^((plus.minus))
      & (n "is even"),
    )
    \
    &=
    cases(
      (-1)^(((2n+2)/2 + 1/2))
      dot.op
      K_1^(n)
      dot.op
      exp(-sqrt(-1) (2 pi mu)/(M))
      dot.op
      hat(Y)_mu
      & (n "is odd"),
      (-1)^((n/2 + n/2))
      dot.op
      K_1^(n)
      dot.op
      hat(Z)_mu^((plus.minus))
      & (n "is even"),
    )
    \
    &=
    cases(
      (-1)^(n+1)
      dot.op
      (-1)^(1/2)
      dot.op
      K_1^(n)
      dot.op
      exp(-sqrt(-1) (2 pi mu)/(M))
      dot.op
      hat(Y)_mu
      & (n "is odd"),
      (-1)^(n)
      dot.op
      K_1^(n)
      dot.op
      hat(Z)_mu^((plus.minus))
      & (n "is even"),
    )
    \
    &=
    cases(
      sqrt(-1)
      dot.op
      K_1^(n)
      dot.op
      exp(-sqrt(-1) (2 pi mu)/(M))
      dot.op
      hat(Y)_mu
      & (n "is odd"),
      K_1^(n)
      dot.op
      hat(Z)_mu^((plus.minus))
      & (n "is even"),
    )
    \
    &=
    cases(
      sqrt(-1)
      dot.op
      K_1^(n)
      dot.op
      exp(-sqrt(-1) (2 pi mu)/(M))
      dot.op
      hat(Y)_mu
      & (n "is odd"),
      K_1^(n)
      dot.op
      hat(Z)_mu^((plus.minus))
      & (n "is even"),
    )
  $
  ]
]

#claim($sinh"/"cosh"のテイラー展開"$)[
  $
  sinh x &= x + (1/3!) x^3 + (1/5!) x^5 + (1/7!) x^7 + ... \
  &= sum_(
    n >= 0 \
    n "is odd"
  )^infinity
    (1/n!)
    x^n
  \
  cosh x &= 1 + (1/2!) x^2 + (1/4!) x^4 + (1/6!) x^6 + ... \
  &= sum_(
    n >= 1 \
    n "is even"
  )^infinity
    (1/n!)
    x^n
  $
]

#claim("")[

  $(h_1.z)$
  $
    sum_(
      n = 0
    )^infinity
      (1/n!)
      overbrace(
      [
        (1/2) sqrt(-1) dot.op K_1 dot.op H_1^((plus.minus)),
        dots,
        [
          (1/2) sqrt(-1) dot.op K_1 dot.op H_1^((plus.minus)),
          hat(Z)_mu^((plus.minus))
        ]
        dots
      ]
      ,
      n "times"
    )
    \
    =
    cosh(K_1)
    dot.op
    hat(Z)_mu^((plus.minus))
    +
    sqrt(-1)
    dot.op
    exp(-sqrt(-1) (2 pi mu)/(M))
    dot.op
    sinh(K_1)
    dot.op
    hat(Y)_mu
  $

  $(h_1.y)$
  $
    sum_(
      n = 0
    )^infinity
      (1/n!)
      overbrace(
      [
        (1/2) sqrt(-1) dot.op K_1 dot.op H_1^((plus.minus)),
        dots,
        [
          (1/2) sqrt(-1) dot.op K_1 dot.op H_1^((plus.minus)),
          hat(Y)_mu
        ]
        dots
      ]
      ,
      n "times"
    )
    \
    =
    -
    sqrt(-1)
    exp(
      sqrt(-1)
      (2 pi mu) / M
    )
    sinh(K_1)
    dot.op
    hat(Z)_mu^((plus.minus))
    +
    cosh(K_1)
    dot
    hat(Y)_mu
  $

  $(h_2.z^+)$
  $
    sum_(
      n = 0
    )^infinity
      (1/n!)
      overbrace(
      [
        sqrt(-1) dot.op K_2^* dot.op H_(2),
        dots,
        [
          sqrt(-1) dot.op K_2^* dot.op H_(2),
          hat(Z)_mu^((plus))
        ]
        dots
      ]
      ,
      n "times"
    )
    \
    =
    ("メモ(0322) これは使われない")
  $

  $(h_2.z^-)$
  $
    &
    sum_(
      n = 0
    )^infinity
      (1/n!)
      overbrace(
      [
        sqrt(-1) dot.op K_2^* dot.op H_2,
        dots,
        [
          sqrt(-1) dot.op K_2^* dot.op H_2,
          hat(Z)_mu^((minus))
        ]
        dots
      ]
      ,
      n "times"
    )
    \
    &quad =
    cosh(2 K_2^*)
    dot
    hat(Z)_mu^((minus))
    -
    sqrt(-1)
    sinh(2 K_2^*)
    dot
    hat(Y)_mu
  $

  $(h_2.y)$
  $
    sum_(
      n = 0
    )^infinity
      (1/n!)
      overbrace(
      [
        sqrt(-1) dot.op K_2^* dot.op H_2,
        dots,
        [
          sqrt(-1) dot.op K_2^* dot.op H_2,
          hat(Y)_mu
        ]
        dots
      ]
      ,
      n "times"
    )
    \
    =
    sqrt(-1)
    sinh(2 K_2^*)
    dot
    hat(Z)_mu^((-))
    +
    cosh(2 K_2^*)
    dot
    hat(Y)_mu
  $

 #note[
  $
  sinh x = x + (1/3!) x^3 + (1/5!) x^5 + (1/7!) x^7 + ... \
  cosh x = 1 + (1/2!) x^2 + (1/4!) x^4 + (1/6!) x^6 + ...
  $
 ]

 #proof[

  $(h_1.z)$について、
  $
    ("左辺")
    &=
    (1/0!)
    hat(Z)_mu^((plus.minus))
    +
    sum_(
      n = 1
    )^infinity
      (1/n!)
      (
        cases(
          sqrt(-1)
          dot.op
          K_1^(n)
          dot.op
          exp(-sqrt(-1) (2 pi mu)/(M))
          dot.op
          hat(Y)_mu
          & (n "is odd"),
          K_1^(n)
          dot.op
          hat(Z)_mu^((plus.minus))
          & (n "is even"),
        )
      )
    \
    &=
    sum_(
      n >= 0 \
      n "is even"
    )
    (
      (1/n!)
      K_1^(n)
      dot.op
      hat(Z)_mu^((plus.minus))
    )
    +
    sum_(
      n >= 1 \
      n "is odd"
    )
    (
      (1/n!)
      sqrt(-1)
      dot.op
      K_1^(n)
      dot.op
      exp(-sqrt(-1) (2 pi mu)/(M))
      dot.op
      hat(Y)_mu
    )
    \
    &=
    (
      sum_(
        n >= 0 \
        n "is even"
      )
      (
        (1/n!)
        K_1^(n)
      )
    )
    dot.op
    hat(Z)_mu^((plus.minus))
    +
    sqrt(-1)
    dot.op
    exp(-sqrt(-1) (2 pi mu)/(M))
    (
      sum_(
        n >= 1 \
        n "is odd"
      )
      (
        (1/n!)
        K_1^(n)
      )
    )
    dot.op
    hat(Y)_mu
    \
    &=
    cosh(K_1)
    dot.op
    hat(Z)_mu^((plus.minus))
    +
    sqrt(-1)
    dot.op
    exp(-sqrt(-1) (2 pi mu)/(M))
    dot.op
    sinh(K_1)
    dot.op
    hat(Y)_mu
    \
  $

  $(h_1.y)$について、
  $
    ("左辺")
    &=
    (1/0!)
    hat(Y)_mu
    +
    sum_(
      n = 1
    )^infinity
      (1/n!)
      (
        cases(
          sqrt(-1)
          dot.op
          K_1^(n)
          dot.op
          exp(sqrt(-1) (2 pi mu)/(M))
          dot.op
          hat(Y)_mu
          & (n "is odd"),
          K_1^(n)
          dot.op
          hat(Z)_mu^((plus.minus))
          & (n "is even"),
        )
      )
    \
    &=
    sum_(
      n >= 0 \
      n "is even"
    )
    (
      (1/n!)
      K_1^(n)
      dot.op
      hat(Z)_mu^((plus.minus))
    )
    +
    sum_(
      n >= 1 \
      n "is odd"
    )
    (
      (1/n!)
      sqrt(-1)
      dot.op
      K_1^(n)
      dot.op
      exp(sqrt(-1) (2 pi mu)/(M))
      dot.op
      hat(Y)_mu
    )
  $

  $(h_2.z^-)$について、
  $
    ("左辺")
    &=
    (1/0!)
    hat(Z)_mu^((minus))
    +
    sum_(
      n = 1
    )^infinity
      (1/n!)
      (
        cases(
          sqrt(-1)
          dot.op
          K_2^*^(n)
          dot.op
          hat(Z)_mu^((minus))
          & (n "is even"),
          sqrt(-1)
          dot.op
          K_2^*^(n)
          dot.op
          hat(Y)_mu
          & (n "is odd"),
        )
      )
    \
    &=
    sum_(
      n >= 0 \
      n "is even"
    )
    (
      (1/n!)
      K_2^*^(n)
      dot.op
      hat(Z)_mu^((minus))
    )
    +
    sum_(
      n >= 1 \
      n "is odd"
    )
    (
      (1/n!)
      sqrt(-1)
      dot.op
      K_2^*^(n)
      dot.op
      hat(Y)_mu
    )
  $

 ]
]<extract_taylor_coefficient_of_Z_Y>

#claim("")[ 
  (0313メモ) 一旦以下は受け入れる(リー環/リー群掘らないと行けなさそうで面倒)
  $
  exp(X) Y exp(-X)
    &= op("Ad")_(exp(X))(Y) \
    &= exp(op("ad")_X)(Y) \
    &= e^(op("ad")_X)(Y) \
    &= Y + [X, Y] + 1/2 [X, [X, Y]] + dots \
    &= sum_(
      n >= 0
    )^infinity
      (1/n!)
      overbrace(
      [
        X,
        dots,
        [
          X,
          Y
        ]
        dots
      ]
      ,
      n "times")
    \
    &("ただし"n=0"のとき"、
    overbrace(
      [
        X,
        dots,
        [
          X,
          Y
        ]
        dots
      ]
      ,
      n "times")"は、"X"と定める")
  $
]<exp_X_Y_exp_-X>

#definition("自己同型群/内部自己同型群/外部自己同型群")[
  群$G$について、

  $
    "Aut"(G) := { phi | phi: G -> G, phi "は群同型" } \
  $

  $"Aut"(G)$を、群$G$の自己同型群と呼ぶ。

  \

  また、

  $g in G$について、

  #mapDef($phi_g$, $G$, $G$, $h$, $g h g^(-1)$, "")

  と定め、

  #mapDef($phi$, $G$, $"Aut"(G)$, $g$, $phi_g$, "")

  と定める時、

  $"Im"(phi)$を$G$の内部自己同型群と呼び、$"Inn"(G)$と書く。

  \

  また、

  $"Aut"(G)slash"Inn"(G)$を$G$の外部自己同型群と呼び、$"Out"(G)$と書く
]

#definition("自己同型群の完全列")[
  群$G$について、

  $
    1 -> Z(G) -> G -> "Aut"(G) -> "Out"(G) -> 1
  $

  は完全列をなす

  TODO: 
  - Ker, Imの定義
  - Z(G)の定義
  - 完全列の定義

  #proof[
    TODO:
  ]
]

#definition($"環の乗法群"$)[
  環 $bold(R) = (R, +_R, dot.op_R)$ について、

  $
    bold(R)^(times) := { r "は" dot.op_R "について可逆"  | r in bold(R) }
  $

  と定める時、 $bold(R)^(times)$ は $dot.op_R$ について群をなす。

  これを $bold(R)$ の乗法群と呼ぶ。
]

#definition("TODO: クリフォード群云々")[
  - クリフォード群の定義 (2x2パウリ行列のクロネッカー積からつくる)
  - $T_g$の定義をクリフォード群の元に狭める
  - 多分$T$の(定数倍除いた)単射性が大事そうなので示す
     - これはちょっと抽象的になる可能性がある(Clと行列環の同型を示す or 認める はあんまりやりたくない)ので以下から試す？
     - 試す1. $V$を具体的な行列として書く、がゴールなので $T_((V))$からその表式を見つけられないか？
     - 試す2. $T$の(定数倍除いた)単射性を(Clに触れずに)示す
     - だめだったら3. Clと行列環の同型を認め、$T$の(定数倍除いた)単射性も認め、計算を先に進める
        - あとから Clの一般論まで戻って示す
]

#definition($T_g$)[

  $g in ("Mat"(2, CC)^(times.circle M))^(times)$ について、

  #mapDef($T_g$, $"Mat"(2, CC)^(times.circle M)$, $"Mat"(2, CC)^(times.circle M)$, $h$, $g dot.op h dot.op g^(-1)$, "")

  と定める
]

#claim("ホロノミック量子場 p142下段 1>")[
  $
  T_((V_1^((plus.minus)))^(1/2))(hat(Z)_mu^((minus)))
  &=
  (V_1^((plus.minus)))^(1/2)
  dot
  hat(Z)_mu^((minus))
  dot
  (V_1^((plus.minus)))^(-1/2) \
  &=
  cosh(K_1)
  dot
  hat(Z)_mu^((minus))
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
  &=
  mat(
    hat(Z)_mu^((minus)),
    hat(Y)_mu,
  )
  mat(
    cosh(K_1);
    sqrt(-1)
    exp(
      -
      sqrt(-1)
      (2 pi mu) / M
    )
    sinh(K_1);
  )
  \
  T_((V_1^((plus.minus)))^(1/2))(hat(Y)_mu)
  &=
  (V_1^((plus.minus)))^(1/2)
  dot
  hat(Y)_mu
  dot
  (V_1^((plus.minus)))^(-1/2) \
  &=
  -
  sqrt(-1)
  exp(
    sqrt(-1)
    (2 pi mu) / M
  )
  sinh(K_1)
  dot.op
  hat(Z)_mu^((minus))
  +
  cosh(K_1)
  dot
  hat(Y)_mu
  \
  &=
  mat(
    hat(Z)_mu^((minus)),
    hat(Y)_mu,
  )
  mat(
    sqrt(-1)
    exp(
      -
      sqrt(-1)
      (2 pi mu) / M
    )
    sinh(K_1);
    cosh(K_1);
  )
  \

  T_(V_2)(hat(Z)_mu^((minus)))
  &=
  V_2
  dot
  hat(Z)_mu^((minus))
  dot
  V_2^(-1) \
  &=
  cosh(2 K_2^*)
  dot
  hat(Z)_mu^((minus))
  -
  sqrt(-1)
  sinh(2 K_2^*)
  dot
  hat(Y)_mu
  \
  &=
  mat(
    hat(Z)_mu^((minus)),
    hat(Y)_mu,
  )
  mat(
    cosh(2 K_2^*);
    - sqrt(-1)
    sinh(2 K_2^*);
  )
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
  sinh(2 K_2^*)
  dot
  hat(Z)_mu^((-))
  +
  cosh(2 K_2^*)
  dot
  hat(Y)_mu
  \
  &=
  mat(
    hat(Z)_mu^((minus)),
    hat(Y)_mu,
  )
  mat(
    sqrt(-1)
    sinh(2 K_2^*);
    cosh(2 K_2^*);
  )
  \
  $

  #proof[
    $T_((V_1^((plus.minus)))^(1/2))(hat(Z)_mu^((minus)))$について、

    $
    T_((V_1^((plus.minus)))^(1/2))(hat(Z)_mu^((minus)))
    &=
    (V_1^((plus.minus)))^(1/2)
    dot
    hat(Z)_mu^((minus))
    dot
    (V_1^((plus.minus)))^(-1/2)
    \
    &=
    (exp(sqrt(-1) K_1 dot.op H_1^((plus.minus))))^(1/2)
    dot
    hat(Z)_mu^((minus))
    dot
    (exp(sqrt(-1) K_1 dot.op H_1^((plus.minus))))^(-1/2)
    \
    &=
    (exp((1/2) sqrt(-1) K_1 dot.op H_1^((plus.minus))))
    dot
    hat(Z)_mu^((minus))
    dot
    (exp(-((1/2) sqrt(-1) K_1 dot.op H_1^((plus.minus)))))
    \
    &=
    sum_(
      n >= 0
    )^infinity
      (1/n!)
      overbrace(
      [
        (1/2) sqrt(-1) K_1 dot.op H_1^((plus.minus)),
        dots,
        [
          (1/2) sqrt(-1) K_1 dot.op H_1^((plus.minus)),
          hat(Z)_mu^((minus))
        ]
        dots
      ]
      ,
      n "times"
    )
    \
    & quad (because #ref(<exp_X_Y_exp_-X>) )
    \
    &=
    cosh(K_1)
    dot.op
    hat(Z)_mu^((plus.minus))
    +
    sqrt(-1)
    dot.op
    exp(-sqrt(-1) (2 pi mu)/(M))
    dot.op
    sinh(K_1)
    dot.op
    hat(Y)_mu
    \
    & quad (because #ref(<extract_taylor_coefficient_of_Z_Y>) )
    $

    $T_((V_1^((plus.minus)))^(1/2))(hat(Y))$について、

    同様

    $T_(V_2)(hat(Z)_mu^((minus)))$について、

    $
    T_(V_2)(hat(Z)_mu^((minus)))
    &=
    V_2
    dot
    hat(Z)_mu^((minus))
    dot
    V_2^(-1)
    \
    &=
    (
      (2s_2)^(M/2)exp(sqrt(-1) K_2^* dot.op H_2)
    )
    dot
    hat(Z)_mu^((minus))
    dot
    (
      (2s_2)^(M/2)exp(-sqrt(-1) K_2^* dot.op H_2)
    )^(-1)
    \
    &=
    (2s_2)^(M/2)
    dot
    ((2s_2)^(M/2))^(-1)
    dot
    sum_(
      n >= 0
    )^infinity
      (1/n!)
      overbrace(
      [
        sqrt(-1) K_2^* dot.op H_2,
        dots,
        [
          sqrt(-1) K_2^* dot.op H_2,
          hat(Z)_mu^((minus))
        ]
        dots
      ]
      ,
      n "times"
    )
    \
    &=
    cosh(2 K_2^*)
    dot
    hat(Z)_mu^((minus))
    -
    sqrt(-1)
    sinh(2 K_2^*)
    dot
    hat(Y)_mu
    $

    $T_(V_2)(hat(Y)_mu)$について、

    同様


  ]
]<ホロノミック量子場_p142下段_1>

#definition(none)[
  
  $T_((V_1^((plus.minus)))^(1/2)) times T_((V_1^((plus.minus)))^(1/2)) : "Mat"(2, CC)^(times.circle M) times "Mat"(2, CC)^(times.circle M) -> "Mat"(2, CC)^(times.circle M) times "Mat"(2, CC)^(times.circle M) $

  $T_((V_2)) times T_((V_2)) : "Mat"(2, CC)^(times.circle M) times "Mat"(2, CC)^(times.circle M) -> "Mat"(2, CC)^(times.circle M) times "Mat"(2, CC)^(times.circle M)$

  を、

  $forall X, Y in "Mat"(2, CC)^(times.circle M)$
  $
    (
      T_((V_1^((plus.minus)))^(1/2)) times T_((V_1^((plus.minus)))^(1/2))
    )
    (X, Y)
    :=
    (
      T_((V_1^((plus.minus)))^(1/2))(X),
      T_((V_1^((plus.minus)))^(1/2))(Y)
    )
    \
    (
      T_((V_2)) times T_((V_2))
    )
    (X, Y)
    :=
    (
      T_((V_2))(X),
      T_((V_2))(Y)
    )
  $
  
  で定める
]

#claim(none)[
  $
    (
      T_((V_1^((plus.minus)))^(1/2)) times T_((V_1^((plus.minus)))^(1/2))
    )
    (
      hat(Z)_mu^((minus)),
      hat(Y)_mu
    )
    &=
    mat(
      mat(
        hat(Z)_mu^((minus)),
        hat(Y)_mu,
      )
      mat(
        cosh(K_1);
        sqrt(-1)
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        sinh(K_1);
      ),
      mat(
        hat(Z)_mu^((minus)),
        hat(Y)_mu,
      )
      mat(
        - sqrt(-1)
        exp(
          sqrt(-1)
          (2 pi mu) / M
        )
        sinh(K_1);
        cosh(K_1);
      )
    )
    \
    &=
    mat(
      hat(Z)_mu^((minus)),
      hat(Y)_mu,
    )
    mat(
      cosh(K_1),
      - sqrt(-1)
      exp(
        sqrt(-1)
        (2 pi mu) / M
      )
      sinh(K_1);
      sqrt(-1)
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      sinh(K_1),
      cosh(K_1);
    )
    \
    (
      T_((V_2)) times T_((V_2))
    )
    (
      hat(Z)_mu^((minus)),
      hat(Y)_mu
    )
    &=
    mat(
      mat(
        hat(Z)_mu^((minus)),
        hat(Y)_mu,
      )
      mat(
        cosh(2 K_2^*);
        - sqrt(-1)
        sinh(2 K_2^*);
      ),
      mat(
        hat(Z)_mu^((minus)),
        hat(Y)_mu,
      )
      mat(
        sqrt(-1)
        sinh(2 K_2^*);
        cosh(2 K_2^*);
      )
    )
    \
    &=
    mat(
      hat(Z)_mu^((minus)),
      hat(Y)_mu,
    )
    mat(
      cosh(2 K_2^*),
      sqrt(-1)
      sinh(2 K_2^*);
      -
      sqrt(-1)
      sinh(2 K_2^*),
      cosh(2 K_2^*);
    )
  $
]<calc_of_TxT_hatZxhatY>

#claim(none)[
  $forall a, b in CC$ について、

  $
    T_((V_1^((plus.minus)))^(1/2))(a dot.op hat(Z)_mu^((minus)) + b dot.op hat(Y)_mu)
    &=
    a dot.op T_((V_1^((plus.minus)))^(1/2))(hat(Z)_mu^((minus))) + b dot.op T_((V_1^((plus.minus)))^(1/2))(hat(Y)_mu)
    \
    &=
    mat(
      T_((V_1^((plus.minus)))^(1/2))(hat(Z)_mu^((minus))),
      T_((V_1^((plus.minus)))^(1/2))(hat(Y)_mu)
    )
    mat(
      a;
      b;
    )
    \
    T_((V_2))(a dot.op hat(Z)_mu^((minus)) + b dot.op hat(Y)_mu)
    &=
    a dot.op T_((V_2))(hat(Z)_mu^((minus))) + b dot.op T_((V_2))(hat(Y)_mu)
    \
    &=
    mat(
      T_((V_2))(hat(Z)_mu^((minus))),
      T_((V_2))(hat(Y)_mu)
    )
    mat(
      a;
      b;
    )
  $

  #proof[
    表式より、それぞれただの1次関数なので
  ]
]<linearity_of_T>

#definition($T_((V))$)[
  $forall X in "Mat"(2, CC)^(times.circle M)$について
  $
    T_((V))(X)
    :=
    T_((V_1^((plus.minus)))^(1/2))(
      T_((V_2))(
        T_((V_1^((plus.minus)))^(1/2))(
          X
        )
      )
    )
  $
]

#definition($A(theta)$)[
  
  $theta in CC$ について $A(theta) in "Mat"(2, CC)$ を、

  $
    A(theta)
    :&=
    mat(
      c_1 c_2^*
      -
      s_1 s_2^* cos theta,
      i e^(i theta) s_2^* (c_1 cos theta - i sin theta - s_1 c_2);
      - i e^(-i theta) s_2^* (c_1 cos theta + i sin theta - s_1 c_2),
      c_1 c_2^*
      -
      s_1 s_2^* cos theta;
    )
    \
    &=
    mat(
      cosh(2 K_1) cosh(2 K_2^(*))
      -
      sinh(2 K_1) sinh(2 K_2^(*)) cos(((2 pi mu) / M)),
      sqrt(-1) exp(sqrt(-1) ((2 pi mu) / M))
      sinh(2 K_2^(*)) (cosh(2 K_1) cos(((2 pi mu) / M)) - sqrt(-1) sin(((2 pi mu) / M)) - sinh(2 K_1) cosh(2 K_2));
      - sqrt(-1) exp(- sqrt(-1)((2 pi mu) / M))
      sinh(2 K_2^(*)) (cosh(2 K_1) cos(((2 pi mu) / M)) + sqrt(-1) sin(((2 pi mu) / M)) - sinh(2 K_1) cosh(2 K_2)),
      cosh(2 K_1) cosh(2 K_2^(*))
      -
      sinh(2 K_1) sinh(2 K_2^(*)) cos(((2 pi mu) / M));
    )
  $

  と定める。
]

#claim($T_((V))"の"hat(Z), hat(Y)"への作用"$)[

  $cal(M) := {-M, dots, -2, -1, 1, 2, dots, M}$ とする。

  $mu in cal(M)$について、
  
  $
    (T_((V))(hat(Z)_mu^((minus))), T_((V))(hat(Y)_mu))
    =
    (
      hat(Z)_mu^((minus)),
      hat(Y)_mu
    )
    dot.op
    A((2 pi mu) / M)
  $

  #proof[

    (z) $T_((V))(hat(Z)_mu^((minus)))$について、

    $
    T_((V))(hat(Z)_mu^((minus)))
    &=
    T_((V_1^((plus.minus)))^(1/2))(
      T_((V_2))(
        T_((V_1^((plus.minus)))^(1/2))(
          hat(Z)_mu^((minus))
        )
      )
    )
    \
    &=
    T_((V_1^((plus.minus)))^(1/2))(
      T_((V_2))(
        cosh(K_1)
        dot
        hat(Z)_mu^((minus))
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
      )
    )
    \
    &=
    T_((V_1^((plus.minus)))^(1/2))(
      mat(
        T_((V_2))(hat(Z)_mu^((minus))),
        T_((V_2))(hat(Y)_mu)
      )
      mat(
        cosh(K_1);
        sqrt(-1)
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        sinh(K_1);
      )
    )
    \ & quad
    quad (
      because #ref(<linearity_of_T>)
    )
    \
    &=
    T_((V_1^((plus.minus)))^(1/2))(
      mat(
        hat(Z)_mu^((minus)),
        hat(Y)_mu,
      )
      mat(
        cosh(2 K_2^*),
        sqrt(-1)
        sinh(2 K_2^*);
        -
        sqrt(-1)
        sinh(2 K_2^*),
        cosh(2 K_2^*);
      )
      mat(
        cosh(K_1);
        sqrt(-1)
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        sinh(K_1);
      )
    )
    \ & quad
    (
      because #ref(<calc_of_TxT_hatZxhatY>)
    )
    \
    &=
    mat(
      T_((V_1^((plus.minus)))^(1/2))(hat(Z)_mu^((minus))),
      T_((V_1^((plus.minus)))^(1/2))(hat(Y)_mu),
    )
    mat(
      cosh(2 K_2^*),
      sqrt(-1)
      sinh(2 K_2^*);
      -
      sqrt(-1)
      sinh(2 K_2^*),
      cosh(2 K_2^*);
    )
    mat(
      cosh(K_1);
      sqrt(-1)
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      sinh(K_1);
    )
    \
    &=
    mat(
      hat(Z)_mu^((minus)),
      hat(Y)_mu,
    )
    mat(
      cosh(K_1),
      sqrt(-1)
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      sinh(K_1);
      sqrt(-1)
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      sinh(K_1),
      cosh(K_1);
    )
    \ & quad quad quad
    mat(
      cosh(2 K_2^*),
      sqrt(-1)
      sinh(2 K_2^*);
      -
      sqrt(-1)
      sinh(2 K_2^*),
      cosh(2 K_2^*);
    )
    mat(
      cosh(K_1);
      sqrt(-1)
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      sinh(K_1);
    )
    $

    $(y) T_((V))(hat(Y)_mu)$について、

    $
    T_((V))(hat(Y)_mu)
    &=
    T_((V_1^((plus.minus)))^(1/2))(
      T_((V_2))(
        T_((V_1^((plus.minus)))^(1/2))(
          hat(Y)_mu
        )
      )
    )
    \
    &=
    T_((V_1^((plus.minus)))^(1/2))(
      T_((V_2))(
        - sqrt(-1)
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        sinh(K_1)
        dot.op
        hat(Z)_mu^((minus))
        +
        cosh(K_1)
        dot.op
        hat(Y)_mu
      )
    )
    \
    &=
    T_((V_1^((plus.minus)))^(1/2))(
      mat(
        T_((V_2))(hat(Z)_mu^((minus))),
        T_((V_2))(hat(Y)_mu)
      )
      mat(
        - sqrt(-1)
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        sinh(K_1);
        cosh(K_1);
      )
    )
    \ & quad
    quad (
      because #ref(<linearity_of_T>)
    )
    \
    &=
    T_((V_1^((plus.minus)))^(1/2))(
      mat(
        hat(Z)_mu^((minus)),
        hat(Y)_mu,
      )
      mat(
        cosh(2 K_2^*),
        sqrt(-1)
        sinh(2 K_2^*);
        -
        sqrt(-1)
        sinh(2 K_2^*),
        cosh(2 K_2^*);
      )
      mat(
        - sqrt(-1)
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        sinh(K_1);
        cosh(K_1);
      )
    )
    \ & quad
    (
      because #ref(<calc_of_TxT_hatZxhatY>)
    )
    \
    &=
    mat(
      T_((V_1^((plus.minus)))^(1/2))(hat(Z)_mu^((minus))),
      T_((V_1^((plus.minus)))^(1/2))(hat(Y)_mu),
    )
    mat(
      cosh(2 K_2^*),
      sqrt(-1)
      sinh(2 K_2^*);
      -
      sqrt(-1)
      sinh(2 K_2^*),
      cosh(2 K_2^*);
    )
    mat(
      sqrt(-1)
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      sinh(K_1);
      cosh(K_1);
    )
    \
    &=
    mat(
      hat(Z)_mu^((minus)),
      hat(Y)_mu,
    )
    mat(
      cosh(K_1),
      sqrt(-1)
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      sinh(K_1);
      sqrt(-1)
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      sinh(K_1),
      cosh(K_1);
    )
    \ & quad quad quad
    mat(
      cosh(2 K_2^*),
      sqrt(-1)
      sinh(2 K_2^*);
      -
      sqrt(-1)
      sinh(2 K_2^*),
      cosh(2 K_2^*);
    )
    mat(
      sqrt(-1)
      exp(
        -
        sqrt(-1)
        (2 pi mu) / M
      )
      sinh(K_1);
      cosh(K_1);
    )
    
    $

    よって、

    $
      mat(
        T_((V))(hat(Z)_mu^((minus))),
        T_((V))(hat(Y)_mu)
      )
      &=
      mat(
        mat(
          hat(Z)_mu^((minus)),
          hat(Y)_mu,
        )
        mat(
          cosh(K_1),
          -
          sqrt(-1)
          exp(
            sqrt(-1)
            (2 pi mu) / M
          )
          sinh(K_1);
          sqrt(-1)
          exp(
            -
            sqrt(-1)
            (2 pi mu) / M
          )
          sinh(K_1),
          cosh(K_1);
        )

        mat(
          cosh(2 K_2^*),
          sqrt(-1)
          sinh(2 K_2^*);
          -
          sqrt(-1)
          sinh(2 K_2^*),
          cosh(2 K_2^*);
        )
        mat(
          cosh(K_1);
          sqrt(-1)
          exp(
            -
            sqrt(-1)
            (2 pi mu) / M
          )
          sinh(K_1);
        ),
        mat(
          hat(Z)_mu^((minus)),
          hat(Y)_mu,
        )
        mat(
          cosh(K_1),
           -
          sqrt(-1)
          exp(
            sqrt(-1)
            (2 pi mu) / M
          )
          sinh(K_1);
          sqrt(-1)
          exp(
            -
            sqrt(-1)
            (2 pi mu) / M
          )
          sinh(K_1),
          cosh(K_1);
        )

        mat(
          cosh(2 K_2^*),
          sqrt(-1)
          sinh(2 K_2^*);
          -
          sqrt(-1)
          sinh(2 K_2^*),
          cosh(2 K_2^*);
        )
        mat(
           -
          sqrt(-1)
          exp(
            sqrt(-1)
            (2 pi mu) / M
          )
          sinh(K_1);
          cosh(K_1);
        )
      )
      \
      &=
      mat(
        hat(Z)_mu^((minus)),
        hat(Y)_mu,
      )
      mat(
        mat(
          cosh(K_1),
          -
          sqrt(-1)
          exp(
            sqrt(-1)
            (2 pi mu) / M
          )
          sinh(K_1);
          sqrt(-1)
          exp(
            -
            sqrt(-1)
            (2 pi mu) / M
          )
          sinh(K_1),
          cosh(K_1);
        )
        mat(
          cosh(2 K_2^*),
          sqrt(-1)
          sinh(2 K_2^*);
          -
          sqrt(-1)
          sinh(2 K_2^*),
          cosh(2 K_2^*);
        )
        mat(
          cosh(K_1);
          sqrt(-1)
          exp(
            -
            sqrt(-1)
            (2 pi mu) / M
          )
          sinh(K_1);
        ),
        mat(
          cosh(K_1),
          sqrt(-1)
          exp(
            -
            sqrt(-1)
            (2 pi mu) / M
          )
          sinh(K_1);
          sqrt(-1)
          exp(
            -
            sqrt(-1)
            (2 pi mu) / M
          )
          sinh(K_1),
          cosh(K_1);
        )

        mat(
          cosh(2 K_2^*),
          sqrt(-1)
          sinh(2 K_2^*);
          -
          sqrt(-1)
          sinh(2 K_2^*),
          cosh(2 K_2^*);
        )
        mat(
           -
          sqrt(-1)
          exp(
            sqrt(-1)
            (2 pi mu) / M
          )
          sinh(K_1);
          cosh(K_1);
        )
      )
      \
      &=
      mat(
        hat(Z)_mu^((minus)),
        hat(Y)_mu,
      )
      mat(
        cosh(K_1),
        -
        sqrt(-1)
        exp(
          sqrt(-1)
          (2 pi mu) / M
        )
        sinh(K_1);       
        sqrt(-1)
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        sinh(K_1),
        cosh(K_1)
        ;
      )
      mat(
        cosh(2 K_2^*),
        sqrt(-1)
        sinh(2 K_2^*);
        -
        sqrt(-1)
        sinh(2 K_2^*),
        cosh(2 K_2^*);
      )
      mat(
        cosh(K_1),
        -
        sqrt(-1)
        exp(
          sqrt(-1)
          (2 pi mu) / M
        )
        sinh(K_1)
        ;
        sqrt(-1)
        exp(
          -
          sqrt(-1)
          (2 pi mu) / M
        )
        sinh(K_1),
        cosh(K_1)
        ;
      )
      


    $

    TODO: mathematicaに計算させたらステートメントは正しいことはわかったので、一旦具体の計算は飛ばす (0426)

  ]
]

#claim([$A(theta)$の対角化])[

  $cal(M) := {-M, dots, -2, -1, 1, 2, dots, M}$ とする。

  $mu in cal(M)$について、

  $A((2 pi mu) / M)$の固有値は xxxx で、対応する固有ベクトルはそれぞれ hogehoge である

  #proof[
    $
    A((2 pi mu) / M)
    =
    mat(

    )
    $
    (次回 0426) 固有値/固有ベクトルを求める
  ]
]


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


= 全体のノリ
- 分配関数を行列環の元のtraceに対応させる $<-$ この元の固有値を求めたい
- その元が、行列環の「群をなす部分集合(かつ次元の低い部分空間の中にある)」の元だとわかると、リー群 リー環の対応によって計算が進む
- なので、行列環とクリフォード代数の同型が見つけたい
  - かつ、分配関数がクリフォード群の元のtraceに対応するとわかりたい


= メモ

二つの代数系の変換が関わっている
- logをとる ($RR$の同型)
    - 組み合わせ数(乗法的) -> エントロピー(加法的)
    - 分配関数のボルツマン因子(ハミルトニアンのexp)はこれによって出てくる
      - expなので逆変換
      - ハミルトニアン(=エネルギー)はエントロピー的な概念ということ
    - 分配関数は確率の規格化定数であり、仮説として「ある状態が出てくる確率は対応するボルツマン因子の値に比例する」がある
      - ボルツマン因子は組み合わせ数的な概念になっているので、組み合わせ数に確率が比例するは至極自然
      - 分配関数自体は、系の統計量である自由エネルギーなどに変換可能なので物理的に美味い

- 離散フーリエ変換 (?)
    - 畳み込み和 -> 積
    - ボルツマン因子の指数部分がもう畳み込み和みたいな形になっている
        - 二重和なので、そこを剥がす必要があるということかも
    - 巡回行列は離散フーリエ変換をすると対角化可能　らしい　
        - https://ja.wikipedia.org/wiki/%E5%B7%A1%E5%9B%9E%E8%A1%8C%E5%88%97
