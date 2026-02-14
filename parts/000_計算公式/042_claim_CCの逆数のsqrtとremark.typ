#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules

#claim([$CC$の逆数の$sqrt(dot)$])[
  $z in CC, z eq.not 0$について、

  $
    sqrt(1/z) = cases(
      1/sqrt(z) & quad (-pi < arg^((-pi, pi])(z) < pi),
      -(1/sqrt(z)) & quad (arg^((-pi, pi])(z) = pi),
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
