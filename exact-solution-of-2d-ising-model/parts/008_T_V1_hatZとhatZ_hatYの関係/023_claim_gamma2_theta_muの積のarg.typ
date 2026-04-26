#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules
#claim([$gamma_2(theta_mu)$$gamma_2(-theta_mu)$])[
  $mu in cal(M)$について、

  $
    arg^([0, 2pi))(gamma_2(theta_(mu)) gamma_2(-theta_(mu))) = pi
  $

  #proof[
    $mu in cal(M)$について、

    $
      gamma_2(theta_(mu)) gamma_2(-theta_(mu))
      &=
      (
        sqrt(-1) e^(sqrt(-1) (theta_mu)) s_2^* (c_1 cos (theta_mu) - sqrt(-1) sin (theta_mu) - s_1 c_2)
      )
      (
        sqrt(-1) e^(sqrt(-1) (-theta_mu)) s_2^* (c_1 cos (-theta_mu) - sqrt(-1) sin (-theta_mu) - s_1 c_2)
      )
      \
      &=
      underbrace(
        (
          sqrt(-1)
          dot.op
          sqrt(-1)
        )
        (
          e^((sqrt(-1) (theta_mu) + sqrt(-1) (-theta_mu)))
        )
        ,
        minus 1
      )
      (
        s_2^* (c_1 cos (theta_mu) - sqrt(-1) sin (theta_mu) - s_1 c_2)
      )
      (
        s_2^* (c_1 cos (theta_mu) + sqrt(-1) sin (theta_mu) - s_1 c_2)
      )
      \
      &=
      underbrace(
        (
          -1
        )
        (
          e^(0)
        )
        ,
        minus 1
      )
      (
        s_2^* (c_1 cos (theta_mu) - sqrt(-1) sin (theta_mu) - s_1 c_2)
      )
      (
        s_2^* (c_1 cos (theta_mu) + sqrt(-1) sin (theta_mu) - s_1 c_2)
      )
      quad (because cos"は偶関数, "sin"は奇関数")
      \
      &=
      -
      (
        s_2^*
      )
      ^2
      (c_1 cos (theta_mu) - sqrt(-1) sin (theta_mu) - s_1 c_2)
      (c_1 cos (theta_mu) + sqrt(-1) sin (theta_mu) - s_1 c_2)
      \
      &=
      -
      (
        s_2^*
      )
      ^2
      (
        (c_1 cos (theta_mu) - s_1 c_2)^2
        +
        (sin (theta_mu))^2
      )
      \
      &=
      -
      (
        s_2^*
      )
      ^2
      (
        (c_1 cos ((2 pi mu)/(M)) - s_1 c_2)^2
        +
        (sin ((2 pi mu)/(M)))^2
      )
      < 0
    $
  ]
]<arg_of_gamma_2_mu>
