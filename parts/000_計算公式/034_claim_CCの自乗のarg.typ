#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules

#claim([$CC$の自乗の$arg$])[
  $z in CC$について、

  $r in RR_(>=0), theta in RR$ を用いて

  $phi_("polar")(z) = [(r, theta)]_(~)$ であるとき、

  $
    arg^((-pi, pi])(z^2)
    =
    cases(
      2 arg^((-pi, pi])(z) + 2pi & quad (exists n in ZZ "s.t." -pi < theta - 2n pi <= -pi/2 <=> -pi < arg^((-pi, pi])(z) <= -pi/2),
      2 arg^((-pi, pi])(z) & quad (exists n in ZZ "s.t." -pi/2 < theta - 2n pi <= pi/2 <=> -pi/2 < arg^((-pi, pi])(z) <= pi/2),
      2 arg^((-pi, pi])(z) - 2pi & quad (exists n in ZZ "s.t." pi/2 < theta - 2n pi <= pi <=> pi/2 < arg^((-pi, pi])(z) < pi),
    )
  $

  #proof[
    $z in CC$ について、

    $r in RR_(>=0), theta in RR$ を用いて

    $phi_("polar")(z) = [(r, theta)]_(~)$ であるとき、

    $-pi < theta - 2n_1 pi <= pi$ を満たす $n_1 in ZZ$ と $-pi < 2theta - 2n_2 pi <= pi$ を満たす $n_2 in ZZ$ が存在して、

    $m in ZZ$ を用いて、 $n_1 = n_2 + m$ と書ける。

    このとき、 $-pi < theta - 2 (n_2 + m) pi <= pi$ であるから、

    (TODO: $m$の範囲を $theta$で表す)

    また、

    $arg^((-pi, pi])(z) = theta - 2n_1 pi$ であり、


    $
      arg^((-pi, pi])(z^2)
      &=
      s_((-pi, pi])("pr"_2(phi_("polar")(z^2)))
      \
      &=
      s_((-pi, pi])("pr"_2(phi_("polar")(z) phi_("polar")(z)))
      quad
      (because phi_("polar")"の同型性")
      \
      &=
      s_((-pi, pi])("pr"_2([(r, theta)]_(~) [(r, theta)]_(~)))
      \
      &=
      s_((-pi, pi])("pr"_2([(r^2, 2 theta)]_(~)))
      \
      &=
      s_((-pi, pi])([2 theta]_(~_(angle)))
      \
      &=
      2 theta - 2n_2 pi
    $

    (TODO: $m$が$theta$によって、$-1,0,1$になるはず)
  ]
]<range_of_args_of_square_of_complex_numbers>
