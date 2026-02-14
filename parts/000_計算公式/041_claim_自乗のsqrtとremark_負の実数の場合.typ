#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules

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
]<square_of_sqrt>

#remark[
  $z in CC$について、$Re(z) < 0, Im(z) = 0$ のとき、

  (すなわち、$z in RR_(<0)$とみなせるとき)

  $arg^((-pi, pi])(z) = pi$ であるから、

  $
    z = -sqrt(z^2)
  $
]
