#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules
#claim([$a(theta_mu)$])[
  ※ホロノミック量子場付録B (B.11/B.12)の表式の検討

  $gamma_2(theta_mu) eq.not 0$の時、

  $
    alpha_1 :&= tanh K_1 tanh K_2^*
    \
    alpha_2 :&= (tanh K_1)^(-1) tanh K_2^*
    \
    a(theta_mu)
    :&=
    sqrt(
      (
        (1 - alpha_1 e^(sqrt(-1) theta_mu))
      )
      /
      (
        (1 - alpha_1 e^(-sqrt(-1) theta_mu))
      )
      dot.c
      (
        (1 - alpha_2^(-1) e^(sqrt(-1) theta_mu))
      )
      /
      (
        (1 - alpha_2^(-1) e^(-sqrt(-1) theta_mu))
      )
    )
  $

  と定めるとき、

  $
    a(theta_mu)
    &=
    sqrt(
      (gamma_2(theta_(mu)))
      /
      (gamma_2(-theta_(mu)))
    )
    \
    &=
    cases(
      -
      (
        (
          sqrt(
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        )
        /
        (
          gamma_2(-theta_(mu))
        )
      )
      &quad (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= 0),
      (
        (
          sqrt(
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        )
        /
        (
          gamma_2(-theta_(mu))
        )
      )
      &quad (0 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
    )
  $
  
  #proof[
    $mu in cal(M)$ について、

    $r_plus, r_minus in RR_(>=0), theta_plus, theta_minus in RR$ として、

    $gamma_2(theta_(mu)) = [(r_plus, theta_plus)], gamma_2(-theta_(mu)) = [(r_minus, theta_minus)]$  とするとき、

    $
      arg^((-pi, pi])((gamma_2(-theta_(mu)))^2)
      =
      cases(
        2 arg^((-pi, pi])(gamma_2(-theta_(mu))) + 2pi & quad (exists n in ZZ "s.t." -pi < theta_minus - 2n pi <= -pi/2 <=> -pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= -pi/2),
        2 arg^((-pi, pi])(gamma_2(-theta_(mu))) & quad (exists n in ZZ "s.t." -pi/2 < theta_minus - 2n pi <= pi/2 <=> -pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi/2),
        2 arg^((-pi, pi])(gamma_2(-theta_(mu))) - 2pi & quad (exists n in ZZ "s.t." pi/2 < theta_minus - 2n pi <= pi <=> pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
      )
      quad
      (because #ref(<range_of_args_of_square_of_complex_numbers>))
    $

    より、

    $
      cases(
        -2pi + 2pi < arg^((-pi, pi])((gamma_2(-theta_(mu)))^2) <= -pi + 2pi quad & (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= -pi/2),
        -pi < arg^((-pi, pi])((gamma_2(-theta_(mu)))^2) <= pi quad & (-pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi/2),
        pi - 2pi < arg^((-pi, pi])((gamma_2(-theta_(mu)))^2) <= 2pi - 2pi quad & (pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
      )
      \
      cases(
        0 < arg^((-pi, pi])((gamma_2(-theta_(mu)))^2) <= pi quad & (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= -pi/2),
        -pi < arg^((-pi, pi])((gamma_2(-theta_(mu)))^2) <= pi quad & (-pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi/2),
        -pi < arg^((-pi, pi])((gamma_2(-theta_(mu)))^2) <= 0 quad & (pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
      )
      \
      cases(
        arg^((-pi, pi])((gamma_2(-theta_(mu)))^2) = pi quad & (arg^((-pi, pi])(gamma_2(-theta_(mu))) = -pi/2 \, pi/2),
        -pi < arg^((-pi, pi])((gamma_2(-theta_(mu)))^2) < pi quad & ("otherwise"),
      )
    $

    が成り立つ。

    また、$#ref(<arg_of_gamma_2_mu>)$ より、

    $
      arg^((-pi, pi])(gamma_2(theta_(mu)) gamma_2(-theta_(mu))) = pi
    $


    $#ref(<range_of_args_of_reciprocal_of_complex_numbers>)$ より、

    $
      arg^((-pi, pi])(1/((gamma_2(-theta_(mu)))^2))
      &=
      cases(
        -arg^((-pi, pi])((gamma_2(-theta_(mu)))^2) & quad (-pi < arg^((-pi, pi])((gamma_2(-theta_(mu)))^2) < pi),
        pi & quad (arg^((-pi, pi])((gamma_2(-theta_(mu)))^2) = pi),
      )
      \
      &=
      cases(
        -arg^((-pi, pi])((gamma_2(-theta_(mu)))^2) & quad (arg^((-pi, pi])(gamma_2(-theta_(mu))) eq.not -pi/2 \, pi/2),
        pi & quad (arg^((-pi, pi])(gamma_2(-theta_(mu))) = -pi/2 \, pi/2),
      )
      \
      &=
      cases(
        -(
          cases(
            2 arg^((-pi, pi])(gamma_2(-theta_(mu))) + 2pi & quad (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= -pi/2),
            2 arg^((-pi, pi])(gamma_2(-theta_(mu))) & quad (-pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi/2),
            2 arg^((-pi, pi])(gamma_2(-theta_(mu))) - 2pi & quad (pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
          )
        )
        & quad (arg^((-pi, pi])(gamma_2(-theta_(mu))) eq.not -pi/2 \, pi/2),
        pi & quad (arg^((-pi, pi])(gamma_2(-theta_(mu))) = -pi/2 \, pi/2),
      )
      \
      &=
      cases(
        cases(
          -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) - 2pi & quad (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= -pi/2),
          -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) & quad (-pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi/2),
          -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) + 2pi & quad (pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
        )
        & quad (arg^((-pi, pi])(gamma_2(-theta_(mu))) eq.not -pi/2 \, pi/2),
        pi & quad (arg^((-pi, pi])(gamma_2(-theta_(mu))) = -pi/2 \, pi/2),
      )
      \
      &=
      cases(
        -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) - 2pi & quad (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) < -pi/2),
        -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) & quad (-pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi/2),
        -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) + 2pi & quad (pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
        pi & quad (arg^((-pi, pi])(gamma_2(-theta_(mu))) = -pi/2 \, pi/2),
      )
    $

    であるので、 

    $
      arg^((-pi, pi])(gamma_2(theta_(mu)) gamma_2(-theta_(mu)))
      +
      arg^((-pi, pi])(1/((gamma_2(-theta_(mu)))^2))
      &=
      pi
      +
      cases(
        -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) - 2pi & quad (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) < -pi/2),
        -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) & quad (-pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi/2),
        -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) + 2pi & quad (pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
        pi & quad (arg^((-pi, pi])(gamma_2(-theta_(mu))) = -pi/2 \, pi/2),
      )
      \
      &=
      cases(
        -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) - pi & quad (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) < -pi/2),
        -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) + pi & quad (-pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi/2),
        -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) + 3pi & quad (pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
        2pi & quad (arg^((-pi, pi])(gamma_2(-theta_(mu))) = -pi/2 \, pi/2),
      )
    $

    これと、

    $
      -pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) < -pi/2
      &<=>
      -2pi < 2 arg^((-pi, pi])(gamma_2(-theta_(mu))) <= -pi
      \
      &<=>
      pi <= -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) < 2pi
      \
      &<=>
      0 <= -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) - pi < pi
    $
    $
      -pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= 0 
      &<=>
      -pi < 2 arg^((-pi, pi])(gamma_2(-theta_(mu))) <= 0
      \
      &<=>
      0 <= -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi
      \
      &<=>
      pi < -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) + pi <= 2pi
    $
    $
      0 < arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi/2
      &<=>
      0 < 2 arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi
      \
      &<=>
      -pi < -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) < 0
      \
      &<=>
      0 < -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) + pi < pi
    $
    $
      pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi
      &<=>
      pi < 2 arg^((-pi, pi])(gamma_2(-theta_(mu))) <= 2pi
      \
      &<=>
      -2pi < -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) + 2pi <= -pi
      \
      &<=>
      pi < -2 arg^((-pi, pi])(gamma_2(-theta_(mu))) + 3pi <= 2pi
    $

    から、

    $
      cases(
        0 <= arg^((-pi, pi])(gamma_2(theta_(mu)) gamma_2(-theta_(mu))) + arg^((-pi, pi])(1/((gamma_2(-theta_(mu)))^2)) < pi
        & quad (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) < -pi/2),
        pi < arg^((-pi, pi])(gamma_2(theta_(mu)) gamma_2(-theta_(mu))) + arg^((-pi, pi])(1/((gamma_2(-theta_(mu)))^2)) <= 2pi
        & quad (-pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= 0),
        0 < arg^((-pi, pi])(gamma_2(theta_(mu)) gamma_2(-theta_(mu))) + arg^((-pi, pi])(1/((gamma_2(-theta_(mu)))^2)) < pi
        & quad (0 < arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi/2),
        pi < arg^((-pi, pi])(gamma_2(theta_(mu)) gamma_2(-theta_(mu))) + arg^((-pi, pi])(1/((gamma_2(-theta_(mu)))^2)) <= 2pi
        & quad (pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
        arg^((-pi, pi])(gamma_2(theta_(mu)) gamma_2(-theta_(mu))) + arg^((-pi, pi])(1/((gamma_2(-theta_(mu)))^2)) = 2pi
        & quad (arg^((-pi, pi])(gamma_2(-theta_(mu))) = -pi/2 \, pi/2),
      )
      \
      cases(
        0 <= arg^((-pi, pi])(gamma_2(theta_(mu)) gamma_2(-theta_(mu))) + arg^((-pi, pi])(1/((gamma_2(-theta_(mu)))^2)) < pi
        & quad (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) < -pi/2 or 0 < arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi/2),
        pi < arg^((-pi, pi])(gamma_2(theta_(mu)) gamma_2(-theta_(mu))) + arg^((-pi, pi])(1/((gamma_2(-theta_(mu)))^2)) <= 2pi
        & quad (-pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) <= 0 or pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
      )
    $

    $#ref(<condition_of_commutativity_of_sqrt_and_product>)$ より、

#note[
  $
    
    sqrt(z_1 z_2)
    &=
    cases(
      -sqrt(z_1) sqrt(z_2) &quad (-2pi < arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) <= -pi),
      sqrt(z_1) sqrt(z_2) &quad (-pi < arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) <= pi),
      -sqrt(z_1) sqrt(z_2) &quad (pi < arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) <= 2pi),
    )
    \
    sqrt(z_1) sqrt(z_2)
    &=
    cases(
      -sqrt(z_1 z_2) &quad (-2pi < arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) <= -pi),
      sqrt(z_1 z_2) &quad (-pi < arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) <= pi),
      -sqrt(z_1 z_2) &quad (pi < arg^((-pi, pi])(z_1) + arg^((-pi, pi])(z_2) <= 2pi),
    )
  $
]

    $
      sqrt(
        (
          gamma_2(theta_(mu))
          gamma_2(-theta_(mu))
        )
      )
      sqrt(
        1
        /
        (
          (
            gamma_2(-theta_(mu))
          )
          ^
          2
        )
      )
      &=
      cases(
        sqrt(
          (
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
          (
            1
            /
            (
              (
                gamma_2(-theta_(mu))
              )
              ^
              2
            )
          )
        )
        &quad (0 < arg^((-pi, pi])(gamma_2(theta_(mu)) gamma_2(-theta_(mu))) + arg^((-pi, pi])(1/((gamma_2(-theta_(mu)))^2)) < pi),
        -sqrt(
          (
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
          (
            1
            /
            (
              (
                gamma_2(-theta_(mu))
              )
              ^
              2
            )
          )
        )
        &quad (pi < arg^((-pi, pi])(gamma_2(theta_(mu)) gamma_2(-theta_(mu))) + arg^((-pi, pi])(1/((gamma_2(-theta_(mu)))^2)) <= 2pi),
      )
      \
      &=
      cases(
        sqrt(
          (gamma_2(theta_(mu)))
          /
          (gamma_2(-theta_(mu)))
        )
        &quad (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) < -pi/2 or 0 < arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi/2),
        -sqrt(
          (gamma_2(theta_(mu)))
          /
          (gamma_2(-theta_(mu)))
        )
        &quad (-pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) <= 0 or pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
      )
    $

    以上より、

    $
      (
        sqrt(
          -1
        )
        sqrt(
          gamma_2(theta_(mu))
          gamma_2(-theta_(mu))
        )
      )
      /
      (
        gamma_2(-theta_(mu))
      )
      &=
      cases(
        (
          sqrt(
            -1
          )
          sqrt(
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        )
        /
        (
          sqrt(
            (
              gamma_2(-theta_(mu))
            )
            ^
            2
          )
        )
        quad & (-pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi/2),
        (
          sqrt(
            -1
          )
          sqrt(
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        )
        /
        (
          -
          sqrt(
            (
              gamma_2(-theta_(mu))
            )
            ^
            2
          )
        )
        quad & (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= -pi/2 or pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
      )
      quad
      (because #ref(<square_of_sqrt>))
      \
      &=
      cases(
        sqrt(
          -1
        )
        (
          sqrt(
            (
              gamma_2(theta_(mu))
              gamma_2(-theta_(mu))
            )
          )
          sqrt(
            1
            /
            (
              (
                gamma_2(-theta_(mu))
              )
              ^
              2
            )
          )
        )
        quad & (-pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi/2),
        sqrt(
          -1
        )
        (
          sqrt(
            (
              gamma_2(theta_(mu))
              gamma_2(-theta_(mu))
            )
          )
          (
            -
            sqrt(
              1
              /
              (
                (
                  gamma_2(-theta_(mu))
                )
                ^
                2
              )
            )
          )
        )
        quad & (arg^((-pi, pi])(gamma_2(-theta_(mu))) = pi/2),
        -
        sqrt(
          -1
        )
        (
          sqrt(
            (
              gamma_2(theta_(mu))
              gamma_2(-theta_(mu))
            )
          )
          sqrt(
            1
            /
            (
              (
                gamma_2(-theta_(mu))
              )
              ^
              2
            )
          )
        )
        quad & (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) < -pi/2 or pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
        -
        sqrt(
          -1
        )
        (
          sqrt(
            (
              gamma_2(theta_(mu))
              gamma_2(-theta_(mu))
            )
          )
          (
            -
            sqrt(
              1
              /
              (
                (
                  gamma_2(-theta_(mu))
                )
                ^
                2
              )
            )
          )
        )
        quad & (arg^((-pi, pi])(gamma_2(-theta_(mu))) = -pi/2),
      )
      \
      &=
      cases(
        sqrt(
          -1
        )
        (
          sqrt(
            (
              gamma_2(theta_(mu))
              gamma_2(-theta_(mu))
            )
          )
          (
            sqrt(
              1
              /
              (
                (
                  gamma_2(-theta_(mu))
                )
                ^
                2
              )
            )
          )
        )
        quad & (-pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi/2),
        -
        sqrt(
          -1
        )
        (
          sqrt(
            (
              gamma_2(theta_(mu))
              gamma_2(-theta_(mu))
            )
          )
          (
            sqrt(
              1
              /
              (
                (
                  gamma_2(-theta_(mu))
                )
                ^
                2
              )
            )
          )
        )
        quad & (arg^((-pi, pi])(gamma_2(-theta_(mu))) = pi/2),
        -
        sqrt(
          -1
        )
        (
          sqrt(
            (
              gamma_2(theta_(mu))
              gamma_2(-theta_(mu))
            )
          )
          (
            sqrt(
              1
              /
              (
                (
                  gamma_2(-theta_(mu))
                )
                ^
                2
              )
            )
          )
        )
        quad & (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) < -pi/2 or pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
        sqrt(
          -1
        )
        (
          sqrt(
            (
              gamma_2(theta_(mu))
              gamma_2(-theta_(mu))
            )
          )
          (
            sqrt(
              1
              /
              (
                (
                  gamma_2(-theta_(mu))
                )
                ^
                2
              )
            )
          )
        )
        quad & (arg^((-pi, pi])(gamma_2(-theta_(mu))) = -pi/2),
      )
      \
      &=
      cases(
        sqrt(
          -1
        )
        (
          sqrt(
            (
              gamma_2(theta_(mu))
              gamma_2(-theta_(mu))
            )
          )
          (
            sqrt(
              1
              /
              (
                (
                  gamma_2(-theta_(mu))
                )
                ^
                2
              )
            )
          )
        )
        quad & (-pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi/2),
        -
        sqrt(
          -1
        )
        (
          sqrt(
            (
              gamma_2(theta_(mu))
              gamma_2(-theta_(mu))
            )
          )
          sqrt(
            1
            /
            (
              (
                gamma_2(-theta_(mu))
              )
              ^
              2
            )
          )
        )
        quad & (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) < -pi/2 or pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
      )
      \
      &=
      cases(
        sqrt(
          -1
        )
        (
          cases(
            sqrt(
              (gamma_2(theta_(mu)))
              /
              (gamma_2(-theta_(mu)))
            )
            &quad (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) < -pi/2 or 0 < arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi/2),
            -sqrt(
              (gamma_2(theta_(mu)))
              /
              (gamma_2(-theta_(mu)))
            )
            &quad (-pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) <= 0 or pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
          )
        )
        quad & (-pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi/2),
        -
        sqrt(
          -1
        )
        (
          cases(
            sqrt(
              (gamma_2(theta_(mu)))
              /
              (gamma_2(-theta_(mu)))
            )
            &quad (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) < -pi/2 or 0 < arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi/2),
            -sqrt(
              (gamma_2(theta_(mu)))
              /
              (gamma_2(-theta_(mu)))
            )
            &quad (-pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) <= 0 or pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
          )
        )
        quad & (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) < -pi/2 or pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
      )
      \
      &=
      cases(
        sqrt(
          -1
        )
        (
          cases(
            sqrt(
              (gamma_2(theta_(mu)))
              /
              (gamma_2(-theta_(mu)))
            )
            &quad (0 < arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi/2),
            -sqrt(
              (gamma_2(theta_(mu)))
              /
              (gamma_2(-theta_(mu)))
            )
            &quad (-pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) <= 0),
          )
        )
        quad & (-pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi/2),
        -
        sqrt(
          -1
        )
        (
          cases(
            sqrt(
              (gamma_2(theta_(mu)))
              /
              (gamma_2(-theta_(mu)))
            )
            &quad (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) < -pi/2),
            -sqrt(
              (gamma_2(theta_(mu)))
              /
              (gamma_2(-theta_(mu)))
            )
            &quad (pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
          )
        )
        quad & (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) < -pi/2 or pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
      )
      \
      &=
      cases(
        sqrt(
          -1
        )
        (
          sqrt(
            (gamma_2(theta_(mu)))
            /
            (gamma_2(-theta_(mu)))
          )
        )
        &quad (0 < arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi/2),
        sqrt(
          -1
        )
        (
          -sqrt(
            (gamma_2(theta_(mu)))
            /
            (gamma_2(-theta_(mu)))
          )
        )
        &quad (-pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) <= 0),
        -
        sqrt(
          -1
        )
        (
          sqrt(
            (gamma_2(theta_(mu)))
            /
            (gamma_2(-theta_(mu)))
          )
        )
        &quad (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) < -pi/2),
        -
        sqrt(
          -1
        )
        (
          -sqrt(
            (gamma_2(theta_(mu)))
            /
            (gamma_2(-theta_(mu)))
          )
        )
        &quad (pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
      )
      \
      &=
      cases(
        -
        sqrt(
          -1
        )
        (
          sqrt(
            (gamma_2(theta_(mu)))
            /
            (gamma_2(-theta_(mu)))
          )
        )
        &quad (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) < -pi/2),
        -
        sqrt(
          -1
        )
        (
          sqrt(
            (gamma_2(theta_(mu)))
            /
            (gamma_2(-theta_(mu)))
          )
        )
        &quad (-pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) <= 0),
        sqrt(
          -1
        )
        (
          sqrt(
            (gamma_2(theta_(mu)))
            /
            (gamma_2(-theta_(mu)))
          )
        )
        &quad (0 < arg^((-pi, pi])(gamma_2(-theta_(mu))) < pi/2),
        sqrt(
          -1
        )
        (
          sqrt(
            (gamma_2(theta_(mu)))
            /
            (gamma_2(-theta_(mu)))
          )
        )
        &quad (pi/2 <= arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
      )
      \
      &=
      cases(
        -
        sqrt(
          -1
        )
        (
          sqrt(
            (gamma_2(theta_(mu)))
            /
            (gamma_2(-theta_(mu)))
          )
        )
        &quad (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= 0),
        sqrt(
          -1
        )
        (
          sqrt(
            (gamma_2(theta_(mu)))
            /
            (gamma_2(-theta_(mu)))
          )
        )
        &quad (0 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
      )
    $

    ここで、

    $
      sqrt(
        (gamma_2(theta_(mu)))
        /
        (gamma_2(-theta_(mu)))
      )
      &=
      sqrt(
        (
          sqrt(-1) e^(sqrt(-1) theta_(mu)) s_2^* (c_1 cos(theta_(mu)) - sqrt(-1) sin(theta_(mu)) - s_1 c_2)
        )
        /
        (
          sqrt(-1) e^(-sqrt(-1) theta_(mu)) s_2^* (c_1 cos(-theta_(mu)) - sqrt(-1) sin(-theta_(mu)) - s_1 c_2)
        )
      )
      quad dots.c quad (R.1)
      \
      &=
      sqrt(
        (
          sqrt(-1) e^(sqrt(-1) theta_(mu)) (cosh(2 K_1) cos(theta_(mu)) - sqrt(-1) sin(theta_(mu)) - sinh(2 K_1) cosh(2 K_2))
        )
        /
        (
          sqrt(-1) e^(-sqrt(-1) theta_(mu)) (cosh(2 K_1) cos(-theta_(mu)) - sqrt(-1) sin(-theta_(mu)) - sinh(2 K_1) cosh(2 K_2))
        )
      )
      quad dots.c quad (R.2)
      \
      &=
      sqrt(
        (
          e^(sqrt(-1) theta_(mu))
          (
            (e^(2 K_1) + e^(-2 K_1))/2
            (e^(sqrt(-1) theta_(mu)) + e^(-sqrt(-1) theta_(mu)))/2
            -
            sqrt(-1)
            (e^(sqrt(-1) theta_(mu)) - e^(-sqrt(-1) theta_(mu)))/(2 sqrt(-1))
            -
            (e^(2 K_1) - e^(-2 K_1))/2
            (e^(2 K_2) + e^(-2 K_2))/2
          )
        )
        /
        (
          e^(-sqrt(-1) theta_(mu))
          (
            (e^(2 K_1) + e^(-2 K_1))/2
            (e^(-sqrt(-1) theta_(mu)) + e^(sqrt(-1) theta_(mu)))/2
            -
            sqrt(-1)
            (e^(-sqrt(-1) theta_(mu)) - e^(sqrt(-1) theta_(mu)))/(2 sqrt(-1))
            -
            (e^(2 K_1) - e^(-2 K_1))/2
            (e^(2 K_2) + e^(-2 K_2))/2
          )
        )
      )
      quad dots.c quad (R.3)
      \
      &=
      sqrt(
        (
          e^(sqrt(-1) theta_(mu))
          (
            (e^(2 K_1) + e^(-2 K_1))
            (e^(sqrt(-1) theta_(mu)) + e^(-sqrt(-1) theta_(mu)))
            -
            2(e^(sqrt(-1) theta_(mu)) - e^(-sqrt(-1) theta_(mu)))
            -
            (e^(2 K_1) - e^(-2 K_1))
            (e^(2 K_2) + e^(-2 K_2))
          )
        )
        /
        (
          e^(-sqrt(-1) theta_(mu))
          (
            (e^(2 K_1) + e^(-2 K_1))
            (e^(-sqrt(-1) theta_(mu)) + e^(sqrt(-1) theta_(mu)))
            -
            2(e^(-sqrt(-1) theta_(mu)) - e^(sqrt(-1) theta_(mu)))
            -
            (e^(2 K_1) - e^(-2 K_1))
            (e^(2 K_2) + e^(-2 K_2))
          )
        )
      )
      quad dots.c quad (R.4)
      \
      &=
      sqrt(
        (
          e^(sqrt(-1) theta_(mu))
          (
            (e^(2 K_1) + e^(-2 K_1))
            e^(sqrt(-1) theta_(mu))
            +
            (e^(2 K_1) + e^(-2 K_1))
            e^(-sqrt(-1) theta_(mu))
            -
            2
            e^(sqrt(-1) theta_(mu))
            +
            2
            e^(-sqrt(-1) theta_(mu))
            -
            (e^(2 K_1) - e^(-2 K_1))
            (e^(2 K_2) + e^(-2 K_2))
          )
        )
        /
        (
          e^(-sqrt(-1) theta_(mu))
          (
            (e^(2 K_1) + e^(-2 K_1))
            e^(-sqrt(-1) theta_(mu))
            +
            (e^(2 K_1) + e^(-2 K_1))
            e^(sqrt(-1) theta_(mu))
            -
            2
            e^(-sqrt(-1) theta_(mu))
            +
            2
            e^(sqrt(-1) theta_(mu))
            -
            (e^(2 K_1) - e^(-2 K_1))
            (e^(2 K_2) + e^(-2 K_2))
          )
        )
      )
      quad dots.c quad (R.5)
      \
      &=
      sqrt(
        (
          (
            (e^(2 K_1) + e^(-2 K_1))
            e^(sqrt(-1) theta_(mu))
            e^(sqrt(-1) theta_(mu))
            +
            (e^(2 K_1) + e^(-2 K_1))
            e^(-sqrt(-1) theta_(mu))
            e^(sqrt(-1) theta_(mu))
            -
            2
            e^(sqrt(-1) theta_(mu))
            e^(sqrt(-1) theta_(mu))
            +
            2
            e^(-sqrt(-1) theta_(mu))
            e^(sqrt(-1) theta_(mu))
            -
            (e^(2 K_1) - e^(-2 K_1))
            (e^(2 K_2) + e^(-2 K_2))
            e^(sqrt(-1) theta_(mu))
          )
        )
        /
        (
          (
            (e^(2 K_1) + e^(-2 K_1))
            e^(-sqrt(-1) theta_(mu))
            e^(-sqrt(-1) theta_(mu))
            +
            (e^(2 K_1) + e^(-2 K_1))
            e^(sqrt(-1) theta_(mu))
            e^(-sqrt(-1) theta_(mu))
            -
            2
            e^(-sqrt(-1) theta_(mu))
            e^(-sqrt(-1) theta_(mu))
            +
            2
            e^(sqrt(-1) theta_(mu))
            e^(-sqrt(-1) theta_(mu))
            -
            (e^(2 K_1) - e^(-2 K_1))
            (e^(2 K_2) + e^(-2 K_2))
            e^(-sqrt(-1) theta_(mu))
          )
        )
      )
      quad dots.c quad (R.6)
      \
      &=
      sqrt(
        (
          (e^(2 K_1) + e^(-2 K_1))
          e^(2 sqrt(-1) theta_(mu))
          +
          (e^(2 K_1) + e^(-2 K_1))
          -
          2
          e^(2 sqrt(-1) theta_(mu))
          +
          2
          -
          (e^(2 K_1) - e^(-2 K_1))
          (e^(2 K_2) + e^(-2 K_2))
          e^(sqrt(-1) theta_(mu))
        )
        /
        (
          (e^(2 K_1) + e^(-2 K_1))
          e^(-2 sqrt(-1) theta_(mu))
          +
          (e^(2 K_1) + e^(-2 K_1))
          -
          2
          e^(-2 sqrt(-1) theta_(mu))
          +
          2
          -
          (e^(2 K_1) - e^(-2 K_1))
          (e^(2 K_2) + e^(-2 K_2))
          e^(-sqrt(-1) theta_(mu))
        )
      )
      quad dots.c quad (R.7)
      \
      &=
      sqrt(
        (
          (
            e^(2 K_1)
            +
            e^(-2 K_1)
            -
            2
          )
          e^(2 sqrt(-1) theta_(mu))
          -
          (e^(2 K_1) - e^(-2 K_1))
          (e^(2 K_2) + e^(-2 K_2))
          e^(sqrt(-1) theta_(mu))
          +
          (
            e^(2 K_1)
            +
            e^(-2 K_1)
            +
            2
          )
        )
        /
        (
          (
            e^(2 K_1)
            +
            e^(-2 K_1)
            -
            2
          )
          e^(-2 sqrt(-1) theta_(mu))
          -
          (e^(2 K_1) - e^(-2 K_1))
          (e^(2 K_2) + e^(-2 K_2))
          e^(-sqrt(-1) theta_(mu))
          +
          (
            e^(2 K_1)
            +
            e^(-2 K_1)
            +
            2
          )
        )
      )
      quad dots.c quad (R.8)
    $

    また、

    $
      a(theta_mu)
      &=
      sqrt(
        (
          (1 - alpha_1 e^(sqrt(-1) theta_mu))
        )
        /
        (
          (1 - alpha_1 e^(-sqrt(-1) theta_mu))
        )
        dot.c
        (
          (1 - alpha_2^(-1) e^(sqrt(-1) theta_mu))
        )
        /
        (
          (1 - alpha_2^(-1) e^(-sqrt(-1) theta_mu))
        )
      )
      quad dots.c quad (L.1)
      \
      &=
      sqrt(
        (
          (1 - (tanh K_1 tanh K_2^*) e^(sqrt(-1) theta_mu))
        )
        /
        (
          (1 - (tanh K_1 tanh K_2^*) e^(-sqrt(-1) theta_mu))
        )
        dot.c
        (
          (1 - ((tanh K_1)^(-1) tanh K_2^*)^(-1) e^(sqrt(-1) theta_mu))
        )
        /
        (
          (1 - ((tanh K_1)^(-1) tanh K_2^*)^(-1) e^(-sqrt(-1) theta_mu))
        )
      )
      quad dots.c quad (L.2)
      \
      &=
      sqrt(
        (
          (1 - (tanh K_1 tanh K_2^*) e^(sqrt(-1) theta_mu))
        )
        /
        (
          (1 - (tanh K_1 tanh K_2^*) e^(-sqrt(-1) theta_mu))
        )
        dot.c
        (
          (1 - (tanh K_1 (tanh K_2^*)^(-1)) e^(sqrt(-1) theta_mu))
        )
        /
        (
          (1 - (tanh K_1 (tanh K_2^*)^(-1)) e^(-sqrt(-1) theta_mu))
        )
      )
      quad dots.c quad (L.3)
      \
      &=
      sqrt(
        (
          (1 - (tanh K_1 tanh K_2^*) e^(sqrt(-1) theta_mu))
        )
        /
        (
          (1 - (tanh K_1 tanh K_2^*) e^(-sqrt(-1) theta_mu))
        )
        dot.c
        (
          (tanh K_2^* - (tanh K_1) e^(sqrt(-1) theta_mu))
        )
        /
        (
          (tanh K_2^* - (tanh K_1) e^(-sqrt(-1) theta_mu))
        )
      )
      quad dots.c quad (L.4)
      \
      &=
      sqrt(
        (
          (1 - (tanh K_1 tanh K_2^*) e^(sqrt(-1) theta_mu))
        )
        /
        (
          (1 - (tanh K_1 tanh K_2^*) e^(-sqrt(-1) theta_mu))
        )
        dot.c
        (
          (tanh K_2^* - (tanh K_1) e^(sqrt(-1) theta_mu))
        )
        /
        (
          (tanh K_2^* - (tanh K_1) e^(-sqrt(-1) theta_mu))
        )
      )
      quad dots.c quad (L.5)
      // \
      // &=
      // sqrt(
      //   (
      //     (1 - ((e^(K_1) - e^(-K_1))/(e^(K_1) + e^(-K_1)) (e^(K_2^*) - e^(-K_2^*))/(e^(K_2^*) + e^(K_2^*))) e^(sqrt(-1) theta_mu))
      //   )
      //   /
      //   (
      //     (1 - ((e^(K_1) - e^(-K_1))/(e^(K_1) + e^(-K_1)) (e^(K_2^*) - e^(-K_2^*))/(e^(K_2^*) + e^(K_2^*))) e^(-sqrt(-1) theta_mu))
      //   )
      //   dot.c
      //   (
      //     ((e^(K_2^*) - e^(-K_2^*))/(e^(K_2^*) + e^(K_2^*)) - (e^(K_1) - e^(-K_1))/(e^(K_1) + e^(-K_1)) e^(sqrt(-1) theta_mu))
      //   )
      //   /
      //   (
      //     ((e^(K_2^*) - e^(-K_2^*))/(e^(K_2^*) + e^(K_2^*)) - (e^(K_1) - e^(-K_1))/(e^(K_1) + e^(-K_1)) e^(-sqrt(-1) theta_mu))
      //   )
      // )
      // \
      // &=
      // sqrt(
      //   (
      //     (e^(K_1) + e^(-K_1))
      //     (e^(K_2^*) + e^(-K_2^*))
      //     -
      //     (e^(K_1) - e^(-K_1))
      //     (e^(K_2^*) - e^(-K_2^*))
      //     e^(sqrt(-1) theta_mu)
      //   )
      //   /
      //   (
      //     (e^(K_1) + e^(-K_1))
      //     (e^(K_2^*) + e^(-K_2^*))
      //     -
      //     (e^(K_1) - e^(-K_1))
      //     (e^(K_2^*) - e^(-K_2^*))
      //     e^(-sqrt(-1) theta_mu)
      //   )
      //   dot.c
      //   (
      //     (e^(K_1) + e^(-K_1))
      //     (e^(K_2^*) - e^(-K_2^*))
      //     -
      //     (e^(K_1) - e^(-K_1))
      //     (e^(K_2^*) - e^(-K_2^*))
      //     e^(sqrt(-1) theta_mu)
      //   )
      //   /
      //   (
      //     (e^(K_1) + e^(-K_1))
      //     (e^(K_2^*) - e^(-K_2^*))
      //     -
      //     (e^(K_1) - e^(-K_1))
      //     (e^(K_2^*) - e^(-K_2^*))
      //     e^(-sqrt(-1) theta_mu)
      //   )
      // )
      // \
      // &=
      // sqrt(
      //   (
      //     (e^(K_1) + e^(-K_1))
      //     (e^(K_2^*) + e^(-K_2^*))
      //     e^(sqrt(-1) theta_mu)
      //     -
      //     (e^(K_1) - e^(-K_1))
      //     (e^(K_2^*) - e^(-K_2^*))
      //     e^(2 sqrt(-1) theta_mu)
      //   )
      //   /
      //   (
      //     (e^(K_1) + e^(-K_1))
      //     (e^(K_2^*) + e^(-K_2^*))
      //     e^(sqrt(-1) theta_mu)
      //     -
      //     (e^(K_1) - e^(-K_1))
      //     (e^(K_2^*) - e^(-K_2^*))
      //   )
      //   dot.c
      //   (
      //     (e^(K_1) + e^(-K_1))
      //     (e^(K_2^*) - e^(-K_2^*))
      //     e^(sqrt(-1) theta_mu)
      //     -
      //     (e^(K_1) - e^(-K_1))
      //     (e^(K_2^*) - e^(-K_2^*))
      //     e^(2 sqrt(-1) theta_mu)
      //   )
      //   /
      //   (
      //     (e^(K_1) + e^(-K_1))
      //     (e^(K_2^*) - e^(-K_2^*))
      //     e^(sqrt(-1) theta_mu)
      //     -
      //     (e^(K_1) - e^(-K_1))
      //     (e^(K_2^*) - e^(-K_2^*))
      //   )
      // )
    $

    ここで、

    $
      K_2^* :&= -1/2 log(tanh K_2)
      \
      K_2^* &= -1/2 log(tanh K_2)
      \
      -2 K_2^* &= log(tanh K_2)
      \
      e^(-2 K_2^*) &= tanh K_2
      \
      e^(K_2^*) &= (tanh K_2)^(-1/2)
      \
      e^(-K_2^*) &= (tanh K_2)^(1/2)
    $

    より、
    $
      tanh(K_2^*) &= (e^(K_2^*) - e^(-K_2^*)) / (e^(K_2^*) + e^(-K_2^*)) \
      \
      &=
      ((tanh K_2)^(-1/2) - (tanh K_2)^(1/2)) / ((tanh K_2)^(-1/2) + (tanh K_2)^(1/2))
      \
      &=
      (
        (tanh K_2)^(1/2) ((tanh K_2)^(-1/2) - (tanh K_2)^(1/2))
      )
      /
      (
        (tanh K_2)^(1/2) ((tanh K_2)^(-1/2) + (tanh K_2)^(1/2))
      )
      \
      &=
      (
        1 - tanh K_2
      )
      /
      (
        1 + tanh K_2
      )
      \
      &=
      (
        1 - (e^(K_2) - e^(-K_2))/(e^(K_2) + e^(-K_2))
      )
      /
      (
        1 + (e^(K_2) - e^(-K_2))/(e^(K_2) + e^(-K_2))
      )
      \
      &=
      (
        (e^(K_2) + e^(-K_2)) (1 - (e^(K_2) - e^(-K_2))/(e^(K_2) + e^(-K_2)))
      )
      /
      (
        (e^(K_2) + e^(-K_2)) (1 + (e^(K_2) - e^(-K_2))/(e^(K_2) + e^(-K_2)))
      )
      \
      &=
      (
        (e^(K_2) + e^(-K_2)) - (e^(K_2) - e^(-K_2))
      )
      /
      (
        (e^(K_2) + e^(-K_2)) + (e^(K_2) - e^(-K_2))
      )
      \
      &=
      (
        2 e^(-K_2)
      )
      /
      (
        2 e^(K_2)
      )
      \
      &=
      (e^(-K_2))/(e^(K_2))
      \
      &=
      e^(-2 K_2)
    $

    これと、

    $
      tanh(K_1) &= (e^(K_1) - e^(-K_1)) / (e^(K_1) + e^(-K_1))
      \
      &=
      (
        e^(K_1) (e^(K_1) - e^(-K_1))
      )
      /
      (
        e^(K_1) (e^(K_1) + e^(-K_1))
      )
      \
      &=
      (e^(2 K_1) - 1)/(e^(2 K_1) + 1)
    $


    を用いて

    $
      (L.5)
      &=
      sqrt(
        (
          (1 - (tanh K_1 tanh K_2^*) e^(sqrt(-1) theta_mu))
        )
        /
        (
          (1 - (tanh K_1 tanh K_2^*) e^(-sqrt(-1) theta_mu))
        )
        dot.c
        (
          (tanh K_2^* - (tanh K_1) e^(sqrt(-1) theta_mu))
        )
        /
        (
          (tanh K_2^* - (tanh K_1) e^(-sqrt(-1) theta_mu))
        )
      )
      quad dots.c quad (L.6)
      \
      &=
      sqrt(
        (
          (1 - ((e^(2 K_1) - 1)/(e^(2 K_1) + 1) e^(-2 K_2)) e^(sqrt(-1) theta_mu))
        )
        /
        (
          (1 - ((e^(2 K_1) - 1)/(e^(2 K_1) + 1) e^(-2 K_2)) e^(-sqrt(-1) theta_mu))
        )
        dot.c
        (
          (e^(-2 K_2) - ((e^(2 K_1) - 1)/(e^(2 K_1) + 1)) e^(sqrt(-1) theta_mu))
        )
        /
        (
          (e^(-2 K_2) - ((e^(2 K_1) - 1)/(e^(2 K_1) + 1)) e^(-sqrt(-1) theta_mu))
        )
      )
      quad dots.c quad (L.7)
      \
      &=
      sqrt(
        (
          (e^(2 K_1) + 1) (1 - ((e^(2 K_1) - 1)/(e^(2 K_1) + 1) e^(-2 K_2)) e^(sqrt(-1) theta_mu))
        )
        /
        (
          (e^(2 K_1) + 1) (1 - ((e^(2 K_1) - 1)/(e^(2 K_1) + 1) e^(-2 K_2)) e^(-sqrt(-1) theta_mu))
        )
        dot.c
        (
          (e^(2 K_1) + 1) (e^(-2 K_2) - ((e^(2 K_1) - 1)/(e^(2 K_1) + 1)) e^(sqrt(-1) theta_mu))
        )
        /
        (
          (e^(2 K_1) + 1) (e^(-2 K_2) - ((e^(2 K_1) - 1)/(e^(2 K_1) + 1)) e^(-sqrt(-1) theta_mu))
        )
      )
      quad dots.c quad (L.8)
      \
      &=
      sqrt(
        (
          ((e^(2 K_1) + 1) - ((e^(2 K_1) - 1) e^(-2 K_2)) e^(sqrt(-1) theta_mu))
        )
        /
        (
          ((e^(2 K_1) + 1) - ((e^(2 K_1) - 1) e^(-2 K_2)) e^(-sqrt(-1) theta_mu))
        )
        dot.c
        (
          ((e^(2 K_1) + 1) e^(-2 K_2) - (e^(2 K_1) - 1) e^(sqrt(-1) theta_mu))
        )
        /
        (
          ((e^(2 K_1) + 1) e^(-2 K_2) - (e^(2 K_1) - 1) e^(-sqrt(-1) theta_mu))
        )
      )
      quad dots.c quad (L.9)
      \
      &=
      sqrt(
        (
          (e^(2 K_1) + 1) - (e^(2 K_1) e^(-2 K_2) - e^(-2 K_2)) e^(sqrt(-1) theta_mu)
        )
        /
        (
          (e^(2 K_1) + 1) - (e^(2 K_1) e^(-2 K_2) - e^(-2 K_2)) e^(-sqrt(-1) theta_mu)
        )
        dot.c
        (
          e^(2 K_1) e^(-2 K_2) + e^(-2 K_2) - (e^(2 K_1) - 1) e^(sqrt(-1) theta_mu)
        )
        /
        (
          e^(2 K_1) e^(-2 K_2) + e^(-2 K_2) - (e^(2 K_1) - 1) e^(-sqrt(-1) theta_mu)
        )
      )
      quad dots.c quad (L.10)
      \
      &=
      sqrt(
        (
          (
            (e^(2 K_1) + 1)
            -
            (e^(2 K_1) e^(-2 K_2) - e^(-2 K_2)) e^(sqrt(-1) theta_mu)
          )
          dot.c
          (
            (e^(2 K_1) e^(-2 K_2) + e^(-2 K_2))
            -
            (e^(2 K_1) - 1) e^(sqrt(-1) theta_mu)
          )
        )
        /
        (
          (
            (e^(2 K_1) + 1)
            -
            (e^(2 K_1) e^(-2 K_2) - e^(-2 K_2)) e^(-sqrt(-1) theta_mu)
          )
          dot.c
          (
            (e^(2 K_1) e^(-2 K_2) + e^(-2 K_2))
            -
            (e^(2 K_1) - 1) e^(-sqrt(-1) theta_mu)
          )
        )
      )
      quad dots.c quad (L.11)
      \
      &=
      sqrt(
        (
          (e^(2 K_1) + 1)
          dot.c
          (
            (e^(2 K_1) e^(-2 K_2) + e^(-2 K_2))
            -
            (e^(2 K_1) - 1) e^(sqrt(-1) theta_mu)
          )
          -
          (e^(2 K_1) e^(-2 K_2) - e^(-2 K_2)) e^(sqrt(-1) theta_mu)
          dot.c
          (
            (e^(2 K_1) e^(-2 K_2) + e^(-2 K_2))
            -
            (e^(2 K_1) - 1) e^(sqrt(-1) theta_mu)
          )
        )
        /
        (
          (e^(2 K_1) + 1)
          dot.c
          (
            (e^(2 K_1) e^(-2 K_2) + e^(-2 K_2))
            -
            (e^(2 K_1) - 1) e^(-sqrt(-1) theta_mu)
          )
          -
          (e^(2 K_1) e^(-2 K_2) - e^(-2 K_2)) e^(-sqrt(-1) theta_mu)
          dot.c
          (
            (e^(2 K_1) e^(-2 K_2) + e^(-2 K_2))
            -
            (e^(2 K_1) - 1) e^(-sqrt(-1) theta_mu)
          )
        )
      )
      quad dots.c quad (L.12)
      \
      &=
      sqrt(
        (
          (e^(2 K_1) + 1)
          dot.c
          (
            e^(-2 K_2) (e^(2 K_1) + 1)
            -
            (e^(2 K_1) - 1) e^(sqrt(-1) theta_mu)
          )
          -
          e^(-2 K_2) (e^(2 K_1) - 1) e^(sqrt(-1) theta_mu)
          dot.c
          (
            e^(-2 K_2) (e^(2 K_1) + 1)
            -
            (e^(2 K_1) - 1) e^(sqrt(-1) theta_mu)
          )
        )
        /
        (
          (e^(2 K_1) + 1)
          dot.c
          (
            e^(-2 K_2) (e^(2 K_1) + 1)
            -
            (e^(2 K_1) - 1) e^(-sqrt(-1) theta_mu)
          )
          -
          e^(-2 K_2) (e^(2 K_1) - 1) e^(-sqrt(-1) theta_mu)
          dot.c
          (
            e^(-2 K_2) (e^(2 K_1) + 1)
            -
            (e^(2 K_1) - 1) e^(-sqrt(-1) theta_mu)
          )
        )
      )
      quad dots.c quad (L.13)
      \
      &=
      sqrt(
        (          
          (
            e^(-2 K_2) (e^(2 K_1) + 1) (e^(2 K_1) + 1)
            -
            (e^(2 K_1) - 1) (e^(2 K_1) + 1) e^(sqrt(-1) theta_mu)
          )
          -
          (
            e^(-2 K_2) e^(-2 K_2) (e^(2 K_1) + 1) (e^(2 K_1) - 1) e^(sqrt(-1) theta_mu)
            -
            e^(-2 K_2) (e^(2 K_1) - 1) (e^(2 K_1) - 1) e^(sqrt(-1) theta_mu) e^(sqrt(-1) theta_mu)
          )
        )
        /
        (
          (
            e^(-2 K_2) (e^(2 K_1) + 1) (e^(2 K_1) + 1)
            -
            (e^(2 K_1) - 1) (e^(2 K_1) + 1) e^(-sqrt(-1) theta_mu)
          )
          -
          (
            e^(-2 K_2) e^(-2 K_2) (e^(2 K_1) + 1) (e^(2 K_1) - 1) e^(-sqrt(-1) theta_mu)
            -
            e^(-2 K_2) (e^(2 K_1) - 1) (e^(2 K_1) - 1) e^(-sqrt(-1) theta_mu) e^(-sqrt(-1) theta_mu)
          )
        )
      )
      quad dots.c quad (L.14)
      \
      &=
      sqrt(
        (          
          e^(-2 K_2) (e^(2 K_1) + 1) (e^(2 K_1) + 1)
          -
          (e^(2 K_1) - 1) (e^(2 K_1) + 1) e^(sqrt(-1) theta_mu)
          -
          e^(-2 K_2) e^(-2 K_2) (e^(2 K_1) + 1) (e^(2 K_1) - 1) e^(sqrt(-1) theta_mu)
          +
          e^(-2 K_2) (e^(2 K_1) - 1) (e^(2 K_1) - 1) e^(sqrt(-1) theta_mu) e^(sqrt(-1) theta_mu)
        )
        /
        (
          e^(-2 K_2) (e^(2 K_1) + 1) (e^(2 K_1) + 1)
          -
          (e^(2 K_1) - 1) (e^(2 K_1) + 1) e^(-sqrt(-1) theta_mu)
          -
          e^(-2 K_2) e^(-2 K_2) (e^(2 K_1) + 1) (e^(2 K_1) - 1) e^(-sqrt(-1) theta_mu)
          +
          e^(-2 K_2) (e^(2 K_1) - 1) (e^(2 K_1) - 1) e^(-sqrt(-1) theta_mu) e^(-sqrt(-1) theta_mu)
        )
      )
      quad dots.c quad (L.15)
      \
      &=
      sqrt(
        (          
          e^(-2 K_2) (e^(2 K_1) + 1) (e^(2 K_1) + 1)
          -
          (
            (e^(2 K_1) - 1) (e^(2 K_1) + 1) 
            +
            e^(-2 K_2) e^(-2 K_2) (e^(2 K_1) + 1) (e^(2 K_1) - 1)
          )
          e^(sqrt(-1) theta_mu)
          +
          e^(-2 K_2) (e^(2 K_1) - 1) (e^(2 K_1) - 1) e^(2 sqrt(-1) theta_mu)
        )
        /
        (
          e^(-2 K_2) (e^(2 K_1) + 1) (e^(2 K_1) + 1)
          -
          (
            (e^(2 K_1) - 1) (e^(2 K_1) + 1)
            +
            e^(-2 K_2) e^(-2 K_2) (e^(2 K_1) + 1) (e^(2 K_1) - 1)
          )
          e^(-sqrt(-1) theta_mu)
          +
          e^(-2 K_2) (e^(2 K_1) - 1) (e^(2 K_1) - 1) e^(-2 sqrt(-1) theta_mu)
        )
      )
      quad dots.c quad (L.16)
      \
      &=
      sqrt(
        (          
          e^(-2 K_2) (e^(2 K_1) + 1) (e^(2 K_1) + 1)
          -
          (
            (e^(2 K_1) - 1) (e^(2 K_1) + 1) 
            +
            e^(-2 K_2) e^(-2 K_2) (e^(2 K_1) + 1) (e^(2 K_1) - 1)
          )
          e^(sqrt(-1) theta_mu)
          +
          e^(-2 K_2) (e^(2 K_1) - 1) (e^(2 K_1) - 1)
          e^(2 sqrt(-1) theta_mu)
        )
        /
        (
          e^(-2 K_2) (e^(2 K_1) + 1) (e^(2 K_1) + 1)
          -
          (
            (e^(2 K_1) - 1) (e^(2 K_1) + 1)
            +
            e^(-2 K_2) e^(-2 K_2) (e^(2 K_1) + 1) (e^(2 K_1) - 1)
          )
          e^(-sqrt(-1) theta_mu)
          +
          e^(-2 K_2) (e^(2 K_1) - 1) (e^(2 K_1) - 1)
          e^(-2 sqrt(-1) theta_mu)
        )
      )
      quad dots.c quad (L.17)
      \
      &=
      sqrt(
        (          
          (e^(2 K_1) + 1) (e^(2 K_1) + 1)
          -
          (
            e^(2 K_2)
            (e^(2 K_1) - 1) (e^(2 K_1) + 1) 
            +
            e^(-2 K_2) (e^(2 K_1) + 1) (e^(2 K_1) - 1)
          )
          e^(sqrt(-1) theta_mu)
          +
          (e^(2 K_1) - 1) (e^(2 K_1) - 1)
          e^(2 sqrt(-1) theta_mu)
        )
        /
        (
          (e^(2 K_1) + 1) (e^(2 K_1) + 1)
          -
          (
            e^(2 K_2)
            (e^(2 K_1) - 1) (e^(2 K_1) + 1)
            +
            e^(-2 K_2) (e^(2 K_1) + 1) (e^(2 K_1) - 1)
          )
          e^(-sqrt(-1) theta_mu)
          +
          (e^(2 K_1) - 1) (e^(2 K_1) - 1)
          e^(-2 sqrt(-1) theta_mu)
        )
      )
      quad dots.c quad (L.18)
      \
      &=
      sqrt(
        (          
          (e^(2 K_1) + 1) (e^(2 K_1) + 1)
          -
          (e^(2 K_2) + e^(-2 K_2))
          (e^(2 K_1) + 1) (e^(2 K_1) - 1) 
          e^(sqrt(-1) theta_mu)
          +
          (e^(2 K_1) - 1) (e^(2 K_1) - 1)
          e^(2 sqrt(-1) theta_mu)
        )
        /
        (
          (e^(2 K_1) + 1) (e^(2 K_1) + 1)
          -
          (e^(2 K_2) + e^(-2 K_2))
          (e^(2 K_1) + 1) (e^(2 K_1) - 1)
          e^(-sqrt(-1) theta_mu)
          +
          (e^(2 K_1) - 1) (e^(2 K_1) - 1)
          e^(-2 sqrt(-1) theta_mu)
        )
      )
      quad dots.c quad (L.19)
      \
      &=
      sqrt(
        (          
          (e^(2 K_1) + 1) (e^(2 K_1) + 1)
          -
          (e^(2 K_2) + e^(-2 K_2))
          ((e^(2 K_1))^2 - 1)
          e^(sqrt(-1) theta_mu)
          +
          (e^(2 K_1) - 1) (e^(2 K_1) - 1)
          e^(2 sqrt(-1) theta_mu)
        )
        /
        (
          (e^(2 K_1) + 1) (e^(2 K_1) + 1)
          -
          (e^(2 K_2) + e^(-2 K_2))
          ((e^(2 K_1))^2 - 1)
          e^(-sqrt(-1) theta_mu)
          +
          (e^(2 K_1) - 1) (e^(2 K_1) - 1)
          e^(-2 sqrt(-1) theta_mu)
        )
      )
      quad dots.c quad (L.20)
      \
      &=
      sqrt(
        (          
          (e^(2 K_1) - 1) (e^(2 K_1) - 1)
          e^(2 sqrt(-1) theta_mu)
          -
          (e^(2 K_2) + e^(-2 K_2))
          ((e^(2 K_1))^2 - 1)
          e^(sqrt(-1) theta_mu)
          +
          (e^(2 K_1) + 1) (e^(2 K_1) + 1)
        )
        /
        (
          (e^(2 K_1) - 1) (e^(2 K_1) - 1)
          e^(-2 sqrt(-1) theta_mu)
          -
          (e^(2 K_2) + e^(-2 K_2))
          ((e^(2 K_1))^2 - 1)
          e^(-sqrt(-1) theta_mu)
          +
          (e^(2 K_1) + 1) (e^(2 K_1) + 1)
        )
      )
      quad dots.c quad (L.21)
      \
      &=
      sqrt(
        (          
          e^(-2 K_1) (e^(2 K_1) - 1) (e^(2 K_1) - 1)
          e^(2 sqrt(-1) theta_mu)
          -
          (e^(2 K_2) + e^(-2 K_2))
          (e^(2 K_1) - e^(-2 K_1))
          e^(sqrt(-1) theta_mu)
          +
          e^(-2 K_1)
          (e^(2 K_1) + 1) (e^(2 K_1) + 1)
        )
        /
        (
          e^(-2 K_1)
          (e^(2 K_1) - 1) (e^(2 K_1) - 1)
          e^(-2 sqrt(-1) theta_mu)
          -
          (e^(2 K_2) + e^(-2 K_2))
          (e^(2 K_1) - e^(-2 K_1))
          e^(-sqrt(-1) theta_mu)
          +
          e^(-2 K_1)
          (e^(2 K_1) + 1) (e^(2 K_1) + 1)
        )
      )
      quad dots.c quad (L.22)
      \
      &=
      sqrt(
        (          
          e^(-2 K_1)
          ((e^(2 K_1))^2 - 2 e^(2 K_1) + 1)
          e^(2 sqrt(-1) theta_mu)
          -
          (e^(2 K_2) + e^(-2 K_2))
          (e^(2 K_1) - e^(-2 K_1))
          e^(sqrt(-1) theta_mu)
          +
          e^(-2 K_1)
          ((e^(2 K_1))^2 + 2 e^(2 K_1) + 1)
        )
        /
        (
          e^(-2 K_1)
          ((e^(2 K_1))^2 - 2 e^(2 K_1) + 1)
          e^(-2 sqrt(-1) theta_mu)
          -
          (e^(2 K_2) + e^(-2 K_2))
          (e^(2 K_1) - e^(-2 K_1))
          e^(-sqrt(-1) theta_mu)
          +
          e^(-2 K_1)
          ((e^(2 K_1))^2 + 2 e^(2 K_1) + 1)
        )
      )
      quad dots.c quad (L.23)
      \
      &=
      sqrt(
        (          
          (e^(2 K_1) - 2 + e^(-2 K_1))
          e^(2 sqrt(-1) theta_mu)
          -
          (e^(2 K_2) + e^(-2 K_2))
          (e^(2 K_1) - e^(-2 K_1))
          e^(sqrt(-1) theta_mu)
          +
          (e^(2 K_1) + 2 + e^(-2 K_1))
        )
        /
        (
          (e^(2 K_1) - 2 + e^(-2 K_1))
          e^(-2 sqrt(-1) theta_mu)
          -
          (e^(2 K_2) + e^(-2 K_2))
          (e^(2 K_1) - e^(-2 K_1))
          e^(-sqrt(-1) theta_mu)
          +
          (e^(2 K_1) + 2 + e^(-2 K_1))
        )
      )
      quad dots.c quad (L.23)
      \
      &=
      sqrt(
        (          
          (e^(2 K_1) + e^(-2 K_1) - 2)
          e^(2 sqrt(-1) theta_mu)
          -
          (e^(2 K_2) + e^(-2 K_2))
          (e^(2 K_1) - e^(-2 K_1))
          e^(sqrt(-1) theta_mu)
          +
          (e^(2 K_1) + e^(-2 K_1) + 2)
        )
        /
        (
          (e^(2 K_1) + e^(-2 K_1) - 2)
          e^(-2 sqrt(-1) theta_mu)
          -
          (e^(2 K_2) + e^(-2 K_2))
          (e^(2 K_1) - e^(-2 K_1))
          e^(-sqrt(-1) theta_mu)
          +
          (e^(2 K_1) + e^(-2 K_1) + 2)
        )
      )
      quad dots.c quad (L.24)
    $

    よって、

    $
      sqrt(
        (gamma_2(theta_(mu)))
        /
        (gamma_2(-theta_(mu)))
      )
      =
      a(theta_mu)
    $

    さらに、

    #note[
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
    ]

    $
      (
        sqrt(
          (gamma_2(theta_(mu)))
          /
          (gamma_2(-theta_(mu)))
        )
      )^(-1)
      =
      cases(
        sqrt(
          (gamma_2(-theta_(mu)))
          /
          (gamma_2(theta_(mu)))
        ) & quad (-pi < arg^((-pi, pi])(
          (gamma_2(theta_(mu)))
          /
          (gamma_2(-theta_(mu)))
        ) < pi),
        -(
          sqrt(
            (gamma_2(-theta_(mu)))
            /
            (gamma_2(theta_(mu)))
          )
        ) & quad (arg^((-pi, pi])(
          (gamma_2(theta_(mu)))
          /
          (gamma_2(-theta_(mu)))
        ) = pi),
      )
      quad (because #ref(<square_of_sqrt>))
    $

    $qed$

    #note[
      $
        K_2^* := -1/2 log(tanh K_2) arrow.l.r sinh(K_2) sinh(K_2^*) = 1
      $

      $
        K_2^* &= -1/2 log(tanh K_2)
        \
        -2 K_2^* &= log(tanh K_2)
        \
        e^(-2 K_2^*) &= tanh K_2
        \
        e^(K_2^*) &= (tanh K_2)^(-1/2)
        \
        e^(-K_2^*) &= (tanh K_2)^(1/2)
      $

      $
        tanh(K_2^*) &= (e^(K_2^*) - e^(-K_2^*)) / (e^(K_2^*) + e^(-K_2^*)) \
        \
        &=
        ((tanh K_2)^(-1/2) - (tanh K_2)^(1/2)) / ((tanh K_2)^(-1/2) + (tanh K_2)^(1/2)) \
      $

      より、

      $
        cosh(2 K_2)
        &=
        (cosh(K_2))^2 + (sinh(K_2))^2
        \
        &=
        (1 + (sinh(K_2))^2) + (sinh(K_2))^2
        \
        &=
        1 + 2 (sinh(K_2^*))^(-2)
      $

      x in RR
      $
        e^x = 2(cosh(x) + sinh(x))
      $

      y in RR
      $
        e^(sqrt(-1) y) &= cos(y) + sqrt(-1) sin(y) \
        e^(-sqrt(-1) y)
        &= cos(-y) + sqrt(-1) sin(-y)
        \
        &= cos(y) - sqrt(-1) sin(y)
      $

      より、

      $
        cos(y) = (e^(sqrt(-1) y) + e^(-sqrt(-1) y)) / 2 \
        sin(y) = (e^(sqrt(-1) y) - e^(-sqrt(-1) y)) / (2 sqrt(-1))
      $

      z in CC
      $
        sinh(z) = -sqrt(-1) sin(sqrt(-1) z) \
        cosh(z) = cos(sqrt(-1) z) \
      $

      x in RR
      $
        sinh(2x) = 2 sinh(x) cosh(x) \
        cosh(2x) = (cosh(x))^2 + (sinh(x))^2 \

        (cosh(x))^2 - (sinh(x))^2 = 1 \
        (cosh(x))^2 = 1 + (sinh(x))^2 \
        (sinh(x))^2 = (cosh(x))^2 - 1
      $


      $
        (
          sqrt(
            -1
          )
          sqrt(
            gamma_2(theta_(mu))
            gamma_2(-theta_(mu))
          )
        )
        /
        (
          gamma_2(-theta_(mu))
        )
        &=
        cases(
          (
            sqrt(
              -1
            )
            sqrt(
              gamma_2(theta_(mu))
              gamma_2(-theta_(mu))
            )
          )
          /
          (
            sqrt(
              (
                gamma_2(-theta_(mu))
              )
              ^
              2
            )
          )
          quad & (-pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi/2),
          (
            sqrt(
              -1
            )
            sqrt(
              gamma_2(theta_(mu))
              gamma_2(-theta_(mu))
            )
          )
          /
          (
            -
            sqrt(
              (
                gamma_2(-theta_(mu))
              )
              ^
              2
            )
          )
          quad & (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= -pi/2 or pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
        )
        quad
        (because #ref(<square_of_sqrt>))
        \
        &=
        cases(
          sqrt(
            -1
          )
          (
            sqrt(
              (
                gamma_2(theta_(mu))
                gamma_2(-theta_(mu))
              )
            )
            sqrt(
              1
              /
              (
                (
                  gamma_2(-theta_(mu))
                )
                ^
                2
              )
            )
          )
          quad & (-pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi/2),
          -
          sqrt(
            -1
          )
          (
            sqrt(
              (
                gamma_2(theta_(mu))
                gamma_2(-theta_(mu))
              )
            )
            sqrt(
              1
              /
              (
                (
                  gamma_2(-theta_(mu))
                )
                ^
                2
              )
            )
          )
          quad & (-pi < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= -pi/2 or pi/2 < arg^((-pi, pi])(gamma_2(-theta_(mu))) <= pi),
        )
        \
        &=
        sqrt(
          -1
        )
        (
          sqrt(
            (
              gamma_2(theta_(mu))
              gamma_2(-theta_(mu))
            )
          )
          sqrt(
            1
            /
            (
              (
                gamma_2(-theta_(mu))
              )
              ^
              2
            )
          )
        )
        \
        &=
        sqrt(
          -1
        )
        (
          sqrt(
            (
              gamma_2(theta_(mu))
              gamma_2(-theta_(mu))
            )
            dot.op
            1
            /
            (
              (
                gamma_2(-theta_(mu))
              )
              ^
              2
            )
          )
        )
        \
        &=
        sqrt(
          -1
        )
        (
          sqrt(
            (
              gamma_2(theta_(mu))
            )
            /
            (
              gamma_2(-theta_(mu))
            )
          )
        )
        \
        &=
        sqrt(
          -1
        )
        (
          sqrt(
            (
              sqrt(-1) e^(sqrt(-1) theta_(mu)) s_2^* (c_1 cos (theta_(mu)) - sqrt(-1) sin (theta_(mu)) - s_1 c_2)
            )
            /
            (
              sqrt(-1) e^(-sqrt(-1) theta_mu) s_2^* (c_1 cos (theta_mu) + sqrt(-1) sin (theta_mu) - s_1 c_2)
            )
          )
        )
        \
        &=
        sqrt(
          -1
        )
        (
          sqrt(
            (
              e^(sqrt(-1) theta_(mu)) (c_1 cos (theta_(mu)) - sqrt(-1) sin (theta_(mu)) - s_1 c_2)
            )
            /
            (
              e^(-sqrt(-1) theta_mu) (c_1 cos (theta_mu) + sqrt(-1) sin (theta_mu) - s_1 c_2)
            )
          )
        )
        \
        &=
        sqrt(
          -1
        )
        (
          sqrt(
            (
              e^(sqrt(-1) theta_(mu)) (cosh(2K_1) cos (theta_(mu)) - sqrt(-1) sin (theta_(mu)) - sinh(2K_1) cosh(2K_2))
            )
            /
            (
              e^(-sqrt(-1) theta_mu) (cosh(2K_1) cos (theta_mu) + sqrt(-1) sin (theta_mu) - sinh(2K_1) cosh(2K_2))
            )
          )
        )
      $

      $
        a(theta_mu)
        &=
        sqrt(
          (
            (1 - alpha_1 e^(sqrt(-1) theta_mu))
          )
          /
          (
            (1 - alpha_1 e^(-sqrt(-1) theta_mu))
          )
          dot.c
          (
            (1 - alpha_2^(-1) e^(sqrt(-1) theta_mu))
          )
          /
          (
            (1 - alpha_2^(-1) e^(-sqrt(-1) theta_mu))
          )
        )
        \
        &=
        sqrt(
          (
            (1 - (tanh K_1 tanh K_2^*) e^(sqrt(-1) theta_mu))
          )
          /
          (
            (1 - (tanh K_1 tanh K_2^*) e^(-sqrt(-1) theta_mu))
          )
          dot.c
          (
            (1 - ((tanh K_1)^(-1) tanh K_2^*)^(-1) e^(sqrt(-1) theta_mu))
          )
          /
          (
            (1 - ((tanh K_1)^(-1) tanh K_2^*)^(-1) e^(-sqrt(-1) theta_mu))
          )
        )
      $

      より、

      $
        sqrt(-1) a(theta_mu)^(-1)
        &=
        sqrt(
          (
            (1 - (tanh K_1 tanh K_2^*) e^(-sqrt(-1) theta_mu))
          )
          /
          (
            (1 - (tanh K_1 tanh K_2^*) e^(sqrt(-1) theta_mu))
          )
          dot.c
          (
            (1 - ((tanh K_1)^(-1) tanh K_2^*)^(-1) e^(-sqrt(-1) theta_mu))
          )
          /
          (
            (1 - ((tanh K_1)^(-1) tanh K_2^*)^(-1) e^(sqrt(-1) theta_mu))
          )
        )
      $
    ]

    以下のsagemathコードで数値的に等しいことが検証できた
    ```python
    # 変数とパラメータの定義
    var('K1 K2 theta_mu')

    # K1^*, K2^* の定義
    def Kstar(K):
        return -1/2 * log(tanh(K))

    K1s = Kstar(K1)
    K2s = Kstar(K2)

    # e^{iθ_μ}
    eiθ = exp(I*theta_mu)
    emθ = exp(-I*theta_mu)

    # --- 1つ目の式 ---
    numer1 = eiθ*(cosh(2*K1)*cos(theta_mu) - I*sin(theta_mu) - sinh(2*K1)*cosh(2*K2))
    denom1 = emθ*(cosh(2*K1)*cos(theta_mu) + I*sin(theta_mu) - sinh(2*K1)*cosh(2*K2))
    expr1 = I*sqrt(numer1/denom1)

    # --- 2つ目の式 ---
    tK1 = tanh(K1)
    tK2s = tanh(K2s)
    inv_tK1 = 1/tK1

    factor1_num = 1 - (tK1 * tK2s) * emθ
    factor1_den = 1 - (tK1 * tK2s) * eiθ
    factor2_num = 1 - (1/(inv_tK1 * tK2s)) * emθ
    factor2_den = 1 - (1/(inv_tK1 * tK2s)) * eiθ
    expr2 = sqrt((factor1_num/factor1_den) * (factor2_num/factor2_den))

    # 数値代入例（任意の値、変更可）
    K1_val = 0.7
    K2_val = 1.2
    theta_mu_val = 1.1

    # 代入して数値計算
    val1 = expr1.subs({K1:K1_val, K2:K2_val, theta_mu:theta_mu_val}).n()
    val2 = expr2.subs({K1:K1_val, K2:K2_val, theta_mu:theta_mu_val}).n()

    # 結果表示
    print("expr1 =", val1)
    print("expr2 =", val2)
    print("差 =", abs(val1 - val2))
    ```
    $qed$
  ]
]<equation_of_a_theta_mu>
