#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules
#definition("フェルミオン", [
  $cal(M) := {-M, dots, -2, -1, 1, 2, dots, M}$ とする。

  $mu in cal(M)$について、$psi_mu, psi_mu^dagger in "Mat"(2, CC)^(times.o M)$を、

  $
    mat(
      psi_mu^dagger,
      psi_mu
    )
    :&=
    (
      hat(Z)_mu^((minus)),
      hat(Y)_mu
    )
    dot.c
    P_mu
    \
    &=
    (
      hat(Z)_mu^((minus)),
      hat(Y)_mu
    )
    dot.c
    (1) / (2 sqrt(M) gamma_2(-theta_(mu)))
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
    &=
    (1) / (2 sqrt(M) gamma_2(-theta_(mu)))
    (
      (
        plus
        sqrt(
          -1
        )
        sqrt(
          gamma_2(theta_(mu))
          gamma_2(-theta_(mu))
        )
      )
      hat(Z)_mu^((minus))
      +
      (
        gamma_2(-theta_(mu))
      )
      hat(Y)_mu
      ,
      (
        minus
        sqrt(
          -1
        )
        sqrt(
          gamma_2(theta_(mu))
          gamma_2(-theta_(mu))
        )
      )
      hat(Z)_mu^((minus))
      +
      (
        gamma_2(-theta_(mu))
      )
      hat(Y)_mu
    )
    \
    &=
    (
      (
        plus
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
        2 sqrt(M) gamma_2(-theta_(mu))
      )
      hat(Z)_mu^((minus))
      +
      (1) / (2 sqrt(M))
      hat(Y)_mu
      ,
      (
        minus
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
        2 sqrt(M) gamma_2(-theta_(mu))
      )
      hat(Z)_mu^((minus))
      +
      (1) / (2 sqrt(M))
      hat(Y)_mu
    )
  $

  と定める

  #note[
    #ref(<equation_of_a_theta_mu>) の Part A より、
    $arg^([0, 2pi))(gamma_2(-theta_mu))$ に応じて符号 $epsilon_mu in {plus 1, minus 1}$ が定まり、
    $
      (sqrt(gamma_2(theta_(mu)) gamma_2(-theta_(mu)))) / (gamma_2(-theta_(mu)))
      =
      epsilon_mu dot.op a(theta_mu)
    $
    が成り立つ。よって、上記のフェルミオンの定義は

    $
      psi_mu^dagger
      &=
      (1) / (2 sqrt(M))
      (
        hat(Y)_mu
        +
        epsilon_mu dot.op sqrt(-1) a(theta_mu)
        hat(Z)_mu^((minus))
      )
      \
      psi_mu
      &=
      (1) / (2 sqrt(M))
      (
        hat(Y)_mu
        -
        epsilon_mu dot.op sqrt(-1) a(theta_mu)
        hat(Z)_mu^((minus))
      )
    $

    のようにも書ける。

    これは、ホロノミック量子場 付録B 式(B.11)(B.12) の定義とは
    - $a(theta_mu)$が逆数になっている
    - 領域に応じた符号 $epsilon_mu$ がある
    という違いがある。
  ]
])<def_fermi>
