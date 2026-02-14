#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules
#claim([$(gamma_2(theta_mu)) / (gamma_2(-theta_mu))$の$arg$])[
  #note[
      $
    arg^((-pi, pi])(1/z)
    =
    arg^((-pi, pi])(z^(-1))
    =
    cases(
      -arg^((-pi, pi])(z) & quad (-pi < arg^((-pi, pi])(z) < pi),
      pi & quad (arg^((-pi, pi])(z) = pi),
    )
    // <range_of_args_of_reciprocal_of_complex_numbers>
  $
     $z_1, z_2 in CC$ について、

  $r_1, r_2 in RR_(>=0), theta_1, theta_2 in RR$ を用いて、

  $phi_("polar")(z_1) = [(r_1, theta_1)]_(~), phi_("polar")(z_2) = [(r_2, theta_2)]_(~)$ とする

  このとき、$-pi < theta_1 + theta_2 - 2n pi <= pi$ を満たす $n in ZZ$ が存在して、
  $
    arg^((-pi, pi])(z_1 z_2) = theta_1 + theta_2 - 2n pi
  $
    
// <arg_of_product_of_complex_numbers>


  ]
  $mu in cal(M)$について、

  $
    arg^((-pi, pi])(
      (gamma_2(theta_mu)) / (gamma_2(-theta_mu))
    ) = ???
  $

  $
    
  $
]
