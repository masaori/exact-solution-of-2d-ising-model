#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules
#claim([$gamma_2(theta_mu), gamma_2(-theta_mu)$の$arg$])[
  
  $mu in cal(M)$ について、

  $r_plus, r_minus in RR_(>=0), theta_plus, theta_minus in RR$ として、

  $gamma_2(theta_(mu)) = [(r_plus, theta_plus)], gamma_2(-theta_(mu)) = [(r_minus, theta_minus)]$  とするとき、

  $
    arg^([0, 2pi))(gamma_2(theta_(mu))) + arg^([0, 2pi))(gamma_2(-theta_(mu)))
    =
    cases(
      pi & quad (exists m in ZZ "s.t." 0 <= theta_plus + theta_minus - 2m pi < 2pi),
      pi + 2pi & quad (exists m in ZZ "s.t." 2pi <= theta_plus + theta_minus - 2m pi < 4pi),
    )
  $

  #proof[
    #ref(<arg_of_gamma_2_mu>) と、
    #ref(<range_of_args_of_multiple_of_complex_numbers>)より

    $qed$
  ]
]
