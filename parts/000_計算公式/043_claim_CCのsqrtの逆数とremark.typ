#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules

#claim([$CC$の$sqrt(dot)$の逆数])[
  $z in CC$について、

  $
    (sqrt(z))^(-1)
    =
    1/sqrt(z)
    =
    cases(
      sqrt(1/z) & quad (-pi < arg^((-pi, pi])(z) < pi),
      -(sqrt(1/z)) & quad (arg^((-pi, pi])(z) = pi),
    )
  $

  #proof[
    #ref(<inverse_of_sqrt_cc>)より。
  ]

]<sqrt_cc_of_inverse>

#remark[
  $z in CC^(times)$ について、

  $
    (sqrt(z))^(-1) = cases(
        sqrt(1/z) & quad (-pi < arg^( (-pi, pi])(z) < pi <=> z in.not RR_(<0)),
        -(sqrt(1/z)) & quad (arg^( (-pi, pi])(z) = pi <=> z in RR_(<0)),
    )
  $
]
