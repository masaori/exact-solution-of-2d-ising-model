#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules
#claim([$A(theta)$の対角化])[
  $cal(M) := {-M, dots, -2, -1, 1, 2, dots, M}$ とする。

  $mu in cal(M)$について、

  $gamma_2(theta_mu) eq.not 0$のとき、

  $
    P_mu
    :=
    mat(
      plus
      sqrt(
        -1
      )
      sqrt(
        gamma_2(theta_(mu))
        gamma_2(-theta_(mu))
      )
      ,
      minus
      sqrt(
        -1
      )
      sqrt(
        gamma_2(theta_(mu))
        gamma_2(-theta_(mu))
      );
      gamma_2(-theta_(mu))
      ,
      gamma_2(-theta_(mu))
    )
    \
    D_mu
    :=
    mat(
      (
        gamma_1(theta_(mu))
      )
      plus
      sqrt(
        -1
      )
      sqrt(
        (
          gamma_2(theta_(mu))
        )
        (
          gamma_2(-theta_(mu))
        )
      ),
      0
      ;
      0,
      (
        gamma_1(theta_(mu))
      )
      minus
      sqrt(
        -1
      )
      sqrt(
        (
          gamma_2(theta_(mu))
        )
        (
          gamma_2(-theta_(mu))
        )
      )
    )
  $

  とおけば、

  $
    A(theta_(mu))
    =
    P_mu
    D_mu
    P_mu
    ^
    (-1)
  $

  $gamma_2(theta_mu) = 0$のとき、

  $
    A(theta_(mu))
    =
    I "(単位行列)"
  $
]
