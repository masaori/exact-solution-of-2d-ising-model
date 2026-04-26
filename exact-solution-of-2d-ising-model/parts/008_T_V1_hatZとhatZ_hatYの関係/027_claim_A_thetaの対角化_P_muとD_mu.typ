#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules
#claim([$A(theta)$の対角化 ($P_mu$, $D_mu$の定義)])[
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
      lambda_(plus, mu), 0;
      0, lambda_(minus, mu)
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
