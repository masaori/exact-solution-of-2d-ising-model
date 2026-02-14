#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules
#claim([$gamma_2(theta_mu), gamma_2(-theta_mu)$の$arg$])[
  
  $mu in cal(M)$ について、

  $r_plus, r_minus in RR_(>=0), theta_plus, theta_minus in RR$ として、

  $gamma_2(theta_(mu)) = [(r_plus, theta_plus)], gamma_2(-theta_(mu)) = [(r_minus, theta_minus)]$  とするとき、

  $
    arg^((-pi, pi])(gamma_2(theta_(mu))) + arg^((-pi, pi])(gamma_2(-theta_(mu)))
    =
    cases(
      - pi & quad (exists m in ZZ "s.t." -2pi < theta_plus + theta_minus - 2m pi <= -pi),
      pi & quad ((r_plus = 0 or r_minus = 0) or exists m in ZZ "s.t." -pi < theta_plus + theta_minus - 2m pi <= pi),
    )
  $

  #proof[
    #ref(<arg_of_gamma_2_mu>) と、
    #ref(<range_of_args_of_multiple_of_complex_numbers>)より

    $qed$
  ]
]
