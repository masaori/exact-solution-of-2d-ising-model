#import "@preview/cetz:0.1.2"
#import "@preview/commute:0.2.0": node, arr, commutative-diagram
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge
#import "theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules

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

#definition([$sqrt("")$])[

  $sqrt(dot)^(RR_(>=0)) : RR_(>=0) -> RR_(>=0)$ を、

  $x in RR_(>=0)$ について、

  $y in RR_(>=0)$ で、
  $
    y >= 0 and y^2 = x
  $

  を満たすものがただ一つ存在する (証明略)

  この$y$を用いて
  $
    sqrt(x)^(RR_(>=0)) := y
  $

  として定める。
]<definition_of_sqrt_r_positive>

#theorem([負数 $ -> sqrt("  ")$])[
  $x in RR_(< 0)$について、

  $
    x = -sqrt((-x)^2)^(RR_(>=0))
  $

  #proof[
    $
      x < 0
      \
      -sqrt(a)^(RR_(>=0)) = x "になるような" a
      \
      sqrt(a)^(RR_(>=0)) = -x
      \
      ("自乗して"a"になる実数のうち" a > 0 "のもの") = -x
      \
      ("自乗して"a"になる実数のうち" a > 0 "のもの")^2 = (-x)^2
      \
      a = (-x)^2
      \
      x = -sqrt((-x)^2)^(RR_(>=0))
    $
  ]
]<negative_number_to_sqrt>

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

#theorem("行列の組みへの作用")[
  $A, B, C in "Mat"(n, CC)$
  $
    mat(
      A B, A C
    )
    =
    A mat(
      B, C
    )
  $
]

#theorem("行列の共役")[
  $A, B in "Mat"(n, CC)$, $B$は正則とする。

  $T_(B): "Mat"(n, CC) -> "Mat"(n, CC)$を、

  $
    T_(B)(A) := B A B^(-1)
  $

  と定めるとき、$T_(B)$は線型写像である。

  #proof[
    $A, C in "Mat"(n, CC)$に対して、
    $
      T_(B)(A + C)
      &=
      B (A + C) B^(-1)
      \
      &=
      (B A + B C) B^(-1)
      \
      &=
      B A B^(-1) + B C B^(-1)
      \
      &=
      T_(B)(A) + T_(B)(C)
    $

    $alpha in CC$に対して、
    $
      T_(B)(alpha A)
      &=
      B (alpha A) B^(-1)
      \
      &=
      alpha (B A B^(-1))
      \
      &=
      alpha T_(B)(A)
    $
  ]
]<mat_conj>

#definition([$CC$の定義])[
  $CC := RR^2$ に、以下の演算を入れたもの
  
  積 $(a, b) dot.op (c, d) := (a c - b d, a d + b c)$
]

#definition([$RR -> CC$の包含写像])[
  $iota_(RR -> CC) : RR -> CC$ を
  $
    iota_(RR -> CC)(x) := (x, 0)
  $
  として定める。
  
  これを$RR$から$CC$への包含写像と呼ぶ

  略記として、

  $r in RR$ について
  
  $
    r_(CC) := iota_(RR -> CC)(r)
  $

  とかく
]

#definition([$-1$倍])[
  $z in CC$ について、
  
  $
    -z := (-1_(CC)) dot.op z
  $
]


#definition(($sqrt(-1)$))[
  $
    sqrt(-1) := sqrt(-1_(CC))
  $
]

#definition([$CC$の実部/虚部])[
  $x, y in RR, (x, y) in CC$について、

  #mapDef(
    $Re$, 
    $CC$, $RR$,
    $(x, y)$, 
    $x$,
    ""
  )

  #mapDef(
    $Im$, 
    $CC$, $RR$,
    $(x, y)$, 
    $y$,
    ""
  )

  を定め、 $Re(z), Im(z)$ をそれぞれ $z$ の実部、虚部と呼ぶ。
]

#definition([単位円])[
  $C_("unit") := { (x, y) in CC | x^2 + y^2 = 1 }$

  $C_("unit")$を単位円と呼ぶ。
]

#definition([円弧の定義])[
  $P := (x, y), Q := (x^(prime), y^(prime)) in C_("unit")$ について、

  齋藤微積分 命題 2.1.3 (1) を満たす実数 $l(P Q)$ がただ一つ存在し、それを弧$P Q$の長さと呼ぶ。
]

#definition([$CC -> C_("unit")$])[
  $c_("unit") : CC without {(0, 0)} -> C_("unit")$ を以下のように定める。

  $forall (x, y) in CC without {(0, 0)}$ について、

  以下を満たすような、$r in RR_(>0) と (x_(c), y_(c)) in C_("unit")$ が ただ一つずつ存在する

  $
    r x_(c) = x and r y_(c) = y
  $

  これを用いて、

  $
    c_("unit")(x, y) := (x_(c), y_(c))
  $
]

#definition([$CC$の逆三角関数の定義])[
  $A := (1, 0) in CC$ と定める。


  i) $arcsin : {y in RR | -1 <= y <= 1} -> {theta in RR | -pi/2 <= theta <= pi/2}$ を以下のように定める。

  $y in RR, 0 <= y <= 1$ について、 $P := (sqrt(1 - y^2)^(RR_(>=0)), y) in C_("unit")$ とおき、

  $
    arcsin(y) := l(A P)
  $

  と定め、

  $y^prime in RR, -1 <= y^prime <= 0$ について、

  $
    arcsin(y^prime) := -arcsin(-y^prime)
  $

  と定める。

  ii) $arctan : RR -> {theta in RR | -pi/2 <= theta <= pi/2}$ を以下のように定める.

  $x in RR$ について、$-1 <= x / sqrt(1 + x^2)^(RR_(>=0)) <= 1$ であるから、

  $
    arctan(x) := arcsin(x / sqrt(1 + x^2)^(RR_(>=0)))
  $

  iii) $sin: { theta in RR | - pi / 2 <= theta <= pi / 2 } -> {x in RR | -1 <= x <= 1}$ を以下のように定める.

  $arcsin$は${x in RR | -1 <= x <= 1}$において単調増加かつ連続(証明:齋藤命題2.1.5)であり、値域が ${x in RR | - pi / 2 <= x <= pi / 2}$ であるから、

  $arcsin$の逆関数が存在し、これを$sin$と定める。

  iv) $cos: { theta in RR | - pi / 2 <= theta <= pi / 2 } -> {x in RR | -1 <= x <= 1}$ を以下のように定める.

  $- pi / 2 <= theta <= pi / 2$ で $-1 <= sin(theta) <= 1$ であるから、

  $
    cos(theta) := sqrt(1 - (sin(theta))^2)^(RR_(>=0))
  $

  と定める。
]

#claim([$cos(arctan(x)), sin(arctan(x))$])[
  $x in RR$について、$-1 <= x / sqrt(1 + x^2)^(RR_(>=0)) <= 1$であるから、
  
  $
    cos(arctan(x))
    &=
    cos(arcsin(x / sqrt(1 + x^2)^(RR_(>=0))))
    \
    &=
    sqrt(
      1
      -
      (
        sin(
          arcsin(x / sqrt(1 + x^2)^(RR_(>=0)))
        )
      )
      ^2
    )^(RR_(>=0))
    \
    &=
    sqrt(
      1
      -
      (
        x / sqrt(1 + x^2)^(RR_(>=0))
      )
      ^2
    )^(RR_(>=0))
    \
    &=
    sqrt(
      1
      -
      (
        x^2 / (1 + x^2)
      )
    )^(RR_(>=0))
    \
    &=
    sqrt(
      (
        (1 + x^2) - x^2
      )
      /
      (1 + x^2)
    )^(RR_(>=0))
    \
    &=
    sqrt(
      1
      /
      (1 + x^2)
    )^(RR_(>=0))
    \
    &=
    1
    /
    sqrt(
      1 + x^2
    )^(RR_(>=0))
  $

  $
    sin(arctan(x))
    &=
    sin(arcsin(x / sqrt(1 + x^2)^(RR_(>=0))))
    \
    &=
    x / sqrt(1 + x^2)^(RR_(>=0))
  $
]<cos_arctan_sin_arctan>


#definition([角度表現の同値類])[
  $RR$ の同値関係 $~_(angle)$ を $theta, theta^prime in RR$に対して、

  $
    theta ~_(angle) theta^prime
    attach(<=>, t:"def")
    exists n in ZZ "s.t." (theta - theta^prime) = 2n pi
  $

  と定めると、商集合 $RR \/ ~_(angle)$ が定まる。

  $theta in RR$ の$RR \/ ~_(angle)$における同値類を

  $
    [theta]_(~_(angle)) in RR \/ ~_(angle)
  $

  と書く。
]

#definition([角度表現の切断])[
  $s_((-pi, pi]) : RR \/ ~_(angle) -> (-pi, pi]$ を以下のように定める。

  $[theta]_(~_(angle)) in RR \/ ~_(angle)$ に対して、

  $n in ZZ$ で、

  $
    -pi < theta - 2n pi <= pi
  $

  を満たすようなものがただ一つ存在して、(証明略)

  この $n$ を用いて、

  $
    s_((-pi, pi])([theta]_(~_(angle))) := theta - 2n pi
  $

  と定める。
]

#definition([$RR$の角度表現])[
  $RR$の (角度表現) を、 $RR \/ ~_(angle)$ に、

  #mapDef(
    $"和" +$,
    $RR \/ ~_(angle) times RR \/ ~_(angle)$,
    $RR \/ ~_(angle)$,
    $([theta]_(~_(angle)), [theta^prime]_(~_(angle)))$,
    $[theta + theta^prime]_(~_(angle))$,
    ""
  )

  #mapDef(
    $"実数倍" dot.op_("real")$,
    $RR times RR \/ ~_(angle)$,
    $RR \/ ~_(angle)$,
    $(a, [theta]_(~_(angle)))$,
    $[a dot.op s_((-pi, pi])([theta]_(~_(angle)))]_(~_(angle))$,
    ""
  )

  を入れたものとして定める

  #note[

    この積$dot.op_("real")$は、例えば、

    $
      1/2 dot.op_("real") (-2 dot.op_("real") [pi/2]_(~_(angle)))
      &=
      [1/2 dot.op s_((-pi, pi])[-2 dot.op s_((-pi, pi])([pi/2]_(~_(angle)))]_(~_(angle))]_(~_(angle))
      \
      &=
        [1/2 dot.op s_((-pi, pi])[-2 dot.op pi/2]_(~_(angle))]_(~_(angle))
      \
      &=
        [1/2 dot.op s_((-pi, pi])[- pi]_(~_(angle))]_(~_(angle))
      \
      &=
        [1/2 dot.op pi]_(~_(angle))
      \
      &=
        pi/2
    $

    $
      (1/2 dot.op -2) dot.op_("real") [pi/2]_(~_(angle))
      &=
        [-1 dot.op s_((-pi, pi])([pi/2]_(~_(angle)))]_(~_(angle))
      \
      &=
        [-1 dot.op pi/2]_(~_(angle))
      \
      &=
        -pi/2
    $

    より、スカラー積とはならない

  ]
]

#definition([極座標表現の同値類])[
  $RR_(>=0) times RR$ の同値関係 $~$ を $(r, theta), (r^prime, theta^prime) in RR_(>=0) times RR$ に対して、
  $
    (r, theta) ~ (r^prime, theta^prime)
    attach(<=>, t:"def")
    r = r^prime = 0 or (r = r^prime and theta ~_(angle) theta^prime)
  $
  と定めると、商集合 $(RR_(>=0) times RR) \/ ~$ が定まる。

  $(r, theta) in RR_(>=0) times RR$の $(RR_(>=0) times RR) \/ ~$ における同値類を

  $
    [(r, theta)]_(~) in (RR_(>=0) times RR) \/ ~
  $

  と書く
]

#remark[
  $
    [(r, theta)]_(~) = [(r, theta + 2n pi)]_(~) forall n in ZZ
  $
  $
    [(0, theta)]_(~) = [(0, theta^prime)]_(~) forall theta, theta^prime in RR
  $
]

#definition([極座標表現の演算])[
  $(RR_(>=0) times RR) \/ ~$ に、二項演算

  #mapDef(
    $dot.op$,
    [$(RR_(>=0) times RR) \/ ~ times (RR_(>=0) times RR) \/ ~$],
    $(RR_(>=0) times RR) \/ ~$,
    $([(r, theta)]_(~), [(r^prime, theta^prime)]_(~))$,
    $[(r r^prime, theta + theta^prime)]_(~)$,
    ""
  )

  を入れたものを (極座標表現) と呼ぶ
]

#claim([(極座標表現)の乗法群])[
  (極座標表現) は 二項演算$dot.op$ について、モノイドをなす

  $"(極座標表現)"^(times) := "(極座標表現)" \\ { [(0, 0)]_(~) }$ は、二項演算 $dot.op$ について、群をなす

  $[(r, theta)]_(~), r eq.not 0$について、逆元 $([(r, theta)]_(~))^(-1)$ は、

  $
    [(r, theta)]_(~))^(-1) = [(1 / r, -theta)]_(~)
  $

  #proof[TODO]
]

#claim([$CC$の乗法群])[
  $CC^(times) := CC \\ { (0, 0) }$ は 群をなす

  $z in CC, z eq.not 0$ について、逆元 $z^(-1)$ を、

  $
    z^(-1) = 1 / z
  $

  と書く

  #proof[TODO]
]

#claim([$CC$は体])[
  $CC$ は体をなす

  #proof[TODO]
]

#definition([極座標表現の$CC$への写像])[
    $phi_("polar") : CC -> "(極座標表現)"$を以下のように定める。

    $
      phi_("polar")(x, y)
      :=
      cases(
        [(sqrt(x^2 + y^2)^(RR_(>=0)), arctan(y/x))]_(~) & quad (x > 0),
        [(sqrt(x^2 + y^2)^(RR_(>=0)), arctan(y/x) + pi)]_(~) & quad (x < 0, y >= 0),
        [(sqrt(x^2 + y^2)^(RR_(>=0)), arctan(y/x) - pi)]_(~) & quad (x < 0, y < 0),
        [(y, pi / 2)]_(~) & quad (x = 0 and y > 0),
        [(-y, -pi / 2)]_(~) & quad (x = 0 and y < 0),
        [(0, 0)]_(~) & quad (x = 0 and y = 0)
      )
    $
]

#definition([$CC$の極座標表現への写像])[
  $phi_("cartesian"): "(極座標表現)" -> CC$ を、以下のように定める。

  $
    phi_("cartesian")([(r, theta)]_(~)) := (r cos(theta), r sin(theta))
  $

  #note[

    $
      [theta]_(~_(angle)) = [theta^(prime)]_(~_(angle))
      \
      &=> exists n in ZZ "s.t." (theta - theta^prime) = 2n pi
      \
      &=> cos(theta) = cos(theta^prime) and sin(theta) = sin(theta^prime)
    $

  ]
]

#claim([$phi_("cartesian")$の同型性])[
  $[(r, theta)]_(~), [(r^prime, theta^prime)]_(~) in "(極座標表現)"$に対して、

  + $phi_("cartesian")([(r, theta)]_(~) dot.op [(r^prime, theta^prime)]_(~)) = phi_("cartesian")[(r, theta)]_(~) dot.op phi_("cartesian")[(r^prime, theta^prime)]_(~) quad "(モノイド準同型)"$ 
  + $phi_("cartesian")$は全単射

  #proof[
    1. 
    $[(r, theta)]_(~), [(r^prime, theta^prime)]_(~) in "(極座標表現)"$に対して、
    $
      phi_("cartesian")([(r, theta)]_(~) dot.op [(r^prime, theta^prime)]_(~))
      &=
      phi_("cartesian")([(r r^prime, theta + theta^prime)]_(~))
      \
      &=
      (r r^prime cos(theta + theta^prime), r r^prime sin(theta + theta^prime))
    $

    また、

    $
      phi_("cartesian")[(r, theta)]_(~) dot.op phi_("cartesian")[(r^prime, theta^prime)]_(~)
      &=
      (r cos(theta), r sin(theta)) dot.op (r^prime cos(theta^prime), r^prime sin(theta^prime))
      \
      &=
      (r r^prime cos(theta) cos(theta^prime) - r r^prime sin(theta) sin(theta^prime),
        r r^prime cos(theta) sin(theta^prime) + r r^prime sin(theta) cos(theta^prime))
      \
      \
      &=
      (r r^prime (cos(theta) cos(theta^prime) - sin(theta) sin(theta^prime)),
        r r^prime (cos(theta) sin(theta^prime) + sin(theta) cos(theta^prime)))
      \
      &=
      (r r^prime cos(theta + theta^prime), r r^prime sin(theta + theta^prime))
    $

    $qed$

    #note[

      $(-1/2, sqrt(3)/2)$

      $
        sin(arctan(y / x))
        &=
        sin(arctan((sqrt(3)^(RR_(>=0))/2) / (-1/2)))
        \
        &=
        sin(arctan(-sqrt(3)^(RR_(>=0))))
        \
        &=
        sin(arcsin(-sqrt(3)^(RR_(>=0)) / sqrt(1 + (-sqrt(3))^2)^(RR_(>=0))))
        \
        &=
        -sqrt(3)^(RR_(>=0)) / sqrt(1 + (-sqrt(3)^(RR_(>=0)))^2)^(RR_(>=0))
        \
        &=
        -sqrt(3)^(RR_(>=0)) / sqrt(1 + 3)^(RR_(>=0))
        \
        &=
        -sqrt(3)^(RR_(>=0)) / sqrt(4)^(RR_(>=0))
        \
        &=
        -sqrt(3)^(RR_(>=0)) / 2^(RR_(>=0))
      $
      
      $
        sin(arctan(y / x))
        &=
        sin(arcsin((y/x) / sqrt(1 + ((y/x))^2)^(RR_(>=0))))
        \
        &=
        (y/x) / sqrt(1 + (y/x)^2)^(RR_(>=0))
        \
        &=
        y / (x sqrt(1 + (y/x)^2)^(RR_(>=0)))
        \
        &=
        y / (-sqrt((-x)^2)^(RR_(>=0)) sqrt(1 + (y/x)^2)^(RR_(>=0)))
        \
        &=
        y / (-sqrt(x^2)^(RR_(>=0)) sqrt(1 + (y/x)^2)^(RR_(>=0)))
        \
        &=
        -y / (sqrt((x^2)(1 + (y/x)^2))^(RR_(>=0)))
        \
        &=
        -y / sqrt(x^2 + y^2)^(RR_(>=0))
      $

      $
        x < 0
        \
        -sqrt(a)^(RR_(>=0)) = x "になるような" a
        \
        sqrt(a)^(RR_(>=0)) = -x
        \
        ("自乗して"a"になる実数のうち" a > 0 "のもの") = -x
        \
        ("自乗して"a"になる実数のうち" a > 0 "のもの")^2 = (-x)^2
        \
        a = (-x)^2
        \
        x = -sqrt((-x)^2)^(RR_(>=0))
      $

      $
          cos(arctan(y / x) + pi)
          &=
          -cos(arctan(y / x))
          \
          &=
          -cos(arctan((sqrt(3)^(RR_(>=0))/2) / (-1/2)))
          \
          &=
          -cos(arctan(-sqrt(3)^(RR_(>=0))))
          \
          &=
          -cos(arcsin(-sqrt(3)^(RR_(>=0)) / sqrt(1 + (-sqrt(3)^(RR_(>=0)))^2)^(RR_(>=0))))
          \
          &=
          -sqrt(1 - (sin(arcsin(-sqrt(3)^(RR_(>=0)) / sqrt(1 + (-sqrt(3)^(RR_(>=0)))^2)^(RR_(>=0))))^2))^(RR_(>=0))
          \
          &=
          -sqrt(1 - (-sqrt(3)^(RR_(>=0)) / sqrt(1 + (-sqrt(3)^(RR_(>=0)))^2)^(RR_(>=0)))^2)^(RR_(>=0))
          \
          &=
          -sqrt(1 - (3 / (1 + (-sqrt(3)^(RR_(>=0)))^2)))^(RR_(>=0))
          \
          &=
          -sqrt(1 - (3 / (1 + 3)))^(RR_(>=0))
          \
          &=
          -sqrt(1 - (3 / 4))^(RR_(>=0))
          \
          &=
          -sqrt(1 / 4)^(RR_(>=0))
          \
          &=
          -1/2
          

      $
    ]

    2.
    $
      phi_("cartesian") o phi_("polar") (x, y)
      &=
      phi_("cartesian")(
        cases(
          [(sqrt(x^2 + y^2)^(RR_(>=0)), arctan(y/x))]_(~) & quad (x > 0),
          [(sqrt(x^2 + y^2)^(RR_(>=0)), arctan(y/x) + pi)]_(~) & quad (x < 0, y >= 0),
          [(sqrt(x^2 + y^2)^(RR_(>=0)), arctan(y/x) - pi)]_(~) & quad (x < 0, y < 0),
          [(y, pi / 2)]_(~) & quad (x = 0 and y > 0),
          [(-y, -pi / 2)]_(~) & quad (x = 0 and y < 0),
          [(0, 0)]_(~) & quad (x = 0 and y = 0)
        )
      )
      \
      &=
      cases(
        (
          sqrt(x^2 + y^2)^(RR_(>=0)) cos(arctan(y/x)),
          sqrt(x^2 + y^2)^(RR_(>=0)) sin(arctan(y/x))
        ) & quad (x > 0),
        (
          sqrt(x^2 + y^2)^(RR_(>=0)) cos(arctan(y/x) + pi),
          sqrt(x^2 + y^2)^(RR_(>=0)) sin(arctan(y/x) + pi)
        ) & quad (x < 0, y >= 0),
        (
          sqrt(x^2 + y^2)^(RR_(>=0)) cos(arctan(y/x) - pi),
          sqrt(x^2 + y^2)^(RR_(>=0)) sin(arctan(y/x) - pi)
        ) & quad (x < 0, y < 0),
        (y cos(pi / 2), y sin(pi / 2)) & quad (x = 0 and y > 0),
        (-y cos(-pi / 2), -y sin(-pi / 2)) & quad (x = 0 and y < 0),
        (0, 0) & quad (x = 0 and y = 0)
      )
      \
      &=
      cases(
        (
          sqrt(x^2 + y^2)^(RR_(>=0)) cos(arctan(y/x)),
          sqrt(x^2 + y^2)^(RR_(>=0)) sin(arctan(y/x))
        ) & quad (x > 0),
        (
          sqrt(x^2 + y^2)^(RR_(>=0)) (-cos(arctan(y/x))),
          sqrt(x^2 + y^2)^(RR_(>=0)) (-sin(arctan(y/x)))
        ) & quad (x < 0, y >= 0),
        (
          sqrt(x^2 + y^2)^(RR_(>=0)) (-cos(arctan(y/x))),
          sqrt(x^2 + y^2)^(RR_(>=0)) (-sin(arctan(y/x)))
        ) & quad (x < 0, y < 0),
        (y cos(pi / 2), y sin(pi / 2)) & quad (x = 0 and y > 0),
        (-y cos(-pi / 2), -y sin(-pi / 2)) & quad (x = 0 and y < 0),
        (0, 0) & quad (x = 0 and y = 0)
      )
      \
      &=
      cases(
        (
          sqrt(x^2 + y^2)^(RR_(>=0)) cos(arctan(y/x)),
          sqrt(x^2 + y^2)^(RR_(>=0)) sin(arctan(y/x))
        ) & quad (x > 0),
        (
          - sqrt(x^2 + y^2)^(RR_(>=0)) cos(arctan(y/x)),
          - sqrt(x^2 + y^2)^(RR_(>=0)) sin(arctan(y/x))
        ) & quad (x < 0),
        (y cos(pi / 2), y sin(pi / 2)) & quad (x = 0 and y > 0),
        (-y cos(-pi / 2), -y sin(-pi / 2)) & quad (x = 0 and y < 0),
        (0, 0) & quad (x = 0 and y = 0)
      )
      \
      &=
      cases(
        (
          sqrt(x^2 + y^2)^(RR_(>=0)) 1 / sqrt(1 + (y/x)^2)^(RR_(>=0)),
          sqrt(x^2 + y^2)^(RR_(>=0)) (y/x) / sqrt(1 + (y/x)^2)^(RR_(>=0))
        ) & quad (x > 0),
        (
          - sqrt(x^2 + y^2)^(RR_(>=0)) 1 / sqrt(1 + (y/x)^2)^(RR_(>=0)),
          - sqrt(x^2 + y^2)^(RR_(>=0)) (y/x) / sqrt(1 + (y/x)^2)^(RR_(>=0))
        ) & quad (x < 0),
        (y cos(pi / 2), y sin(pi / 2)) & quad (x = 0 and y > 0),
        (-y cos(-pi / 2), -y sin(-pi / 2)) & quad (x = 0 and y < 0),
        (0, 0) & quad (x = 0 and y = 0)
      ) quad (because #ref(<cos_arctan_sin_arctan>))
      \
      &=
      cases(
        (
          sqrt(x^2 + y^2)^(RR_(>=0)) x / (x sqrt(1 + (y/x)^2)^(RR_(>=0))),
          sqrt(x^2 + y^2)^(RR_(>=0)) (x (y/x)) / (x sqrt(1 + (y/x)^2)^(RR_(>=0)))
        ) & quad (x > 0),
        (
          - sqrt(x^2 + y^2)^(RR_(>=0)) x / (x sqrt(1 + (y/x)^2)^(RR_(>=0))),
          - sqrt(x^2 + y^2)^(RR_(>=0)) (x (y/x)) / (x sqrt(1 + (y/x)^2)^(RR_(>=0)))
        ) & quad (x < 0),
        (y cos(pi / 2), y sin(pi / 2)) & quad (x = 0 and y > 0),
        (-y cos(-pi / 2), -y sin(-pi / 2)) & quad (x = 0 and y < 0),
        (0, 0) & quad (x = 0 and y = 0)
      )
      \
      &=
      cases(
        (
          sqrt(x^2 + y^2)^(RR_(>=0)) x / (sqrt(x^2)^(RR_(>=0)) sqrt(1 + (y/x)^2)^(RR_(>=0))),
          sqrt(x^2 + y^2)^(RR_(>=0)) y / (sqrt(x^2)^(RR_(>=0)) sqrt(1 + (y/x)^2)^(RR_(>=0)))
        ) & quad (x > 0),
        (
          - sqrt(x^2 + y^2)^(RR_(>=0)) x / (-sqrt((-x)^2)^(RR_(>=0)) sqrt(1 + (y/x)^2)^(RR_(>=0))),
          - sqrt(x^2 + y^2)^(RR_(>=0)) y / (-sqrt((-x)^2)^(RR_(>=0)) sqrt(1 + (y/x)^2)^(RR_(>=0)))
        ) & quad (x < 0),
        (y cos(pi / 2), y sin(pi / 2)) & quad (x = 0 and y > 0),
        (-y cos(-pi / 2), -y sin(-pi / 2)) & quad (x = 0 and y < 0),
        (0, 0) & quad (x = 0 and y = 0)
      ) quad (because #ref(<negative_number_to_sqrt>))
      \
      &=
      cases(
        (
          sqrt(x^2 + y^2)^(RR_(>=0)) x / (sqrt(x^2(1 + (y/x)^2))^(RR_(>=0))),
          sqrt(x^2 + y^2)^(RR_(>=0)) y / (sqrt(x^2(1 + (y/x)^2))^(RR_(>=0)))
        ) & quad (x > 0),
        (
          sqrt(x^2 + y^2)^(RR_(>=0)) x / (sqrt((-x)^2(1 + (y/x)^2))^(RR_(>=0))),
          sqrt(x^2 + y^2)^(RR_(>=0)) y / (sqrt((-x)^2(1 + (y/x)^2))^(RR_(>=0)))
        ) & quad (x < 0),
        (y cos(pi / 2), y sin(pi / 2)) & quad (x = 0 and y > 0),
        (-y cos(-pi / 2), -y sin(-pi / 2)) & quad (x = 0 and y < 0),
        (0, 0) & quad (x = 0 and y = 0)
      )
      \
      &=
      cases(
        (
          sqrt(x^2 + y^2)^(RR_(>=0)) x / (sqrt(x^2 + y^2)^(RR_(>=0))),
          sqrt(x^2 + y^2)^(RR_(>=0)) y / (sqrt(x^2 + y^2)^(RR_(>=0)))
        ) & quad (x > 0),
        (
          sqrt(x^2 + y^2)^(RR_(>=0)) x / (sqrt((-x)^2 + y^2)^(RR_(>=0))),
          sqrt(x^2 + y^2)^(RR_(>=0)) y / (sqrt((-x)^2 + y^2)^(RR_(>=0)))
        ) & quad (x < 0),
        (y cos(pi / 2), y sin(pi / 2)) & quad (x = 0 and y > 0),
        (-y cos(-pi / 2), -y sin(-pi / 2)) & quad (x = 0 and y < 0),
        (0, 0) & quad (x = 0 and y = 0)
      )
      \
      &=
      cases(
        (
          sqrt(x^2 + y^2)^(RR_(>=0)) x / (sqrt(x^2 + y^2)^(RR_(>=0))),
          sqrt(x^2 + y^2)^(RR_(>=0)) y / (sqrt(x^2 + y^2)^(RR_(>=0)))
        ) & quad (x > 0),
        (
          sqrt(x^2 + y^2)^(RR_(>=0)) x / (sqrt(x^2 + y^2)^(RR_(>=0))),
          sqrt(x^2 + y^2)^(RR_(>=0)) y / (sqrt(x^2 + y^2)^(RR_(>=0)))
        ) & quad (x < 0),
        (y cos(pi / 2), y sin(pi / 2)) & quad (x = 0 and y > 0),
        (-y cos(-pi / 2), -y sin(-pi / 2)) & quad (x = 0 and y < 0),
        (0, 0) & quad (x = 0 and y = 0)
      )
      \
      &=
      cases(
        (
           x,
           y
        ) & quad (x > 0),
        (
           x,
           y
        ) & quad (x < 0),
        (y dot.op 0, y dot.op 1) & quad (x = 0 and y > 0),
        (-y dot.op 0, -y dot.op (-1)) & quad (x = 0 and y < 0),
        (0, 0) & quad (x = 0 and y = 0)
      )
      \
      &=
      cases(
        (
           x,
           y
        ) & quad (x > 0),
        (
           x,
           y
        ) & quad (x < 0),
        (0, y) & quad (x = 0 and y > 0),
        (0, y) & quad (x = 0 and y < 0),
        (0, 0) & quad (x = 0 and y = 0)
      )
      \
      &=
      (x, y)
    $
  ]
]

#definition([第1座標, 第2座標])[
  $(r, theta) in "(極座標表現)"$について、

  $
    #mapDef([第1座標 $"pr"_1$], "(極座標表現)", $RR_(>=0)$, $[(r, theta)]_(~)$, $r$, "")
  $

  $$

  $
    #mapDef(
      [第2座標 $"pr"_2$],
      "(極座標表現)",
      "(角度表現)",
      $[(r, theta)]_(~)$, 
      $
        cases(
          [0]_(~_(angle)) & quad (r = 0),
          [theta]_(~_(angle)) & quad (r != 0),
        )
      $, "")
  $
]

#definition([絶対値, 偏角])[
  $z in CC$ について、

  $|dot|: CC -> RR_(>=0)$ を

  $
    |z| := "pr"_1(phi_("polar")(z))
  $

  と定め、zの絶対値と呼ぶ

  $arg^((-pi, pi]): CC -> RR$ を

  $
    arg^((-pi, pi])(z) := s_((-pi, pi])("pr"_2(phi_("polar")(z)))
  $

  と定め、zの偏角と呼ぶ
]

#definition([$CC$のsqrt])[
  $sqrt(dot.c): CC -> CC$ を以下のように定める。

  $z in CC$ について、

  $
    sqrt(z)
    :=
    phi_("cartesian")
    (
      [(
        sqrt("pr"_1(phi_("polar")(z)))^(RR_(>=0)), 
        1/2 dot.op s_((-pi, pi])("pr"_2(phi_("polar")(z)))
      )]_(~)
    )
  $
]

#claim(none)[
  $z in CC$ について、

  $r in RR_(>=0), theta in RR$ を用いて

  $phi_("polar")(z) = [(r, theta)]_(~)$ であり、

  $n in ZZ$ を用いて、

  $-pi < theta - 2n pi <= pi (<=> (2n - 1)pi < theta <= (2n + 1)pi)$ であるとき、

  $
    sqrt(z)
    &=
    phi_("cartesian")
    (
      [
        sqrt(r)^(RR_(>=0)), 
        1/2 dot.op s_((-pi, pi])([theta]_(~_(angle)))
      ]_(~)
    )
    \
    &=
    phi_("cartesian")
    (
      [
        sqrt(r)^(RR_(>=0)), 
        1/2 dot.op (theta - 2n pi)
      ]_(~)
    )
    \
    &=
    phi_("cartesian")
    (
      [
        sqrt(r)^(RR_(>=0)), 
        theta/2 - n pi
      ]_(~)
    )
  $

  #proof[
    TODO: 
  ]
]


#claim([sqrt と 積が可換になる条件])[
  $z_1, z_2 in CC$ について、

  $r_1, r_2 in RR_(>=0), theta_1, theta_2 in RR$ を用いて

  $phi_("polar")(z_1) = [(r_1, theta_1)]_(~), phi_("polar")(z_2) = [(r_2, theta_2)]_(~)$

  とするとき、

  $
    sqrt(z_1 z_2)
    &=
    cases(
      -sqrt(z_1) sqrt(z_2) & quad (exists m in ZZ "s.t." -2pi < theta_1 + theta_2 - 2m pi <= -pi),
      sqrt(z_1) sqrt(z_2) & quad ((r_1 = 0 or r_2 = 0) or exists m in ZZ "s.t." -pi < theta_1 + theta_2 - 2m pi <= pi),
      -sqrt(z_1) sqrt(z_2) & quad (exists m in ZZ "s.t." pi < theta_1 + theta_2 - 2m pi <= 2pi),
    )
  $

  #proof[
    $z_1, z_2 in CC$ について、

    $r_1, r_2 in RR_(>=0), theta_1, theta_2 in RR$ で

    $phi_("polar")(z_1) = [(r_1, theta_1)]_(~), phi_("polar")(z_2) = [(r_2, theta_2)]_(~)$

    とするとき、

    $
      sqrt(z_1 z_2)
      &=
      phi_("cartesian")
      (
        [(
          sqrt("pr"_1(phi_("polar")(z_1 z_2)))^(RR_(>=0)), 
          1/2 dot.op s_((-pi, pi])("pr"_2(phi_("polar")(z_1 z_2)))
        )]_(~)
      )
      \
      &=
      phi_("cartesian")
      (
        [(
          sqrt("pr"_1(phi_("polar")(z_1) phi_("polar")(z_2)))^(RR_(>=0)), 
          1/2 dot.op s_((-pi, pi])("pr"_2(phi_("polar")(z_1) phi_("polar")(z_2)))
        )]_(~)
      )
      quad
      (because phi_("polar")"の同型性")
      \
      &=
      phi_("cartesian")
      (
        [(
          sqrt("pr"_1([(r_1, theta_1)]_(~) [(r_2, theta_2)]_(~)))^(RR_(>=0)), 
          1/2 dot.op s_((-pi, pi])("pr"_2([(r_1, theta_1)]_(~) [(r_2, theta_2)]_(~)))
        )]_(~)
      )
      \
      &=
      phi_("cartesian")
      (
        [(
          sqrt("pr"_1([(r_1 r_2, theta_1 + theta_2)]_(~)))^(RR_(>=0)), 
          1/2 dot.op s_((-pi, pi])("pr"_2([(r_1 r_2, theta_1 + theta_2)]_(~)))
        )]_(~)
      )
      \
      &=
      phi_("cartesian")
      (
        [(
          sqrt(r_1 r_2)^(RR_(>=0)), 
          1/2 dot.op s_((-pi, pi])([theta_1 + theta_2]_(~_(angle)))
        )]_(~)
      )
      \
      &=
      (
        sqrt(r_1 r_2)^(RR_(>=0)) cos(1/2 dot.op s_((-pi, pi])([theta_1 + theta_2]_(~_(angle)))),
        sqrt(r_1 r_2)^(RR_(>=0)) sin(1/2 dot.op s_((-pi, pi])([theta_1 + theta_2]_(~_(angle))))
      )
    $

    $
      sqrt(z_1) sqrt(z_2)
      &=
      phi_("cartesian")
      (
        [(
          sqrt("pr"_1(phi_("polar")(z_1)))^(RR_(>=0)), 
          1/2 dot.op s_((-pi, pi])("pr"_2(phi_("polar")(z_1)))
        )]_(~)
      )
      phi_("cartesian")
      (
        [(
          sqrt("pr"_1(phi_("polar")(z_2)))^(RR_(>=0)), 
          1/2 dot.op s_((-pi, pi])("pr"_2(phi_("polar")(z_2)))
        )]_(~)
      )
      \
      &=
      phi_("cartesian")
      (
        [(
          sqrt("pr"_1([(r_1, theta_1)]_(~)))^(RR_(>=0)), 
          1/2 dot.op s_((-pi, pi])("pr"_2([(r_1, theta_1)]_(~)))
        )]_(~)
      )
      phi_("cartesian")
      (
        [(
          sqrt("pr"_1([(r_2, theta_2)]_(~)))^(RR_(>=0)), 
          1/2 dot.op s_((-pi, pi])("pr"_2([(r_2, theta_2)]_(~)))
        )]_(~)
      )
      \
      &=
      phi_("cartesian")
      (
        [(
          sqrt(r_1)^(RR_(>=0)), 
          1/2 dot.op s_((-pi, pi])([theta_1]_(~_(angle)))
        )]_(~)
      )
      phi_("cartesian")
      (
        [(
          sqrt(r_2)^(RR_(>=0)), 
          1/2 dot.op s_((-pi, pi])([theta_2]_(~_(angle)))
        )]_(~)
      )
      \
      &=
      (
        sqrt(r_1)^(RR_(>=0)) cos(1/2 dot.op s_((-pi, pi])([theta_1]_(~_(angle)))),
        sqrt(r_1)^(RR_(>=0)) sin(1/2 dot.op s_((-pi, pi])([theta_1]_(~_(angle))))
      )
      (
        sqrt(r_2)^(RR_(>=0)) cos(1/2 dot.op s_((-pi, pi])([theta_2]_(~_(angle)))),
        sqrt(r_2)^(RR_(>=0)) sin(1/2 dot.op s_((-pi, pi])([theta_2]_(~_(angle))))
      )
      \
      &=
      //   CC := RR^2 に "掛け算" (a, b) dot.op (c, d) := (a c - b d, a d + b c) "を入れたもの"–
      (
        sqrt(r_1)^(RR_(>=0)) cos(1/2 dot.op s_((-pi, pi])([theta_1]_(~_(angle))))
          sqrt(r_2)^(RR_(>=0)) cos(1/2 dot.op s_((-pi, pi])([theta_2]_(~_(angle))))
        -
        sqrt(r_1)^(RR_(>=0)) sin(1/2 dot.op s_((-pi, pi])([theta_1]_(~_(angle))))
          sqrt(r_2)^(RR_(>=0)) sin(1/2 dot.op s_((-pi, pi])([theta_2]_(~_(angle)))),
        \
        &quad quad sqrt(r_1)^(RR_(>=0)) cos(1/2 dot.op s_((-pi, pi])([theta_1]_(~_(angle))))
          sqrt(r_2)^(RR_(>=0)) sin(1/2 dot.op s_((-pi, pi])([theta_2]_(~_(angle))))
        +
        sqrt(r_1)^(RR_(>=0)) sin(1/2 dot.op s_((-pi, pi])([theta_1]_(~_(angle))))
          sqrt(r_2)^(RR_(>=0)) cos(1/2 dot.op s_((-pi, pi])([theta_2]_(~_(angle))))
      )
      \
      &=
      (
        sqrt(r_1)^(RR_(>=0)) sqrt(r_2)^(RR_(>=0))
        (
          cos(1/2 dot.op s_((-pi, pi])([theta_1]_(~_(angle))))
          cos(1/2 dot.op s_((-pi, pi])([theta_2]_(~_(angle))))
          -
          sin(1/2 dot.op s_((-pi, pi])([theta_1]_(~_(angle))))
          sin(1/2 dot.op s_((-pi, pi])([theta_2]_(~_(angle))))
        ),
        \
        &quad quad sqrt(r_1)^(RR_(>=0)) sqrt(r_2)^(RR_(>=0))
        (
          cos(1/2 dot.op s_((-pi, pi])([theta_1]_(~_(angle))))
          sin(1/2 dot.op s_((-pi, pi])([theta_2]_(~_(angle))))
          +
          sin(1/2 dot.op s_((-pi, pi])([theta_1]_(~_(angle))))
          cos(1/2 dot.op s_((-pi, pi])([theta_2]_(~_(angle))))
        )
      )
      \
      &=
      (
        sqrt(r_1)^(RR_(>=0)) sqrt(r_2)^(RR_(>=0))
        (
          cos(1/2 dot.op s_((-pi, pi])([theta_1]_(~_(angle))) + 1/2 dot.op s_((-pi, pi])([theta_2]_(~_(angle))))
        ),
        \
        &quad quad sqrt(r_1)^(RR_(>=0)) sqrt(r_2)^(RR_(>=0))
        (
          cos(1/2 dot.op s_((-pi, pi])([theta_1]_(~_(angle))) + 1/2 dot.op s_((-pi, pi])([theta_2]_(~_(angle))))
        )
      )
      \
      &=
      (
        sqrt(r_1 r_2)^(RR_(>=0))
        cos(1/2 dot.op (s_((-pi, pi])([theta_1]_(~_(angle))) + s_((-pi, pi])([theta_2]_(~_(angle)))))
        ,
        sqrt(r_1 r_2)^(RR_(>=0))
        sin(1/2 dot.op (s_((-pi, pi])([theta_1]_(~_(angle))) + s_((-pi, pi])([theta_2]_(~_(angle)))))
      )
    $

    i. $r_1 = 0 or r_2 = 0$ のとき、

    $sqrt(r_1 r_2)^(RR_(>=0)) = 0$ より、
    
    $
      sqrt(z_1 z_2) = sqrt(z_1) sqrt(z_2)
    $

    ii. $r_1 eq.not 0 and r_2 eq.not 0$ のとき、

    $m_1, m_2 in ZZ$ で、

    $
      -pi < theta_1 - 2m_1 pi <= pi
    $
    $
      -pi < theta_2 - 2m_2 pi <= pi
    $

    を満たすようなものがそれぞれただ一つ存在する。

    このとき、

    $
      cos(1/2 dot.op (s_((-pi, pi])([theta_1]_(~_(angle))) + s_((-pi, pi])([theta_2]_(~_(angle)))))
      &=
      cos(1/2 dot.op (theta_1 - 2m_1 pi + theta_2 - 2m_2 pi))
      \
      &=
      cos((theta_1 + theta_2)/2 - (m_1 + m_2) pi)
      \
      &=
      cases(
        cos((theta_1 + theta_2)/2) & quad (m_1 + m_2"は偶数"),
        -cos((theta_1 + theta_2)/2) & quad (m_1 + m_2"は奇数")
      )
    $

    同様に

    $
      sin(1/2 dot.op (s_((-pi, pi])([theta_1]_(~_(angle))) + s_((-pi, pi])([theta_2]_(~_(angle)))))
      &=
      sin(1/2 dot.op (theta_1 - 2m_1 pi + theta_2 - 2m_2 pi))
      \
      &=
      sin((theta_1 + theta_2)/2 - (m_1 + m_2) pi)
      \
      &=
      cases(
        sin((theta_1 + theta_2)/2) & quad (m_1 + m_2"は偶数"),
        -sin((theta_1 + theta_2)/2) & quad (m_1 + m_2"は奇数")
      )
    $

    また、

    $
      -2pi < theta_1 + theta_2 - 2(m_1 + m_2) pi <= 2pi
    $

    であるから、

    
    ii.a $-2pi < theta_1 + theta_2 - 2(m_1 + m_2) pi <= -pi$ のとき、

    $
      0 < theta_1 + theta_2 - (2m_1 + 2m_2 - 2) pi <= pi
      \
      0 < theta_1 + theta_2 - 2(m_1 + m_2 - 1) pi <= pi
    $

    より、

    $
      cos(1/2 dot.op s_((-pi, pi])([theta_1 + theta_2]_(~_(angle))))
      &=
      cos(1/2 dot.op (theta_1 + theta_2 - 2(m_1 + m_2 - 1) pi))
      \
      &=
      cos((theta_1 + theta_2)/2 - (m_1 + m_2 - 1) pi)
      \
      &=
      cases(
        cos((theta_1 + theta_2)/2) & quad (m_1 + m_2 - 1"は偶数"),
        -cos((theta_1 + theta_2)/2) & quad (m_1 + m_2 - 1"は奇数")
      )
      \
      &=
      cases(
        -cos((theta_1 + theta_2)/2) & quad (m_1 + m_2"は偶数"),
        cos((theta_1 + theta_2)/2) & quad (m_1 + m_2"は奇数")
      )
    $

    同様に

    $
      sin(1/2 dot.op s_((-pi, pi])([theta_1 + theta_2]_(~_(angle))))
      &=
      sin(1/2 (theta_1 + theta_2 - 2(m_1 + m_2 - 1) pi))
      \
      &=
      sin((theta_1 + theta_2)/2 - (m_1 + m_2 - 1) pi)
      \
      &=
      cases(
        sin((theta_1 + theta_2)/2) & quad (m_1 + m_2 - 1"は偶数"),
        -sin((theta_1 + theta_2)/2) & quad (m_1 + m_2 - 1"は奇数")
      )
      \
      &=
      cases(
        -sin((theta_1 + theta_2)/2) & quad (m_1 + m_2"は偶数"),
        sin((theta_1 + theta_2)/2) & quad (m_1 + m_2"は奇数")
      )
    $

ii.b $-pi < theta_1 + theta_2 - 2(m_1 + m_2) pi <= pi$ のとき、

    $
      cos(1/2 dot.op s_((-pi, pi])([theta_1 + theta_2]_(~_(angle))))
      &=
      cos(1/2 dot.op (theta_1 + theta_2 - 2(m_1 + m_2) pi))
      \
      &=
      cos((theta_1 + theta_2)/2 - (m_1 + m_2) pi)
      \
      &=
      cases(
        cos((theta_1 + theta_2)/2) & quad (m_1 + m_2"は偶数"),
        -cos((theta_1 + theta_2)/2) & quad (m_1 + m_2"は奇数")
      )
    $

    同様に

    $
      sin(1/2 dot.op s_((-pi, pi])([theta_1 + theta_2]_(~_(angle))))
      &=
      sin(1/2 dot.op (theta_1 + theta_2 - 2(m_1 + m_2) pi))
      \
      &=
      sin((theta_1 + theta_2)/2 - (m_1 + m_2) pi)
      \
      &=
      cases(
        sin((theta_1 + theta_2)/2) & quad (m_1 + m_2"は偶数"),
        -sin((theta_1 + theta_2)/2) & quad (m_1 + m_2"は奇数")
      )
    $

ii.c $pi < theta_1 + theta_2 - 2(m_1 + m_2) pi <= 2pi$ のとき、

    $
      -pi < theta_1 + theta_2 - 2(m_1 + m_2 + 1) pi <= 0
    $

    より、

    $
      cos(1/2 dot.op s_((-pi, pi])([theta_1 + theta_2]_(~_(angle))))
      &=
      cos(1/2 dot.op (theta_1 + theta_2 - 2(m_1 + m_2 + 1) pi))
      \
      &=
      cos((theta_1 + theta_2)/2 - (m_1 + m_2 + 1) pi)
      \
      &=
      cases(
        cos((theta_1 + theta_2)/2) & quad (m_1 + m_2 + 1"は偶数"),
        -cos((theta_1 + theta_2)/2) & quad (m_1 + m_2 + 1"は奇数")
      )
      \
      &=
      cases(
        -cos((theta_1 + theta_2)/2) & quad (m_1 + m_2"は偶数"),
        cos((theta_1 + theta_2)/2) & quad (m_1 + m_2"は奇数")
      )
    $

    同様に
  
    $
      sin(1/2 dot.op s_((-pi, pi])([theta_1 + theta_2]_(~_(angle))))
      &=
      sin(1/2 dot.op (theta_1 + theta_2 - 2(m_1 + m_2 + 1) pi))
      \
      &=
      sin((theta_1 + theta_2)/2 - (m_1 + m_2 + 1) pi)
      \
      &=
      cases(
        sin((theta_1 + theta_2)/2) & quad (m_1 + m_2 + 1"は偶数"),
        -sin((theta_1 + theta_2)/2) & quad (m_1 + m_2 + 1"は奇数")
      )
      \
      &=
      cases(
        -sin((theta_1 + theta_2)/2) & quad (m_1 + m_2"は偶数"),
        sin((theta_1 + theta_2)/2) & quad (m_1 + m_2"は奇数")
      )
    $

    よって、

    $
      sqrt(z_1 z_2)
      &=
      cases(
        -sqrt(z_1) sqrt(z_2) & quad (exists m in ZZ "s.t." -2pi < theta_1 + theta_2 - 2m pi <= -pi),
        sqrt(z_1) sqrt(z_2) & quad ((r_1 = 0 or r_2 = 0) or exists m in ZZ "s.t." -pi < theta_1 + theta_2 - 2m pi <= pi),
        -sqrt(z_1) sqrt(z_2) & quad (exists m in ZZ "s.t." pi < theta_1 + theta_2 - 2m pi <= 2pi),
      )
    $

    $qed$
  ]
]<condition_of_commutativity_of_sqrt_and_product>

#remark()[
  $z_1, z_2 in CC$について、

  $
    sqrt(z_1 z_2) = cases(
      -sqrt(z_1) sqrt(z_2) &quad (-2pi < arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) <= -pi),
      sqrt(z_1) sqrt(z_2) &quad (-pi < arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) <= pi),
      -sqrt(z_1) sqrt(z_2) &quad (pi < arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) <= 2pi),
    ) 
  $
]

#claim([sqrt の2乗は元に戻る])[
  $z in CC$ について、

  $
    sqrt(z) sqrt(z) = z
  $

  #proof[
    $z in CC$ について、

    $r in RR_(>=0), theta in RR$ を用いて

    $phi_("polar")(z) = [(r, theta)]_(~)$ とする。

    また、$n in ZZ$ を用いて、

    $-pi < theta - 2n pi <= pi (<=> (2n - 1)pi < theta <= (2n + 1)pi)$ とする。

    このとき、

    $
      sqrt(z)
      &=
      phi_("cartesian")
      (
        [(
          sqrt(r)^(RR_(>=0)), 
          theta/2 - n pi
        )]_(~)
      )
    $

    よって、

    $
      sqrt(z) sqrt(z)
      &=
      phi_("cartesian")
      (
        [(
          sqrt(r)^(RR_(>=0)), 
          theta/2 - n pi
        )]_(~)
      )
      phi_("cartesian")
      (
        [(
          sqrt(r)^(RR_(>=0)), 
          theta/2 - n pi
        )]_(~)
      )
      \
      &=
      phi_("cartesian")
      (
        [(
          sqrt(r)^(RR_(>=0)), 
          theta/2 - n pi
        )]_(~)
        dot.op
        [(
          sqrt(r)^(RR_(>=0)), 
          theta/2 - n pi
        )]_(~)
      )
      quad
      (
        because phi_("cartesian")"の同型性"
      )
      \
      &=
      phi_("cartesian")
      (
        [(
          sqrt(r)^(RR_(>=0)) dot.op sqrt(r)^(RR_(>=0)), 
          theta/2 - n pi + theta/2 - n pi
        )]_(~)
      )
      \
      &=
      phi_("cartesian")
      (
        [(
          r,
          theta - 2n pi 
        )]_(~)
      )
      quad
      (
        because sqrt(r)^(RR_(>=0)) "の定義" #ref(<definition_of_sqrt_r_positive>) "より"
      )
      \
      &=
      phi_("cartesian")
      (
        [(
          r,
          theta
        )]_(~)
      )
      quad
      (
        because (r, theta - 2n pi) ~ (r, theta)
      )
      \
      &=
      phi_("cartesian")
      (
        phi_("polar")(z)
      )
      \
      &=
      z
    $

    $qed$
  ]
]  


#claim([自乗の$sqrt(dot)$])[
  $z in CC$について、
  $
    z
    &= 
    cases(
      -sqrt(z^2) &quad (-pi < arg^((-pi, pi])(z) <= -pi/2),
      sqrt(z^2) &quad (-pi/2 < arg^((-pi, pi])(z) <= pi/2),
      -sqrt(z^2) &quad (pi/2 < arg^((-pi, pi])(z) <= pi),
    )
  $

  #proof[
    $z in CC$ について、

    $r in RR_(>=0), theta in RR$ を用いて

    $phi_("polar")(z) = [(r, theta)]_(~)$ とする。

    また、$n in ZZ$ を用いて、

    $-pi < theta - 2n pi <= pi (<=> (2n - 1)pi < theta <= (2n + 1)pi)$ とする。

    このとき、$#ref(<condition_of_commutativity_of_sqrt_and_product>)$より、

    $
      sqrt(z) sqrt(z)
      &= 
      cases(
        -sqrt(z^2) &quad (-2pi < arg^((-pi, pi])(z) + arg^((-pi, pi])(z) <= -pi),
        sqrt(z^2) &quad (-pi < arg^((-pi, pi])(z) + arg^((-pi, pi])(z) <= pi),
        -sqrt(z^2) &quad (pi < arg^((-pi, pi])(z) + arg^((-pi, pi])(z) <= 2pi),
      )
      \
      &= 
      cases(
        -sqrt(z^2) &quad (-2pi < 2 arg^((-pi, pi])(z) <= -pi),
        sqrt(z^2) &quad (-pi < 2 arg^((-pi, pi])(z) <= pi),
        -sqrt(z^2) &quad (pi < 2 arg^((-pi, pi])(z) <= 2pi),
      )
      \
      &= 
      cases(
        -sqrt(z^2) &quad (-pi < arg^((-pi, pi])(z) <= -pi/2),
        sqrt(z^2) &quad (-pi/2 < arg^((-pi, pi])(z) <= pi/2),
        -sqrt(z^2) &quad (pi/2 < arg^((-pi, pi])(z) <= pi),
      )
    $
  ]

  $sqrt(z) sqrt(z) = z$ より、$qed$
]

#remark[
  $z in CC$について、$Re(z) < 0, Im(z) = 0$ のとき、

  (すなわち、$z in RR_(<0)$とみなせるとき)

  $arg^((-pi, pi])(z) = pi$ であるから、

  $
    z = -sqrt(z^2)
  $
]

#claim([$CC$の逆数の$sqrt(dot)$])[
  $z in CC, z eq.not 0$について、

  $r in RR_(>0), theta in RR$を用いて、

  $phi_("polar")(z) = [(r, theta)]_(~)$
  
  $n in ZZ$ を用いて、

  $-pi < theta - 2n pi <= pi$
  
  となるとき、

  $
    sqrt(1/z) = cases(
      1/sqrt(z) & quad (-pi < theta - 2n pi < pi),
      -(1/sqrt(z)) & quad (theta - 2n pi = pi),
    )
  $

  #proof[

    $z in CC, z eq.not 0$について、

    $r in RR_(>0), theta in RR$を用いて、

    $phi_("polar")(z) = [(r, theta)]_(~)$ とする。

    また、$n in ZZ$ を用いて、

    $-pi < theta - 2n pi <= pi$ とする。

    このとき、

    $
      arg^((-pi, pi])(z) = theta - 2n pi
    $

    また、

    $
      phi_("polar")(1 / z)
      &=
      phi_("polar")(z^(-1))
      \
      &=
      ([(r, theta)]_(~))^(-1) quad (because phi_("polar")"の同型性")
      \
      &=
      [(1/r, -theta)]_(~)
    $

    より、

    $
      arg^((-pi, pi])(1 / z)
      &=
      s_((-pi, pi])("pr"_2(phi_("polar")(1 / z)))
      \
      &=
      s_((-pi, pi])([-theta]_(~_(angle)))
      \
      &=
      cases(
        -theta - 2(-n)pi &quad (-pi < theta - 2n pi < pi), 
        pi &quad (theta - 2n pi = pi),
      )
      quad
      (
        because -pi < theta - 2n pi <= pi <=> -pi <= -theta - 2(-n) pi < pi
      )
    $

    だから、

    $
      arg^((-pi, pi])(z) + arg^((-pi, pi])(1 / z)
      &=
      cases(
        theta - 2n pi + (-theta - 2(-n)pi) &quad (-pi < theta - 2n pi < pi), 
        theta - 2n pi + pi &quad (theta - 2n pi = pi),
      )
      \
      &=
      cases(
        - 2n pi + (2n pi) &quad (-pi < theta - 2n pi < pi), 
        pi + pi &quad (theta - 2n pi = pi),
      )
      \
      &=
      cases(
        0 &quad (-pi < theta - 2n pi < pi), 
        2pi &quad (theta - 2n pi = pi <=> theta = (2n + 1) pi),
      )
    $

    $
      sqrt(z) dot.op sqrt(1 / z)
      &=
      cases(
        sqrt(z dot.op 1/z) & quad (-pi < theta - 2n pi < pi),
        -sqrt(z dot.op 1/z) & quad (theta = (2n + 1) pi),
      )
      \
      &=
      cases(
        sqrt(1) & quad (-pi < theta - 2n pi < pi),
        -sqrt(1) & quad (theta = (2n + 1) pi),
      )
      \
      &=
      cases(
        1 & quad (-pi < theta - 2n pi < pi),
        -1 & quad (theta = (2n + 1) pi),
      )
    $

    以上から

    $
      sqrt(1/z) = cases(
        1/sqrt(z) & quad (-pi < theta - 2n pi < pi),
        -(1/sqrt(z)) & quad (theta = (2n + 1) pi),
      )
    $
  ]
]<inverse_of_sqrt_cc>

#remark[
  
  $z in CC^(times)$ について、

  $
    sqrt(1/z) = cases(
        1/sqrt(z) & quad (-pi < arg^( (-pi, pi])(z) < pi <=> z in.not RR_(<0)),
        -(1/sqrt(z)) & quad (arg^( (-pi, pi])(z) = pi <=> z in RR_(<0)),

    )
  $
]



== 2次元ising模型の分配関数
#definition("格子サイズ")[
  $M, N in NN$を格子のサイズとする。
]
#definition("2次元ising模型の分配関数")[
  $Z: RR_(>0) times RR_(>0) -> RR_(>0)$を以下のように定める。

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

  $forall (i_1, dots, i_m) in {1, dots, m}^(m)$

  $
    e_{i_1} times.circle dots.c times.circle e_{i_m} "は、" V^(times.circle m)"の基底である"
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

$K_i, K_i^* > 0$ より、 $c_i, s_i, c_i^*, s_i^* > 0$

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
      sqrt(-1) e^(sqrt(-1) theta) s_2^* (c_1 cos theta - i sin theta - s_1 c_2);
      - sqrt(-1) e^(-sqrt(-1) theta) s_2^* (c_1 cos theta + i sin theta - s_1 c_2),
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
    &=
    (
      hat(Z)_mu^((minus)),
      hat(Y)_mu
    )
    dot.op
    A((2 pi mu) / M)
    \
    &=
    mat(
      (
        c_1 c_2^*
        -
        s_1 s_2^* cos ((2 pi mu) / M)
      )
      hat(Z)_mu^((minus))
      +
      (
        - sqrt(-1) exp(-sqrt(-1) (2 pi mu) / M) s_2^* (c_1 cos ((2 pi mu) / M) + sqrt(-1) sin ((2 pi mu) / M) - s_1 c_2)
      )
      hat(Y)_mu,
      (
        sqrt(-1) exp(sqrt(-1) (2 pi mu) / M) s_2^* (c_1 cos ((2 pi mu) / M) - sqrt(-1) sin ((2 pi mu) / M) - s_1 c_2)
      )
      hat(Z)_mu^((minus))
      +
      (
        c_1 c_2^*
        -
        s_1 s_2^* cos ((2 pi mu) / M)
      )
      hat(Y)_mu
    )
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
]<T_V_hatZ_hatY>

#definition([$A(theta)$の対角化の準備])[
  $
    gamma_1(theta) :&= c_1 c_2^* - s_1 s_2^* cos theta in RR
    \
    gamma_2(theta) :&= sqrt(-1) e^(sqrt(-1) theta) s_2^* (c_1 cos theta - sqrt(-1) sin theta - s_1 c_2) in CC
  $

  と定めると、

  $
    A(theta)
    :&=
    mat(
      c_1 c_2^*
      -
      s_1 s_2^* cos theta,
      sqrt(-1) e^(sqrt(-1) theta) s_2^* (c_1 cos theta - sqrt(-1) sin theta - s_1 c_2);
      - sqrt(-1) e^(-sqrt(-1) theta) s_2^* (c_1 cos theta + sqrt(-1) sin theta - s_1 c_2),
      c_1 c_2^*
      -
      s_1 s_2^* cos theta;
    )
    \
    &=
    mat(
      gamma_1(theta),
      gamma_2(theta);
      - gamma_2(-theta),
      gamma_1(theta);
    )
  $

  とかける。
]

#claim([$gamma_1(theta), gamma_2(theta)$の偏角])[
  $
    arg(gamma_1(theta))
    =
    cases(
      0 & quad (cos(theta) <= (c_1 c_2^*) / (s_1 s_2^*)),
      pi & quad ("otherwise")
    )
  $

  $
    arg(gamma_2(theta))

  $
]

#claim([$gamma_2(theta)$が$0$になる条件])[
  $
    gamma_2(theta)
    =
    0
    & <=>
    cases(
      sin(theta) &= 0,
      c_2 s_1 - c_1 cos(theta) &= 0,
    )
    \
    & <=>
    cases(
      theta &= 0\, plus.minus pi\, plus.minus 2 pi\, dots,
      c_2 s_1 &= c_1 cos(theta),
    )
  $

  #proof[

  ]
]<gamma_2_theta_is_0>

#claim([$gamma_2(theta)$と$gamma_2(-theta)$の関係])[

  $
    gamma_2(-theta) = -overline(gamma_2(theta))
  $

  ゆえに、
  $
    gamma_2(theta) gamma_2(-theta)
    &= 
    gamma_2(theta) (-overline(gamma_2(theta)))
    \
    &=
    - |gamma_2(theta)|^2
  $

  #proof[
    $
      gamma_2(-theta)
      &=
      sqrt(-1) e^(sqrt(-1) (-theta)) s_2^* (c_1 cos (-theta) - sqrt(-1) sin (-theta) - s_1 c_2)
      \
      &=
      sqrt(-1) e^(-sqrt(-1) theta) s_2^* (c_1 cos (theta) + sqrt(-1) sin (theta) - s_1 c_2)
    $

    $
      overline(gamma_2(theta))
      &=
      overline((
        sqrt(-1) e^(sqrt(-1) theta) s_2^* (c_1 cos theta - sqrt(-1) sin theta - s_1 c_2)
      ))
      \
      &=
      (overline(sqrt(-1)))
      (overline(
        e^(sqrt(-1) theta)
      ))
      (overline(
        s_2^*
      ))
      (overline(
        c_1 cos theta - sqrt(-1) sin theta - s_1 c_2
      ))
      \
      &=
      (-sqrt(-1))
      (e^(-sqrt(-1) theta))
      (s_2^*)
      (c_1 cos theta + sqrt(-1) sin theta - s_1 c_2)
      \
      &=
      -
      (
        sqrt(-1) e^(-sqrt(-1) theta) s_2^* (c_1 cos theta + sqrt(-1) sin theta - s_1 c_2)
      )
      \
      &=
      -gamma_2(-theta)
      \
      qed
    $
  ]
]<relation_of_gamma_2>

#definition([$theta_mu$])[
  $cal(M) := {-M, dots, -2, -1, 1, 2, dots, M}$ とする。

  $mu in cal(M)$について、

  $
    theta_(mu) := (2 pi mu) / M
  $
  
  と定める。
]

#claim([$gamma_2(theta_mu), gamma_2(-theta_mu)$の$arg$])[
  
  $mu in cal(M)$ について、

  $
    arg^((-pi, pi])(gamma_2(theta_(mu))) &= ?? \
    arg^((-pi, pi])(gamma_2(-theta_(mu))) &= ??
  $

  #proof[
    $mu in cal(M)$ について、

    $
      gamma_2(theta_(mu))
      &=
      sqrt(-1) e^(sqrt(-1) theta_(mu)) s_2^* (c_1 cos theta_(mu) - sqrt(-1) sin theta_(mu) - s_1 c_2)
      \
      &=
      sqrt(-1)
      s_2^*
      (
        cos theta_(mu) + sqrt(-1) sin theta_(mu)
      )
      (
        c_1 cos theta_(mu) - sqrt(-1) sin theta_(mu) - s_1 c_2
      )
      \
      &=
      sqrt(-1)
      s_2^*
      (
        cos theta_(mu)
        dot.op
        (
          c_1 cos theta_(mu) - sqrt(-1) sin theta_(mu) - s_1 c_2
        )
        +
        sqrt(-1) sin theta_(mu)
        dot.op
        (
          c_1 cos theta_(mu) - sqrt(-1) sin theta_(mu) - s_1 c_2
        )
      )
      \
      &=
      sqrt(-1)
      s_2^*
      (
        cos theta_(mu)
        dot.op
        c_1 cos theta_(mu)
        +
        cos theta_(mu)
        dot.op
        (
          - sqrt(-1) sin theta_(mu)
        )
        +
        cos theta_(mu)
        dot.op
        (
          - s_1 c_2
        )
        +
        sqrt(-1) sin theta_(mu)
        dot.op
        c_1 cos theta_(mu)
        +
        sqrt(-1) sin theta_(mu)
        dot.op
        (
          - sqrt(-1) sin theta_(mu)
        )
        +
        sqrt(-1) sin theta_(mu)
        dot.op
        (
          - s_1 c_2
        )
      )
      \
      &=
      sqrt(-1)
      s_2^*
      (
        c_1
        cos theta_(mu)
        cos theta_(mu)
        +
        sqrt(-1)
        (
          -
          cos theta_(mu)
          sin theta_(mu)
        )
        +
        s_1 c_2
        (
          -
          cos theta_(mu)
        )
        +
        sqrt(-1)
        c_1
        sin theta_(mu)
        cos theta_(mu)
        +
        sqrt(-1) (- sqrt(-1))
        sin theta_(mu)
        sin theta_(mu)
        +
        sqrt(-1)
        (
          -
          s_1 c_2
          sin theta_(mu)
        )
      )
      \
      &=
      sqrt(-1)
      s_2^*
      (
        c_1
        cos theta_(mu)
        cos theta_(mu)
        +
        s_1 c_2
        (
          -
          cos theta_(mu)
        )
        +
        sin theta_(mu)
        sin theta_(mu)
        +
        sqrt(-1)
        (
          -
          cos theta_(mu)
          sin theta_(mu)
        )
        +
        sqrt(-1)
        c_1
        sin theta_(mu)
        cos theta_(mu)
        +
        sqrt(-1)
        (
          -
          s_1 c_2
          sin theta_(mu)
        )
      )
      \
      &=
      sqrt(-1)
      s_2^*
      (
        c_1
        cos theta_(mu)
        cos theta_(mu)
        +
        s_1 c_2
        (
          -
          cos theta_(mu)
        )
        +
        sin theta_(mu)
        sin theta_(mu)
        +
        sqrt(-1)
        (
          -
          cos theta_(mu)
          sin theta_(mu)
          +
          c_1
          sin theta_(mu)
          cos theta_(mu)
          -
          s_1 c_2
          sin theta_(mu)
        )
      )
      \
      &=
      s_2^* sqrt(-1)
      (
        c_1
        cos theta_(mu)
        cos theta_(mu)
        +
        s_1 c_2
        (
          -
          cos theta_(mu)
        )
        +
        sin theta_(mu)
        sin theta_(mu)
      )
      +
      s_2^*
      sqrt(-1) sqrt(-1)
      (
        -
        cos theta_(mu)
        sin theta_(mu)
        +
        c_1
        sin theta_(mu)
        cos theta_(mu)
        -
        s_1 c_2
        sin theta_(mu)
      )
      \
      &=
      s_2^* sqrt(-1)
      (
        c_1
        cos theta_(mu)
        cos theta_(mu)
        +
        s_1 c_2
        (
          -
          cos theta_(mu)
        )
        +
        sin theta_(mu)
        sin theta_(mu)
      )
      -
      s_2^*
      (
        -
        cos theta_(mu)
        sin theta_(mu)
        +
        c_1
        sin theta_(mu)
        cos theta_(mu)
        -
        s_1 c_2
        sin theta_(mu)
      )
    $

    よって、

    $
      Re(gamma_2(theta_(mu)))
      &=
      -
      s_2^*
      (
        -
        cos theta_(mu)
        sin theta_(mu)
        +
        c_1
        sin theta_(mu)
        cos theta_(mu)
        -
        s_1 c_2
        sin theta_(mu)
      )
      \
      &=
      s_2^*
      (
        cos theta_(mu)
        sin theta_(mu)
        -
        c_1
        sin theta_(mu)
        cos theta_(mu)
        +
        s_1 c_2
        sin theta_(mu)
      )
    $
  ]
]

#claim([$gamma_2(theta_mu)$$gamma_2(-theta_mu)$])[
  $mu in cal(M)$について、

  $
    arg^((-pi, pi])(gamma_2(theta_(mu)) gamma_2(-theta_(mu))) = pi
  $

  #proof[
    $mu in cal(M)$について、

    $
      gamma_2(theta_(mu)) gamma_2(-theta_(mu))
      &=
      (
        sqrt(-1) e^(sqrt(-1) (theta_mu)) s_2^* (c_1 cos (theta_mu) - sqrt(-1) sin (theta_mu) - s_1 c_2)
      )
      (
        sqrt(-1) e^(sqrt(-1) (-theta_mu)) s_2^* (c_1 cos (-theta_mu) - sqrt(-1) sin (-theta_mu) - s_1 c_2)
      )
      \
      &=
      underbrace(
        (
          sqrt(-1)
          dot.op
          sqrt(-1)
        )
        (
          e^((sqrt(-1) (theta_mu) + sqrt(-1) (-theta_mu)))
        )
        ,
        minus 1
      )
      (
        s_2^* (c_1 cos (theta_mu) - sqrt(-1) sin (theta_mu) - s_1 c_2)
      )
      (
        s_2^* (c_1 cos (theta_mu) + sqrt(-1) sin (theta_mu) - s_1 c_2)
      )
      \
      &=
      underbrace(
        (
          -1
        )
        (
          e^(0)
        )
        ,
        minus 1
      )
      (
        s_2^* (c_1 cos (theta_mu) - sqrt(-1) sin (theta_mu) - s_1 c_2)
      )
      (
        s_2^* (c_1 cos (theta_mu) + sqrt(-1) sin (theta_mu) - s_1 c_2)
      )
      quad (because cos"は偶関数, "sin"は奇関数")
      \
      &=
      -
      (
        s_2^*
      )
      ^2
      (c_1 cos (theta_mu) - sqrt(-1) sin (theta_mu) - s_1 c_2)
      (c_1 cos (theta_mu) + sqrt(-1) sin (theta_mu) - s_1 c_2)
      \
      &=
      -
      (
        s_2^*
      )
      ^2
      (
        (c_1 cos (theta_mu) - s_1 c_2)^2
        +
        (sin (theta_mu))^2
      )
      \
      &=
      -
      (
        s_2^*
      )
      ^2
      (
        (c_1 cos ((2 pi mu)/(M)) - s_1 c_2)^2
        +
        (sin ((2 pi mu)/(M)))^2
      )
      < 0
    $
  ]
]<arg_of_gamma_2_mu>

(次回:20250821-2 ↓ $CC$用の$sqrt(dot)$を使って一行ずつ確かめる)

#claim([$A(theta)$の対角化])[

  $cal(M) := {-M, dots, -2, -1, 1, 2, dots, M}$ とする。

  $mu in cal(M)$について、

  $theta_(mu) := (2 pi mu) / M$ とおくとき、

  $A(theta_(mu))$の固有値$lambda_(mu) in RR$は
  $
    lambda_(mu)
    :=
    (
      gamma_1(theta_(mu))
    )
    plus.minus
    sqrt(
      -
      (
        gamma_2(theta_(mu))
      )
      (
        gamma_2(-theta_(mu))
      )
    )
  $
  
  で、対応する固有ベクトル $v_(mu) in CC^2 without { mat(0; 0) }$は

  1) $gamma_2(theta_mu) = 0$ のとき、
  $
    v_(mu) "は任意のベクトル" in CC^2 without { mat(0; 0) }
  $

  2) $gamma_2(theta_mu) eq.not 0$ のとき、

  $c in CC^(times)$ として、

  $
    v_(mu)
    :=
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
      gamma_2(-theta_(mu))
    )
    in CC^2 without { mat(0; 0) }
  $
  
  である

  #proof[
    $
      A(theta_(mu))
      :&=
      mat(
        c_1 c_2^*
        -
        s_1 s_2^* cos theta_(mu),
        sqrt(-1) e^(sqrt(-1) theta_(mu)) s_2^* (c_1 cos theta_(mu) - sqrt(-1) sin theta_(mu) - s_1 c_2);
        - sqrt(-1) e^(-sqrt(-1) theta_(mu)) s_2^* (c_1 cos theta_(mu) + sqrt(-1) sin theta_(mu) - s_1 c_2),
        c_1 c_2^*
        -
        s_1 s_2^* cos theta_(mu);
      )   
    $

    $gamma_1(theta_(mu)) := c_1 c_2^* - s_1 s_2^* cos theta_(mu)$
    
    $gamma_2(theta_(mu)) := sqrt(-1) e^(sqrt(-1) theta_(mu)) s_2^* (c_1 cos theta_(mu) - i sin theta_(mu) - s_1 c_2)$

    とおくと、

    $
      A(theta_(mu))
      =
      mat(
        gamma_1(theta_(mu)),
        gamma_2(theta_(mu));
        - gamma_2(-theta_(mu)),
        gamma_1(theta_(mu));
      )
    $

    とかける。
    
    であるから、$A(theta_(mu))$の固有方程式は$lambda in CC$として、

    $
      abs(A(theta_(mu)) - lambda I) &= 0
    $

    $
      "(左辺)"
      &=
      mat(
        delim: "|",
        gamma_1(theta_(mu)) - lambda,
        gamma_2(theta_(mu));
        - gamma_2(-theta_(mu)),
        gamma_1(theta_(mu)) - lambda;
      )
      \
      &=
      (
        gamma_1(theta_(mu)) - lambda
      )
      (
        gamma_1(theta_(mu)) - lambda
      )
      -
      (
        gamma_2(theta_(mu))
      )
      (
        -gamma_2(-theta_(mu))
      )
      \
      &=
      (
        gamma_1(theta_(mu))
      )^2
      -
      2
      lambda
      (
        gamma_1(theta_(mu))
      )
      +
      lambda^2
      +
      (
        gamma_2(theta_(mu))
      )
      (
        gamma_2(-theta_(mu))
      )
    $

    $
      lambda^2
      -
      2
      lambda
      (
        gamma_1(theta_(mu))
      )
      +
      (
        gamma_1(theta_(mu))
      )^2
      +
      (
        gamma_2(theta_(mu))
      )
      (
        gamma_2(-theta_(mu))
      )
      =
      0
    $

    より、

    $
      lambda
      &=
      (
        2
        (
          gamma_1(theta_(mu))
        )
        plus.minus
        sqrt(
          (
            -
            2
            (
              gamma_1(theta_(mu))
            )
          )^2
          -
          4
          (
            (
              gamma_1(theta_(mu))
            )^2
            +
            (
              gamma_2(theta_(mu))
            )
            (
              gamma_2(-theta_(mu))
            )
          )
        )
      )
      /
      2
      \
      &=
      (
        2
        (
          gamma_1(theta_(mu))
        )
        plus.minus
        sqrt(
          4
          (
            (
              gamma_1(theta_(mu))
            )
          )^2
          -
          4
          (
            (
              gamma_1(theta_(mu))
            )^2
            +
            (
              gamma_2(theta_(mu))
            )
            (
              gamma_2(-theta_(mu))
            )
          )
        )
      )
      /
      2
      \
      &=
      (
        2
        (
          gamma_1(theta_(mu))
        )
        plus.minus
        2
        sqrt(
          (
            (
              gamma_1(theta_(mu))
            )
          )^2
          -
          (
            (
              gamma_1(theta_(mu))
            )^2
            +
            (
              gamma_2(theta_(mu))
            )
            (
              gamma_2(-theta_(mu))
            )
          )
        )
      )
      /
      2
      \
      &=
      (
        gamma_1(theta_(mu))
      )
      plus.minus
      sqrt(
        -
        (
          gamma_2(theta_(mu))
        )
        (
          gamma_2(-theta_(mu))
        )
      )
    $

    対応する固有ベクトルは、$v := mat(v_1; v_2) in CC^2$ として

    $
      A(theta_(mu)) v &= lambda v
      \
      mat(
        gamma_1(theta_(mu)),
        gamma_2(theta_(mu));
        - gamma_2(-theta_(mu)),
        gamma_1(theta_(mu));
      )
      v
      &=
      lambda
      v
      \
      mat(
        gamma_1(theta_(mu)),
        gamma_2(theta_(mu));
        - gamma_2(-theta_(mu)),
        gamma_1(theta_(mu));
      )
      v
      &=
      (
        (
          gamma_1(theta_(mu))
        )
        plus.minus
        sqrt(
          -
          (
            gamma_2(theta_(mu))
          )
          (
            gamma_2(-theta_(mu))
          )
        )
      )
      v
      \
      mat(
        gamma_1(theta_(mu)),
        gamma_2(theta_(mu));
        - gamma_2(-theta_(mu)),
        gamma_1(theta_(mu));
      )
      mat(v_1; v_2)
      &=
      (
        (
          gamma_1(theta_(mu))
        )
        plus.minus
        sqrt(
          -
          (
            gamma_2(theta_(mu))
          )
          (
            gamma_2(-theta_(mu))
          )
        )
      )
      mat(v_1; v_2)
      \
      I
      dot.c
      mat(
        gamma_1(theta_(mu)),
        gamma_2(theta_(mu));
        - gamma_2(-theta_(mu)),
        gamma_1(theta_(mu));
      )
      mat(v_1; v_2)
      &=
      I
      dot.c
      (
        (
          gamma_1(theta_(mu))
        )
        plus.minus
        sqrt(
          -
          (
            gamma_2(theta_(mu))
          )
          (
            gamma_2(-theta_(mu))
          )
        )
      )
      mat(v_1; v_2)
      \
      mat(
        gamma_1(theta_(mu)),
        gamma_2(theta_(mu));
        - gamma_2(-theta_(mu)),
        gamma_1(theta_(mu));
      )
      mat(v_1; v_2)
      &=
      mat(
        (
          gamma_1(theta_(mu))
        )
        plus.minus
        sqrt(
          -
          (
            gamma_2(theta_(mu))
          )
          (
            gamma_2(-theta_(mu))
          )
        ),
        0;
        0,
        (
          gamma_1(theta_(mu))
        )
        plus.minus
        sqrt(
          -
          (
            gamma_2(theta_(mu))
          )
          (
            gamma_2(-theta_(mu))
          )
        )
      )
      mat(v_1; v_2)
      \
      mat(
        gamma_1(theta_(mu))
        -
        (
          (
            gamma_1(theta_(mu))
          )
          plus.minus
          sqrt(
            -
            (
              gamma_2(theta_(mu))
            )
            (
              gamma_2(-theta_(mu))
            )
          )
        ),
        gamma_2(theta_(mu));
        - gamma_2(-theta_(mu)),
        gamma_1(theta_(mu))
        -
        (
          (
            gamma_1(theta_(mu))
          )
          plus.minus
          sqrt(
            -
            (
              gamma_2(theta_(mu))
            )
            (
              gamma_2(-theta_(mu))
            )
          )
        );
      )
      mat(v_1; v_2)
      &=
      0
      \
      mat(
        minus.plus
        sqrt(
          -
          (
            gamma_2(theta_(mu))
          )
          (
            gamma_2(-theta_(mu))
          )
        ),
        gamma_2(theta_(mu));
        - gamma_2(-theta_(mu)),
        minus.plus
        sqrt(
          -
          (
            gamma_2(theta_(mu))
          )
          (
            gamma_2(-theta_(mu))
          )
        );
      )
      mat(v_1; v_2)
      &=
      0
      quad
      dots.c
      (*)
    $

    1) $gamma_2(theta_mu) = 0$ のとき、

    // このような場合が起きるK_1,K_2の組み合わせがありうるかを検討する
    // (追記)どうやら$gamma_2(theta_mu)=0$の時は常に$gamma_1(theta_mu)=1$になるっぽい↓ので、この分岐は不要そう
    // ############################################
    // # 1. 変数と「K₂ の制約」を設定
    // ############################################
    // K1 = var('K1')                        # K₁ はシンボル
    // K2 = 1/2 * acosh(coth(2*K1))          # K₂ = ½ acosh(coth(2K₁))

    // ############################################
    // # 2. 双対結合 ( * は単なる添字 )
    // ############################################
    // K1_star = -1/2 * log(tanh(K1))
    // K2_star = -1/2 * log(tanh(K2))

    // ############################################
    // # 3. c_i, s_i と c_i★, s_i★
    // ############################################
    // c1, s1       = cosh(2*K1), sinh(2*K1)
    // c2_star      = cosh(2*K2_star)
    // s2_star      = sinh(2*K2_star)

    // ############################################
    // # 4. θ_μ と目的の式
    // #    条件 μ = M ⇒ θ_μ = 2π, したがって cos θ_μ = 1
    // ############################################
    // expr = (c1*c2_star - s1*s2_star)      # cos(2*pi) = 1 を直接代入

    // ############################################
    // # 5. 簡約・表示
    // ############################################
    // expr_simplified = expr.simplify_full()   # 結果は 1 になる
    // show(expr_simplified)

    // ############################################
    // # 6. 数値テスト（任意の K₁ で 1 になるか確認）
    // ############################################
    // for k in (0.2, 0.7, 1.3, 100):
    // print("K1 =", k, "→", expr_simplified.subs(K1=k).n())

    $(*)$は、

    $
      mat(
        0, 0;
        0, 0;
      )
      mat(v_1; v_2)
      &=
      0
    $

    より、$v$は任意の値をとる

    (この時 $A(theta_mu)$は単位行列になっている　TODO: 証明)

    2) $gamma_2(theta_mu) eq.not 0$ のとき、

    $sqrt(
      -
      (
        gamma_2(theta_(mu))
      )
      (
        gamma_2(-theta_(mu))
      )
    ) eq.not 0$
    だから、
    $(*)$は、
    $
      mat(
        minus.plus
        sqrt(
          -
          (
            gamma_2(theta_(mu))
          )
          (
            gamma_2(-theta_(mu))
          )
        )
        (
          (gamma_2(-theta_(mu)))
          /
          (
            minus.plus
            sqrt(
              -
              (
                gamma_2(theta_(mu))
              )
              (
                gamma_2(-theta_(mu))
              )
            )
          )
        ),
        gamma_2(theta_(mu))
        (
          (gamma_2(-theta_(mu)))
          /
          (
            minus.plus
            sqrt(
              -
              (
                gamma_2(theta_(mu))
              )
              (
                gamma_2(-theta_(mu))
              )
            )
          )
        )
        ;
        - gamma_2(-theta_(mu)),
        minus.plus
        sqrt(
          -
          (
            gamma_2(theta_(mu))
          )
          (
            gamma_2(-theta_(mu))
          )
        );
      )
      mat(v_1; v_2)
      &=
      0
      quad
      (because "行列の基本変形")
      \
      mat(
        gamma_2(-theta_(mu)),
        (
          (
            (gamma_2(theta_(mu)))
            (gamma_2(-theta_(mu)))
          )
          /
          (
            minus.plus
            sqrt(
              -
              (
                gamma_2(theta_(mu))
              )
              (
                gamma_2(-theta_(mu))
              )
            )
          )
        )
        ;
        - gamma_2(-theta_(mu)),
        minus.plus
        sqrt(
          -
          (
            gamma_2(theta_(mu))
          )
          (
            gamma_2(-theta_(mu))
          )
        );
      )
      mat(v_1; v_2)
      &=
      0
      \
      mat(
        gamma_2(-theta_(mu)),
        (
          (
            sqrt(
              (
                gamma_2(theta_(mu))
                gamma_2(-theta_(mu))
              )
            )
            sqrt(
              (
                gamma_2(theta_(mu))
                gamma_2(-theta_(mu))
              )
            )
          )
          /
          (
            minus.plus
            sqrt(
              -1_(CC)
              dot.op
              (
                gamma_2(theta_(mu))
              )
              (
                gamma_2(-theta_(mu))
              )
            )
          )
        )
        ;
        - gamma_2(-theta_(mu)),
        minus.plus
        sqrt(
          -1_(CC)
          dot.op
          (
            gamma_2(theta_(mu))
          )
          (
            gamma_2(-theta_(mu))
          )
        );
      )
      mat(v_1; v_2)
      &=
      0
      \
      mat(
        gamma_2(-theta_(mu)),
        (
          (
            sqrt(
              (
                gamma_2(theta_(mu))
                gamma_2(-theta_(mu))
              )
            )
            sqrt(
              (
                gamma_2(theta_(mu))
                gamma_2(-theta_(mu))
              )
            )
          )
          /
          (
            minus.plus
            (
              -
              sqrt(
                -1_(CC)
              )
              sqrt(
                (
                  gamma_2(theta_(mu))
                )
                (
                  gamma_2(-theta_(mu))
                )
              )
            )
          )
        )
        ;
        - gamma_2(-theta_(mu)),
        minus.plus
        (
          -
          sqrt(
            -1_(CC)
          )
          sqrt(
            (
              gamma_2(theta_(mu))
            )
            (
              gamma_2(-theta_(mu))
            )
          )
        );
      )
      mat(v_1; v_2)
      &=
      0
      quad
      (
        because
        arg^((-pi, pi])(-1)_(CC)
        +
        arg^((-pi, pi])((
          gamma_2(theta_(mu))
        )
        (
          gamma_2(-theta_(mu))
        ))
        =
        2pi
        "かつ"
        #ref(<condition_of_commutativity_of_sqrt_and_product>)
      )
      \
      mat(
        gamma_2(-theta_(mu)),
        (
          (
            sqrt(
              (
                gamma_2(theta_(mu))
                gamma_2(-theta_(mu))
              )
            )
            sqrt(
              (
                gamma_2(theta_(mu))
                gamma_2(-theta_(mu))
              )
            )
          )
          /
          (
            plus.minus
            sqrt(
              -1_(CC)
            )
            sqrt(
              (
                gamma_2(theta_(mu))
              )
              (
                gamma_2(-theta_(mu))
              )
            )
          )
        )
        ;
        - gamma_2(-theta_(mu)),
        plus.minus
        sqrt(
          -1_(CC)
        )
        sqrt(
          (
            gamma_2(theta_(mu))
          )
          (
            gamma_2(-theta_(mu))
          )
        );
      )
      mat(v_1; v_2)
      &=
      0
      \
      mat(
        gamma_2(-theta_(mu)),
        (
          (
            sqrt(
              (
                gamma_2(theta_(mu))
                gamma_2(-theta_(mu))
              )
            )
          )
          /
                    (
            plus.minus
            sqrt(
              -1_(CC)
            )
          )
        )
        ;
        - gamma_2(-theta_(mu)),
        plus.minus
        sqrt(
          -1_(CC)
        )
        sqrt(
          (
            gamma_2(theta_(mu))
          )
          (
            gamma_2(-theta_(mu))
          )
        );
      )
      mat(v_1; v_2)
      &=
      0
      quad
      (
        because "約分"
      )
      \
      mat(
        gamma_2(-theta_(mu)),
        plus.minus
        (
          (
            sqrt(
              (
                gamma_2(theta_(mu))
                gamma_2(-theta_(mu))
              )
            )
          )
          (
            (
              1_(CC)
            )
            /
            (
              sqrt(
                -1_(CC)
              )
            )
          )
        )
        ;
        - gamma_2(-theta_(mu)),
        plus.minus
        sqrt(
          -1_(CC)
        )
        sqrt(
          (
            gamma_2(theta_(mu))
          )
          (
            gamma_2(-theta_(mu))
          )
        );
      )
      mat(v_1; v_2)
      &=
      0
      \
      mat(
        gamma_2(-theta_(mu)),
        plus.minus
        (
          (
            sqrt(
              (
                gamma_2(theta_(mu))
                gamma_2(-theta_(mu))
              )
            )
          )
          (
            -
            sqrt(
              1_(CC)
              /
              (
                -1_(CC)
              )
            )
          )
        )
        ;
        - gamma_2(-theta_(mu)),
        plus.minus
        sqrt(
          -1_(CC)
        )
        sqrt(
          (
            gamma_2(theta_(mu))
          )
          (
            gamma_2(-theta_(mu))
          )
        );
      )
      mat(v_1; v_2)
      &=
      0
      quad
      (
        because #ref(<inverse_of_sqrt_cc>) "かつ" arg^((-pi, pi])(-1_(CC)) = pi
      )
      \
      mat(
        gamma_2(-theta_(mu)),
        minus.plus
        (
          (
            sqrt(
              (
                gamma_2(theta_(mu))
                gamma_2(-theta_(mu))
              )
            )
          )
          (
            sqrt(
              - 1_(CC)
            )
          )
        )
        ;
        - gamma_2(-theta_(mu)),
        plus.minus
        sqrt(
          -1_(CC)
        )
        sqrt(
          (
            gamma_2(theta_(mu))
          )
          (
            gamma_2(-theta_(mu))
          )
        );
      )
      mat(v_1; v_2)
      &=
      0
      \
      mat(
        gamma_2(-theta_(mu)),
        minus.plus
        sqrt(
          - 1
        )
        sqrt(
          (
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        )
        ;
        - gamma_2(-theta_(mu)),
        plus.minus
        sqrt(
          - 1
        )
        sqrt(
          (
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        );
      )
      mat(v_1; v_2)
      &=
      0
    $

    よって、$c in CC^(times)$として、

    $
      v
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
        gamma_2(-theta_(mu))
      )
    $
  ]
]

#claim([$A(theta)$の対角化])[
  $cal(M) := {-M, dots, -2, -1, 1, 2, dots, M}$ とする。

  $mu in cal(M)$について、

  $gamma_2(theta_mu) = 0$のとき、

  $
    P_mu
    :=
    mat(
      plus
      sqrt(
        -1
      )
      sqrt(
        gamma_2(theta_(mu))
        gamma_2(-theta_(mu))
      )
      ,
      minus
      sqrt(
        -1
      )
      sqrt(
        gamma_2(theta_(mu))
        gamma_2(-theta_(mu))
      );
      gamma_2(-theta_(mu))
      ,
      gamma_2(-theta_(mu))
    )
    \
    D_mu
    :=
    mat(
      (
        gamma_1(theta_(mu))
      )
      plus
      sqrt(
        -1
      )
      sqrt(
        (
          gamma_2(theta_(mu))
        )
        (
          gamma_2(-theta_(mu))
        )
      ),
      0
      ;
      0,
      (
        gamma_1(theta_(mu))
      )
      minus
      sqrt(
        -1
      )
      sqrt(
        (
          gamma_2(theta_(mu))
        )
        (
          gamma_2(-theta_(mu))
        )
      )
    )
  $

  とおけば、

  $
    A(theta_(mu))
    =
    P_mu
    D_mu
    P_mu
    ^
    (-1)
  $

  $gamma_2(theta_mu) = 0$のとき、

  $
    A(theta_(mu))
    =
    I "(単位行列)"
  $
]

#claim([$a(theta_mu)$])[
  ※ホロノミック量子場付録B (B.11/B.12)の表式の検討

  $gamma_2(theta_mu) eq.not 0$の時、

  $
    alpha_1 :&= tanh K_1 tanh K_2^*
    \
    alpha_2 :&= (tanh K_1)^(-1) tanh K_2^*
    \
    a(theta_mu)
    :&=
    sqrt(
      (
        (1 - alpha_1 e^(i theta))
      )
      /
      (
        (1 - alpha_1 e^(-i theta))
      )
      dot.c
      (
        (1 - alpha_2^(-1) e^(i theta))
      )
      /
      (
        (1 - alpha_2^(-1) e^(-i theta))
      )
    )
  $

  と定めるとき、

  $
    sqrt(-1)(a(theta_mu))^(-1)
    =
    (
      sqrt(
        -1
      )
      sqrt(
        gamma_2(theta_(mu))
        gamma_2(-theta_(mu))
      )
    )
    /
    (
      gamma_2(-theta_(mu))
    )
  $

  #proof[
    $
      (
        sqrt(
          -1
        )
        sqrt(
          gamma_2(theta_(mu))
          gamma_2(-theta_(mu))
        )
      )
      /
      (
        gamma_2(-theta_(mu))
      )
      &=
      (
        sqrt(
          -1
        )
        sqrt(
          gamma_2(theta_(mu))
          gamma_2(-theta_(mu))
        )
      )
      /
      sqrt(
        (
          gamma_2(-theta_(mu))
        )
        ^
        2
      )
      \
      "(次回20250906)" gamma_2(theta_(mu)) "が 右半面、左半面、負の実数で場合分けする。どこかで符号がひっくり返って辻褄が合いそう"
      \
      &=
      sqrt(
        -1
      )
      (
        sqrt(
          (
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        )
        sqrt(
          1
          /
          (
            (
              gamma_2(-theta_(mu))
            )
            ^
            2
          )
        )
      )
      \
      &=
      sqrt(
        -1
      )
      (
        sqrt(
          (
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
          dot.op
          1
          /
          (
            (
              gamma_2(-theta_(mu))
            )
            ^
            2
          )
        )
      )
      \
      &=
      sqrt(
        -1
      )
      (
        sqrt(
          (
            gamma_2(theta_(mu))
          )
          /
          (
            gamma_2(-theta_(mu))
          )
        )
      )
      \
      &=
      sqrt(
        -1
      )
      (
        sqrt(
          (
            sqrt(-1) e^(sqrt(-1) theta_(mu)) s_2^* (c_1 cos (theta_(mu)) - sqrt(-1) sin (theta_(mu)) - s_1 c_2)
          )
          /
          (
            sqrt(-1) e^(-sqrt(-1) theta_mu) s_2^* (c_1 cos (theta_mu) + sqrt(-1) sin (theta_mu) - s_1 c_2)
          )
        )
      )
      \
      &=
      sqrt(
        -1
      )
      (
        sqrt(
          (
            e^(sqrt(-1) theta_(mu)) (c_1 cos (theta_(mu)) - sqrt(-1) sin (theta_(mu)) - s_1 c_2)
          )
          /
          (
            e^(-sqrt(-1) theta_mu) (c_1 cos (theta_mu) + sqrt(-1) sin (theta_mu) - s_1 c_2)
          )
        )
      )
      \
      &=
      sqrt(
        -1
      )
      (
        sqrt(
          (
            e^(sqrt(-1) theta_(mu)) (cosh(2K_1) cos (theta_(mu)) - sqrt(-1) sin (theta_(mu)) - sinh(2K_1) cosh(2K_2))
          )
          /
          (
            e^(-sqrt(-1) theta_mu) (cosh(2K_1) cos (theta_mu) + sqrt(-1) sin (theta_mu) - sinh(2K_1) cosh(2K_2))
          )
        )
      )
    $

    $
      a(theta_mu)
      &=
      sqrt(
        (
          (1 - alpha_1 e^(sqrt(-1) theta_mu))
        )
        /
        (
          (1 - alpha_1 e^(-sqrt(-1) theta_mu))
        )
        dot.c
        (
          (1 - alpha_2^(-1) e^(sqrt(-1) theta_mu))
        )
        /
        (
          (1 - alpha_2^(-1) e^(-sqrt(-1) theta_mu))
        )
      )
      \
      &=
      sqrt(
        (
          (1 - (tanh K_1 tanh K_2^*) e^(sqrt(-1) theta_mu))
        )
        /
        (
          (1 - (tanh K_1 tanh K_2^*) e^(-sqrt(-1) theta_mu))
        )
        dot.c
        (
          (1 - ((tanh K_1)^(-1) tanh K_2^*)^(-1) e^(sqrt(-1) theta_mu))
        )
        /
        (
          (1 - ((tanh K_1)^(-1) tanh K_2^*)^(-1) e^(-sqrt(-1) theta_mu))
        )
      )
    $

    より、

    $
      sqrt(-1) a(theta_mu)^(-1)
      &=
      sqrt(
        (
          (1 - (tanh K_1 tanh K_2^*) e^(-sqrt(-1) theta_mu))
        )
        /
        (
          (1 - (tanh K_1 tanh K_2^*) e^(sqrt(-1) theta_mu))
        )
        dot.c
        (
          (1 - ((tanh K_1)^(-1) tanh K_2^*)^(-1) e^(-sqrt(-1) theta_mu))
        )
        /
        (
          (1 - ((tanh K_1)^(-1) tanh K_2^*)^(-1) e^(sqrt(-1) theta_mu))
        )
      )
    $

    以下のsagemathコードで数値的に等しいことが検証できた
    ```python
    # 変数とパラメータの定義
    var('K1 K2 theta_mu')

    # K1^*, K2^* の定義
    def Kstar(K):
        return -1/2 * log(tanh(K))

    K1s = Kstar(K1)
    K2s = Kstar(K2)

    # e^{iθ_μ}
    eiθ = exp(I*theta_mu)
    emθ = exp(-I*theta_mu)

    # --- 1つ目の式 ---
    numer1 = eiθ*(cosh(2*K1)*cos(theta_mu) - I*sin(theta_mu) - sinh(2*K1)*cosh(2*K2))
    denom1 = emθ*(cosh(2*K1)*cos(theta_mu) + I*sin(theta_mu) - sinh(2*K1)*cosh(2*K2))
    expr1 = I*sqrt(numer1/denom1)

    # --- 2つ目の式 ---
    tK1 = tanh(K1)
    tK2s = tanh(K2s)
    inv_tK1 = 1/tK1

    factor1_num = 1 - (tK1 * tK2s) * emθ
    factor1_den = 1 - (tK1 * tK2s) * eiθ
    factor2_num = 1 - (1/(inv_tK1 * tK2s)) * emθ
    factor2_den = 1 - (1/(inv_tK1 * tK2s)) * eiθ
    expr2 = sqrt((factor1_num/factor1_den) * (factor2_num/factor2_den))

    # 数値代入例（任意の値、変更可）
    K1_val = 0.7
    K2_val = 1.2
    theta_mu_val = 1.1

    # 代入して数値計算
    val1 = expr1.subs({K1:K1_val, K2:K2_val, theta_mu:theta_mu_val}).n()
    val2 = expr2.subs({K1:K1_val, K2:K2_val, theta_mu:theta_mu_val}).n()

    # 結果表示
    print("expr1 =", val1)
    print("expr2 =", val2)
    print("差 =", abs(val1 - val2))
    ```
    $qed$
  ]
]

#definition("フェルミオン", [
  $cal(M) := {-M, dots, -2, -1, 1, 2, dots, M}$ とする。

  $mu in cal(M)$について、$psi_mu, psi_mu^dagger in "Mat"(2, CC)^(times.circle M)$を、

  $
    mat(
      psi_mu^dagger,
      psi_mu
    )
    :&=
    (
      hat(Z)_mu^((minus)),
      hat(Y)_mu
    )
    dot.c
    P_mu
    \
    &=
    (
      hat(Z)_mu^((minus)),
      hat(Y)_mu
    )
    dot.c
    mat(
      plus
      sqrt(
        -1
      )
      sqrt(
        gamma_2(theta_(mu))
        gamma_2(-theta_(mu))
      )
      ,
      minus
      sqrt(
        -1
      )
      sqrt(
        gamma_2(theta_(mu))
        gamma_2(-theta_(mu))
      );
      gamma_2(-theta_(mu))
      ,
      gamma_2(-theta_(mu))
    )
    \
    &=
    (
      (
        plus
        sqrt(
          -1
        )
        sqrt(
          gamma_2(theta_(mu))
          gamma_2(-theta_(mu))
        )
      )
      hat(Z)_mu^((minus))
      +
      (
        gamma_2(-theta_(mu))
      )
      hat(Y)_mu
      ,
      (
        minus
        sqrt(
          -1
        )
        sqrt(
          gamma_2(theta_(mu))
          gamma_2(-theta_(mu))
        )
      )
      hat(Z)_mu^((minus))
      +
      (
        gamma_2(-theta_(mu))
      )
      hat(Y)_mu
    )
  $

  と定める
])<def_fermi>

#claim([$V$と$psi$の交換関係(B.13)])[
  $cal(M) := {-M, dots, -2, -1, 1, 2, dots, M}$ とする。

  $mu in cal(M)$について、

  $
    T_((V))mat(psi_mu^dagger)
    &=
    (
      (
        gamma_1(theta_(mu))
      )
      plus
      sqrt(
        -
        (
          gamma_2(theta_(mu))
        )
        (
          gamma_2(-theta_(mu))
        )
      )
    )
    psi_mu^dagger
    \
    T_((V))(psi_mu)
    &=
    (
      (
        gamma_1(theta_(mu))
      )
      minus
      sqrt(
        -
        (
          gamma_2(theta_(mu))
        )
        (
          gamma_2(-theta_(mu))
        )
      )
    )
    psi_mu
  $

  #note[
    $
      (
        hat(Z)_mu^((minus)),
        hat(Y)_mu
      )
      dot.op
      A((2 pi mu) / M)
      &=
      mat(
        (
          c_1 c_2^*
          -
          s_1 s_2^* cos ((2 pi mu) / M)
        )
        hat(Z)_mu^((minus))
        +
        (
          - sqrt(-1) exp(-sqrt(-1) (2 pi mu) / M) s_2^* (c_1 cos ((2 pi mu) / M) + sqrt(-1) sin ((2 pi mu) / M) - s_1 c_2)
        )
        hat(Y)_mu,
        (
          sqrt(-1) exp(sqrt(-1) (2 pi mu) / M) s_2^* (c_1 cos ((2 pi mu) / M) - sqrt(-1) sin ((2 pi mu) / M) - s_1 c_2)
        )
        hat(Z)_mu^((minus))
        +
        (
          c_1 c_2^*
          -
          s_1 s_2^* cos ((2 pi mu) / M)
        )
        hat(Y)_mu
      )
    $
  ]

  #proof[
    $
      mat(
        T_((V))(psi_mu^dagger),
        T_((V))(psi_mu)
      )
      &=
      T_((V))
      mat(
        psi_mu^dagger,
        psi_mu
      )
      \
      &=
      T_((V))
      (
        (
          hat(Z)_mu^((minus)),
          hat(Y)_mu
        )
        dot.c
        P_mu
      )
      quad
      (because #ref(<mat_conj>)"より、" T_((V))"は線形写像")
      \
      &=
      T_((V))
      (
        (
          plus
          sqrt(
            -1
          )
          sqrt(
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        )
        hat(Z)_mu^((minus))
        +
        (
          gamma_2(-theta_(mu))
        )
        hat(Y)_mu
        ,
        (
          minus
          sqrt(
            -1
          )
          sqrt(
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        )
        hat(Z)_mu^((minus))
        +
        (
          gamma_2(-theta_(mu))
        )
        hat(Y)_mu
      )
      \
      &=
      (
        (
          plus
          sqrt(
            -1
          )
          sqrt(
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        )
        T_((V))
        (
          hat(Z)_mu^((minus))
        )
        +
        (
          gamma_2(-theta_(mu))
        )
        T_((V))
        (
          hat(Y)_mu
        )
        ,
        (
          minus
          sqrt(
            -1
          )
          sqrt(
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        )
        T_((V))
        (
          hat(Z)_mu^((minus))
        )
        +
        (
          gamma_2(-theta_(mu))
        )
        T_((V))
        (
          hat(Y)_mu
        )
      )
      \
      &=
      mat(
        T_((V))
        (
          hat(Z)_mu^((minus))
        ),
        T_((V))
        (
          hat(Y)_mu
        )
      )
      mat(
        (
          plus
          sqrt(
            -1
          )
          sqrt(
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        )
        ,
        (
          minus
          sqrt(
            -1
          )
          sqrt(
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        );
        (
          gamma_2(-theta_(mu))
        ),
        (
          gamma_2(-theta_(mu))
        )
      )
      \
      &=
      mat(
        hat(Z)_mu^((minus))
        ,
        hat(Y)_mu
      )
      A(theta_(mu))
      P_mu
      \
      &=
      mat(
        hat(Z)_mu^((minus))
        ,
        hat(Y)_mu
      )
      (
        P_mu
        D_mu
        P_mu
        ^
        (-1)
      )
      P_mu
      \
      &=
      mat(
        hat(Z)_mu^((minus))
        ,
        hat(Y)_mu
      )
      P_mu
      D_mu
      \
      &=
      mat(
        psi_mu^dagger,
        psi_mu
      )
      D_mu
      \
      &=
      mat(
        psi_mu^dagger,
        psi_mu
      )
      mat(
        (
          gamma_1(theta_(mu))
        )
        plus
        sqrt(
          -
          (
            gamma_2(theta_(mu))
          )
          (
            gamma_2(-theta_(mu))
          )
        ),
        0
        ;
        0,
        (
          gamma_1(theta_(mu))
        )
        minus
        sqrt(
          -
          (
            gamma_2(theta_(mu))
          )
          (
            gamma_2(-theta_(mu))
          )
        )
      )
      \
      &=
      mat(
        (
          (
            gamma_1(theta_(mu))
          )
          plus
          sqrt(
            -
            (
              gamma_2(theta_(mu))
            )
            (
              gamma_2(-theta_(mu))
            )
          )
        )
        psi_mu^dagger,
        (
          (
            gamma_1(theta_(mu))
          )
          minus
          sqrt(
            -
            (
              gamma_2(theta_(mu))
            )
            (
              gamma_2(-theta_(mu))
            )
          )
        )
        psi_mu
      )
      \
      qed
    $
  ]
]

#claim([$psi$の反交換関係])[
  $cal(M) := {-M, dots, -2, -1, 1, 2, dots, M}$ とする。

  $mu, nu in cal(M)$について、

  $
    [psi_mu^dagger, psi_nu^dagger]_(+) &= 0
    \
    [psi_mu^dagger, psi_nu]_(+) &= delta_(mu equiv nu (mod M))
    \
    [psi_mu, psi_nu]_(+) &= 0
  $

  #proof[
    $a) [psi_mu^dagger, psi_nu^dagger]_(+)$について、

    $
      [psi_mu^dagger, psi_nu^dagger]_(+)
      &=
      [
        (
          plus
          sqrt(
            -1
          )
          sqrt(
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        )
        hat(Z)_mu^((minus))
        +
        (
          gamma_2(-theta_(mu))
        )
        hat(Y)_mu
        ,
        (
          plus
          sqrt(
            -1
          )
          sqrt(
            gamma_2(theta_(nu))
            gamma_2(-theta_(nu))
          )
        )
        hat(Z)_nu^((minus))
        +
        (
          gamma_2(-theta_(nu))
        )
        hat(Y)_nu
      ]_(+)
      \
      &=
      [
        (
          plus
          sqrt(
            -1
          )
          sqrt(
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        )
        hat(Z)_mu^((minus))
        ,
        (
          plus
          sqrt(
            -1
          )
          sqrt(
            gamma_2(theta_(nu))
            gamma_2(-theta_(nu))
          )
        )
        hat(Z)_nu^((minus))
        +
        (
          gamma_2(-theta_(nu))
        )
        hat(Y)_nu
      ]_(+)
      +
      [
        (
          gamma_2(-theta_(mu))
        )
        hat(Y)_mu
        ,
        (
          plus
          sqrt(
            -1
          )
          sqrt(
            gamma_2(theta_(nu))
            gamma_2(-theta_(nu))
          )
        )
        hat(Z)_nu^((minus))
        +
        (
          gamma_2(-theta_(nu))
        )
        hat(Y)_nu
      ]_(+)
      \
      &=
      [
        (
          plus
          sqrt(
            -1
          )
          sqrt(
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        )
        hat(Z)_mu^((minus))
        ,
        (
          plus
          sqrt(
            -1
          )
          sqrt(
            gamma_2(theta_(nu))
            gamma_2(-theta_(nu))
          )
        )
        hat(Z)_nu^((minus))
      ]_(+)
      +
      [
        (
          plus
          sqrt(
            -1
          )
          sqrt(
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        )
        hat(Z)_mu^((minus))
        ,
        (
          gamma_2(-theta_(nu))
        )
        hat(Y)_nu
      ]_(+)
      +
      [
        (
          gamma_2(-theta_(mu))
        )
        hat(Y)_mu
        ,
        (
          plus
          sqrt(
            -1
          )
          sqrt(
            gamma_2(theta_(nu))
            gamma_2(-theta_(nu))
          )
        )
        hat(Z)_nu^((minus))
      ]_(+)
      +
      [
        (
          gamma_2(-theta_(mu))
        )
        hat(Y)_mu
        ,
        (
          gamma_2(-theta_(nu))
        )
        hat(Y)_nu
      ]_(+)
      ]_(+)
      \
      &=
      (
        plus
        sqrt(
          -1
        )
        sqrt(
          gamma_2(theta_(mu))
          gamma_2(-theta_(mu))
        )
      )
      (
        plus
        sqrt(
          -1
        )
        sqrt(
          gamma_2(theta_(nu))
          gamma_2(-theta_(nu))
        )
      )
      [
        hat(Z)_mu^((minus))
        ,
        hat(Z)_nu^((minus))
      ]_(+)
      +
      (
        plus
        sqrt(
          -1
        )
        sqrt(
          gamma_2(theta_(mu))
          gamma_2(-theta_(mu))
        )
      )
      (
        gamma_2(-theta_(nu))
      )
      [
        hat(Z)_mu^((minus))
        ,
        hat(Y)_nu
      ]_(+)
      +
      (
        gamma_2(-theta_(mu))
      )
      (
        plus
        sqrt(
          -1
        )
        sqrt(
          gamma_2(theta_(nu))
          gamma_2(-theta_(nu))
        )
      )
      [
        hat(Y)_mu
        ,
        hat(Z)_nu^((minus))
      ]_(+)
      +
      (
        gamma_2(-theta_(mu))
      )
      (
        gamma_2(-theta_(nu))
      )
      [
        hat(Y)_mu
        ,
        hat(Y)_nu
      ]_(+)
      \
      &=
      minus
      (
        sqrt(
          gamma_2(theta_(mu))
          gamma_2(-theta_(mu))
        )
      )
      (
        sqrt(
          gamma_2(theta_(nu))
          gamma_2(-theta_(nu))
        )
      )
      dot.op
      (
        2M delta^M_(mu + nu, 0) I_((CC^2)^(times.circle M))
      )
      +
      (
        plus
        sqrt(
          -1
        )
        sqrt(
          gamma_2(theta_(mu))
          gamma_2(-theta_(mu))
        )
      )
      (
        gamma_2(-theta_(nu))
      )
      dot.op
      0
      +
      (
        gamma_2(-theta_(mu))
      )
      (
        plus
        sqrt(
          -1
        )
        sqrt(
          gamma_2(theta_(nu))
          gamma_2(-theta_(nu))
        )
      )
      dot.op
      0
      +
      (
        gamma_2(-theta_(mu))
      )
      (
        gamma_2(-theta_(nu))
      )
      dot.op
      (
        2M delta^M_(mu + nu, 0) I_((CC^2)^(times.circle M))
      )
      \
      &=
      minus
      (
        sqrt(
          gamma_2(theta_(mu))
          gamma_2(-theta_(mu))
        )
      )
      (
        sqrt(
          gamma_2(theta_(nu))
          gamma_2(-theta_(nu))
        )
      )
      dot.op
      (
        2M delta^M_(mu + nu, 0) I_((CC^2)^(times.circle M))
      )
      +
      (
        gamma_2(-theta_(mu))
      )
      (
        gamma_2(-theta_(nu))
      )
      dot.op
      (
        2M delta^M_(mu + nu, 0) I_((CC^2)^(times.circle M))
      )
      \
      &=
      (
        minus
        (
          sqrt(
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        )
        (
          sqrt(
            gamma_2(theta_(nu))
            gamma_2(-theta_(nu))
          )
        )
        +
        (
          gamma_2(-theta_(mu))
        )
        (
          gamma_2(-theta_(nu))
        )
      )
      dot.op
      (
        2M delta^M_(mu + nu, 0) I_((CC^2)^(times.circle M))
      )
      \
      &=
      (
        minus
        abs(
          gamma_2(theta_(mu))
        )
        abs(
          gamma_2(theta_(nu))
        )
        +
        (
          overline(
            gamma_2(theta_(mu))
          )
        )
        (
          overline(
            gamma_2(theta_(nu))
          )
        )
      )
      dot.op
      (
        2M delta^M_(mu + nu, 0) I_((CC^2)^(times.circle M))
      )
    $

    (次回 20250614) WIP

    #note[
      $
        mat(
          psi_mu^dagger,
          psi_mu
        )
        :=
        (
          (
            plus
            sqrt(
              -1
            )
            sqrt(
              gamma_2(theta_(mu))
              gamma_2(-theta_(mu))
            )
          )
          hat(Z)_mu^((minus))
          +
          (
            gamma_2(-theta_(mu))
          )
          hat(Y)_mu
          ,
          (
            minus
            sqrt(
              -1
            )
            sqrt(
              gamma_2(theta_(mu))
              gamma_2(-theta_(mu))
            )
          )
          hat(Z)_mu^((minus))
          +
          (
            gamma_2(-theta_(mu))
          )
          hat(Y)_mu
        )
      $

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

    ]
  ]
]

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
