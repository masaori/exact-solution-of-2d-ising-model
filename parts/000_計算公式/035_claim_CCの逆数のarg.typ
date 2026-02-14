#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules

#claim([$CC$の逆数の$arg$])[
  $z in CC$について、

  $r in RR_(>=0), theta in RR$ を用いて

  $phi_("polar")(z) = [(r, theta)]_(~)$ であるとき、

  $
    arg^((-pi, pi])(1/z)
    =
    arg^((-pi, pi])(z^(-1))
    =
    cases(
      -arg^((-pi, pi])(z) & quad (-pi < arg^((-pi, pi])(z) < pi),
      pi & quad (arg^((-pi, pi])(z) = pi),
    )
  $

  #proof[
    $z in CC$ について、

    $r in RR_(>=0), theta in RR$ を用いて

    $phi_("polar")(z) = [(r, theta)]_(~)$ であるとき、

    $-pi < theta - 2n pi <= pi$ を満たす $n in ZZ$ が存在して、

    $-pi <= -theta - 2 (-n) pi < pi$ であり、

    $
      -pi = -theta - 2 (-n) pi 
      &<=>
      -pi +2pi = -theta - 2 (-n) pi + 2pi
      \
      &<=>
      pi = -theta - 2 (-n - 1) pi
    $

    であるから、

    $
      arg^((-pi, pi])(z^(-1))
      &=
      s_((-pi, pi])("pr"_2(phi_("polar")(z^(-1))))
      \
      &=
      s_((-pi, pi])("pr"_2((phi_("polar")(z))^(-1)))
      quad
      (because phi_("polar")"の同型性")
      \
      &=
      s_((-pi, pi])("pr"_2(([(r, theta)]_(~))^(-1)))
      \
      &=
      s_((-pi, pi])("pr"_2([(1/r, -theta)]_(~)))
      \
      &=
      s_((-pi, pi])([-theta]_(~_(angle)))
      \
      &=
      cases(
        -theta - 2 (-n) pi & quad (-pi < theta - 2n pi < pi),
        -theta - 2 (-n - 1) pi & quad (theta - 2n pi = pi),
      )
      \
      &=
      cases(
        -theta - 2 (-n) pi & quad (-pi < theta - 2n pi < pi),
        -theta - 2 (-n) pi + 2pi & quad (theta - 2n pi = pi),
      )
      \
      &=
      cases(
        -(theta - 2n pi) & quad (-pi < theta - 2n pi < pi),
        -(theta - 2n pi) + 2pi & quad (theta - 2n pi = pi),
      )
      \
      &=
      cases(
        -arg^((-pi, pi])(z) & quad (-pi < theta - 2n pi < pi),
        pi & quad (theta - 2n pi = pi),
      )
    $
    $qed$
  ]
]<range_of_args_of_reciprocal_of_complex_numbers>
