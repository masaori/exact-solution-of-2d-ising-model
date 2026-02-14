#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules

#claim(none)[

  $z_1, z_2 in CC$ について、

  $r_1, r_2 in RR_(>=0), r_1 eq.not 0 and r_2 eq.not 0, theta_1, theta_2 in RR$ を用いて、

  $phi_("polar")(z_1) = [(r_1, theta_1)]_(~), phi_("polar")(z_2) = [(r_2, theta_2)]_(~)$ として、

  $
    arg^((-pi, pi])(z_1 z_2) = pi
  $

  だとする。

  このとき、
  $
    cases(
      arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) = -pi & quad (exists m in ZZ "s.t." -2pi < theta_1 + theta_2 - 2m pi <= -pi),
      arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) = pi & quad ((r_1 = 0 or r_2 = 0) or exists m in ZZ "s.t." -pi < theta_1 + theta_2 - 2m pi <= pi),
      ("このような" z_1, z_2 "は存在しない") & quad (exists m in ZZ "s.t." pi < theta_1 + theta_2 - 2m pi <= 2pi),
    )
  $

  #proof[

    $phi_("polar")$ の同型性 から、

    $
      arg^((-pi, pi])(z_1)
      &=
      s_((-pi, pi])("pr"_2(phi_("polar")(z_1)))
      \
      &=
      s_((-pi, pi])("pr"_2([(r_1, theta_1)]_(~)))
      \
      &=
      s_((-pi, pi])([theta_1]_(~_(angle)))
      \
      &=
      theta_1 - 2n_1 pi
    $

    $
      arg^((-pi, pi])(z_2)
      &=
      s_((-pi, pi])("pr"_2(phi_("polar")(z_2)))
      \
      &=
      s_((-pi, pi])("pr"_2([(r_2, theta_2)]_(~)))
      \
      &=
      s_((-pi, pi])([theta_2]_(~_(angle)))
      \
      &=
      theta_2 - 2n_2 pi
    $

    $
      arg^((-pi, pi])(z_1 z_2)
      &=
      s_((-pi, pi])("pr"_2(phi_("polar")(z_1 dot.op z_2)))
      \
      &=
      s_((-pi, pi])("pr"_2(phi_("polar")(z_1) dot.op phi_("polar")(z_2)))
      \
      &=
      s_((-pi, pi])("pr"_2([(r_1, theta_1)]_(~) dot.op [(r_2, theta_2)]_(~)))
      \
      &=
      s_((-pi, pi])("pr"_2([(r_1 r_2, theta_1 + theta_2)]_(~)))
      \
      &=
      s_((-pi, pi])([theta_1 + theta_2]_(~_(angle)))
    $

    また、$-pi < theta_1 - 2n_1 pi <= pi$ を満たす $n_1 in ZZ$ と、 $-pi < theta_1 + theta_2 - 2n_2 pi <= pi$ を満たす $n_2 in ZZ$ が存在して、

    $
      theta_1 + theta_2 - 2(n_1 + n_2) pi
      &=
      theta_1 -2n_1 pi + theta_2 - 2n_2 pi
      \
      &=
      arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2)
    $

    #enum(numbering: "a)")[
      $-2pi < theta_1 + theta_2 - 2(n_1 + n_2) pi <= -pi$ のとき、

      $
        0 < theta_1 + theta_2 - 2(n_1 + n_2 - 1) pi <= pi
      $

      であるから、

      $
        s_((-pi, pi])([theta_1 + theta_2]_(~_(angle)))
        =
        theta_1 + theta_2 - 2(n_1 + n_2 - 1) pi
      $

      よって、

      $
        theta_1 + theta_2 - 2(n_1 + n_2 - 1) pi &= pi
        \
        theta_1 -2n_1 pi + theta_2 - 2n_2 pi + 2pi &= pi
        \
        arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) + 2pi &= pi
        \
        arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) &= - pi
      $
    ][
      $-pi < theta_1 + theta_2 - 2(n_1 + n_2) pi <= pi$ のとき、

      より、

      $
        s_((-pi, pi])([theta_1 + theta_2]_(~_(angle)))
        =
        theta_1 + theta_2 - 2(n_1 + n_2) pi
      $

      よって、

      $
        theta_1 + theta_2 - 2(n_1 + n_2) pi &= pi
        \
        theta_1 -2n_1 pi + theta_2 - 2n_2 pi &= pi
        \
        arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) &= pi
      $
      
    ][
      $pi < theta_1 + theta_2 - 2(n_1 + n_2) pi <= 2pi$ のとき、

      $
        -pi < theta_1 + theta_2 - 2(n_1 + n_2 + 1) pi <= 0
      $

      であるから、

      $
        s_((-pi, pi])([theta_1 + theta_2]_(~_(angle)))
        =
        theta_1 + theta_2 - 2(n_1 + n_2 + 1) pi
      $

      よって、

      $
        theta_1 + theta_2 - 2(n_1 + n_2 + 1) pi &= pi
        \
        theta_1 -2n_1 pi + theta_2 - 2n_2 pi - 2pi &= pi
        \
        arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) - 2pi &= pi
        \
        arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) &= 3 pi
      $

      $-pi < arg^((-pi, pi])(z_1), arg^((-pi, pi])(z_2) <= pi$ であるから、このような $z_1, z_2$ は存在しない。
    ]

    以上から、$arg^((-pi, pi])(z_1 z_2) = pi$ であるとき、 $arg^((-pi, pi])(z_1), arg^((-pi, pi])(z_2) = pi$ の間には以下の関係式が成立する。

    $
      cases(
        arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) = -pi & quad (exists m in ZZ "s.t." -2pi < theta_1 + theta_2 - 2m pi <= -pi),
        arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) = pi & quad ((r_1 = 0 or r_2 = 0) or exists m in ZZ "s.t." -pi < theta_1 + theta_2 - 2m pi <= pi),
        ("このような" z_1, z_2 "は存在しない") & quad (exists m in ZZ "s.t." pi < theta_1 + theta_2 - 2m pi <= 2pi),
      )
    $

    $qed$
  ]
]<range_of_args_of_multiple_of_complex_numbers>
