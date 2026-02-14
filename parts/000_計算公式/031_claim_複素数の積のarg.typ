#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules

#claim(none)[

  $z_1, z_2 in CC$ について、

  $r_1, r_2 in RR_(>=0), theta_1, theta_2 in RR$ を用いて、

  $phi_("polar")(z_1) = [(r_1, theta_1)]_(~), phi_("polar")(z_2) = [(r_2, theta_2)]_(~)$ とすると、

  $-pi < theta_1 - 2n_1 pi <= pi, -pi < theta_2 - 2n_2 pi <= pi$ を満たす $n_1, n_2 in ZZ$ が存在して、

  $arg^((-pi, pi])(z_1) = theta_1 - 2n_1 pi, arg^((-pi, pi])(z_2) = theta_2 - 2n_2 pi$

  と書ける。

  このとき、
  $
    arg^((-pi, pi])(z_1 z_2) = theta_1 + theta_2 - 2n pi
    =
    cases(
      arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) - pi & quad (0 < theta_1 + theta_2 - 2 (n_1 + n_2 - 1) pi <= pi),
      arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) & quad (- pi < theta_1 + theta_2 - 2 (n_1 + n_2) pi <= pi),
      arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) + pi & quad (- pi < theta_1 + theta_2 - 2 (n_1 + n_2 + 1) pi <= 0),
    )
  $

  #proof[

    $-pi < theta_1 + theta_2 - 2n pi <= pi$ を満たす $n in ZZ$ が存在して、

    $
      arg^((-pi, pi])(z_1 z_2)
      &=
      s_((-pi, pi])("pr"_2(phi_("polar")(z_1 z_2)))
      \
      &=
      s_((-pi, pi])("pr"_2(phi_("polar")(z_1) phi_("polar")(z_2)))
      quad
      (because phi_("polar")"の同型性")
      \
      &=
      s_((-pi, pi])("pr"_2([(r_1, theta_1)]_(~) [(r_2, theta_2)]_(~)))
      \
      &=
      s_((-pi, pi])("pr"_2([(r_1 r_2, theta_1 + theta_2)]_(~)))
      \
      &=
      s_((-pi, pi])([theta_1 + theta_2]_(~_(angle)))
    $

    a. $0 < theta_1 + theta_2 - 2 (n_1 + n_2) pi + 2 pi <= pi$ の時、
    $0 < theta_1 + theta_2 - 2 (n_1 + n_2 - 1) pi <= pi$ だから、
    $
      s_((-pi, pi])([theta_1 + theta_2]_(~_(angle)))
      &=
      theta_1 + theta_2 - 2 (n_1 + n_2 - 1) pi
      \
      &=
      arg^((-pi, pi])(z_1) + 2n_1 pi + arg^((-pi, pi])(z_2) + 2n_2 pi + 2 pi - 2 (n_1 + n_2 - 1) pi
      \
      &=
      arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) - pi
    $
    
    b. $- pi < theta_1 + theta_2 - 2 (n_1 + n_2) pi <= pi$ の時、
    $- pi < theta_1 + theta_2 - 2 (n_1 + n_2) pi <= pi$ だから,
    $
      s_((-pi, pi])([theta_1 + theta_2]_(~_(angle)))
      &=
      theta_1 + theta_2 - 2 (n_1 + n_2) pi
      \
      &=
      arg^((-pi, pi])(z_1) + 2n_1 pi + arg^((-pi, pi])(z_2) + 2n_2 pi - 2 (n_1 + n_2) pi
      \
      &=
      arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2)
    $

    c. $- pi < theta_1 + theta_2 - 2 (n_1 + n_2) pi - 2 pi <= 0$ の時、
    $- pi < theta_1 + theta_2 - 2 (n_1 + n_2 + 1) pi <= 0$ だから,
    $
      s_((-pi, pi])([theta_1 + theta_2]_(~_(angle)))
      &=
      theta_1 + theta_2 - 2 (n_1 + n_2 + 1) pi
      \
      &=
      arg^((-pi, pi])(z_1) + 2n_1 pi + arg^((-pi, pi])(z_2) + 2n_2 pi - 2 (n_1 + n_2 + 1) pi
      \
      &=
      arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) + pi
    $
  ]
]<arg_of_product_of_complex_numbers>
