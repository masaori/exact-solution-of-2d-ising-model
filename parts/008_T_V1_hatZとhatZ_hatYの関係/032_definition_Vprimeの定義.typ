#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules
#definition([$V'$の定義])[
  $cal(M) := {-M, dots, -2, -1, 1, 2, dots, M}$ とする。

  $
    V' := exp(
      - sum_(mu in cal(M)) gamma(theta_mu) (psi_mu^dagger psi_mu - 1/2)
    )
  $
]<def_Vprime>
