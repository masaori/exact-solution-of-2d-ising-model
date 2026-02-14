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
    arg^((-pi, pi])(z_1 / z_2) = theta_1 - theta_2 - 2n pi
    =
    cases(
      arg^((-pi, pi])(z_1) - arg^((-pi, pi])(z_2) - pi & quad (???),
      arg^((-pi, pi])(z_1) - arg^((-pi, pi])(z_2) & quad (???),
      arg^((-pi, pi])(z_1) - arg^((-pi, pi])(z_2) + pi & quad (???),
    )
  $

  TODO: 20260124 条件を調べて埋める。proofは同様に、で良い
  これが終わったら、フェルミオンの検証に戻る
  $gamma_2(theta_mu)$の分枝を決める必要がある

  #proof[

  ]
]<arg_of_quotient_of_complex_numbers>
