#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules
#claim([$T_((V'))$の$psi$への作用])[
  $mu in cal(M)$について、

  $
    T_((V'))(psi_mu^dagger) &= e^(-gamma(theta_mu)) psi_mu^dagger
    \
    T_((V'))(psi_mu) &= e^(gamma(theta_mu)) psi_mu
  $

  #note[
    030 では $T_((V))(psi_mu^dagger) = e^(+gamma(theta_mu)) psi_mu^dagger$ であるから、$T_((V)) = T_((V'))$ とするためには $V'$ の定義の符号を $V' := exp(+ sum_(mu in cal(M)) gamma(theta_mu) (psi_mu^dagger psi_mu - 1/2))$ に修正する必要がある。
  ]

  #proof[
    $#ref(<def_Vprime>)$ より、

    $
      V'
      =
      exp(
        -
        sum_(nu in cal(M))
        gamma(theta_nu)
        (
          psi_nu^dagger psi_nu - 1/2
        )
      )
    $

    $X := - sum_(nu in cal(M)) gamma(theta_nu) (psi_nu^dagger psi_nu - 1/2)$ とおくと、$V' = exp(X)$ であり、

    $
      T_((V'))(psi_mu^dagger)
      &=
      V' psi_mu^dagger V'^(-1)
      \
      &=
      exp(X) psi_mu^dagger exp(-X)
      \
      &=
      exp("ad"(X))(psi_mu^dagger)
      quad
      (because #ref(<brianhall_3.35>))
    $

    === Step 1: $"ad"(X)(psi_mu^dagger)$の計算

    $
      "ad"(X)(psi_mu^dagger)
      &=
      [X, psi_mu^dagger]
      \
      &=
      X psi_mu^dagger - psi_mu^dagger X
      \
      &=
      (
        -
        sum_(nu in cal(M))
        gamma(theta_nu)
        (
          psi_nu^dagger psi_nu - 1/2
        )
      )
      psi_mu^dagger
      -
      psi_mu^dagger
      (
        -
        sum_(nu in cal(M))
        gamma(theta_nu)
        (
          psi_nu^dagger psi_nu - 1/2
        )
      )
      \
      &=
      -
      sum_(nu in cal(M))
      gamma(theta_nu)
      [
        psi_nu^dagger psi_nu - 1/2,
        psi_mu^dagger
      ]
      \
      &=
      -
      sum_(nu in cal(M))
      gamma(theta_nu)
      [
        psi_nu^dagger psi_nu,
        psi_mu^dagger
      ]
      quad
      (because [1/2, psi_mu^dagger] = 0)
    $

    ここで、$[psi_nu^dagger psi_nu, psi_mu^dagger]$ を計算する。

    $
      [psi_nu^dagger psi_nu, psi_mu^dagger]
      &=
      psi_nu^dagger psi_nu psi_mu^dagger
      -
      psi_mu^dagger psi_nu^dagger psi_nu
    $

    $#ref(<anticommutator_of_psi>)$ より $[psi_nu, psi_mu^dagger]_(+) = delta_(mu equiv nu (mod M))$ であるから、

    $
      psi_nu psi_mu^dagger
      =
      delta_(mu equiv nu (mod M))
      -
      psi_mu^dagger psi_nu
    $

    これを代入すると、

    $
      psi_nu^dagger psi_nu psi_mu^dagger
      &=
      psi_nu^dagger
      (
        delta_(mu equiv nu (mod M))
        -
        psi_mu^dagger psi_nu
      )
      \
      &=
      delta_(mu equiv nu (mod M))
      psi_nu^dagger
      -
      psi_nu^dagger psi_mu^dagger psi_nu
    $

    $#ref(<anticommutator_of_psi>)$ より $[psi_nu^dagger, psi_mu^dagger]_(+) = 0$ であるから、

    $
      psi_nu^dagger psi_mu^dagger
      =
      -
      psi_mu^dagger psi_nu^dagger
    $

    これを代入すると、

    $
      psi_nu^dagger psi_nu psi_mu^dagger
      &=
      delta_(mu equiv nu (mod M))
      psi_nu^dagger
      -
      (
        -
        psi_mu^dagger psi_nu^dagger
      )
      psi_nu
      \
      &=
      delta_(mu equiv nu (mod M))
      psi_nu^dagger
      +
      psi_mu^dagger psi_nu^dagger psi_nu
    $

    したがって、

    $
      [psi_nu^dagger psi_nu, psi_mu^dagger]
      &=
      psi_nu^dagger psi_nu psi_mu^dagger
      -
      psi_mu^dagger psi_nu^dagger psi_nu
      \
      &=
      delta_(mu equiv nu (mod M))
      psi_nu^dagger
      +
      psi_mu^dagger psi_nu^dagger psi_nu
      -
      psi_mu^dagger psi_nu^dagger psi_nu
      \
      &=
      delta_(mu equiv nu (mod M))
      psi_nu^dagger
    $

    $mu equiv nu (mod M)$ のとき $psi_nu^dagger = psi_mu^dagger$ であるから、

    $
      [psi_nu^dagger psi_nu, psi_mu^dagger]
      =
      delta_(mu equiv nu (mod M))
      psi_mu^dagger
    $

    === Step 2: $"ad"(X)(psi_mu^dagger)$の結果

    Step 1 の結果を代入すると、

    $
      "ad"(X)(psi_mu^dagger)
      &=
      -
      sum_(nu in cal(M))
      gamma(theta_nu)
      delta_(mu equiv nu (mod M))
      psi_mu^dagger
      \
      &=
      -
      gamma(theta_mu)
      psi_mu^dagger
    $

    === Step 3: $"ad"(X)^n (psi_mu^dagger)$の計算

    $"ad"(X)(psi_mu^dagger) = - gamma(theta_mu) psi_mu^dagger$ より、$psi_mu^dagger$ は $"ad"(X)$ の固有ベクトルであり、固有値は $-gamma(theta_mu)$ である。

    したがって、

    $
      "ad"(X)^n (psi_mu^dagger)
      =
      (-gamma(theta_mu))^n psi_mu^dagger
    $

    === Step 4: $exp("ad"(X))(psi_mu^dagger)$の計算

    $
      exp("ad"(X))(psi_mu^dagger)
      &=
      sum_(n=0)^(infinity)
      (1) / (n!)
      "ad"(X)^n (psi_mu^dagger)
      \
      &=
      sum_(n=0)^(infinity)
      (1) / (n!)
      (-gamma(theta_mu))^n psi_mu^dagger
      \
      &=
      (
        sum_(n=0)^(infinity)
        ((-gamma(theta_mu))^n) / (n!)
      )
      psi_mu^dagger
      \
      &=
      e^(-gamma(theta_mu))
      psi_mu^dagger
    $

    よって、

    $
      T_((V'))(psi_mu^dagger)
      =
      e^(-gamma(theta_mu))
      psi_mu^dagger
    $

    === Step 5: $T_((V'))(psi_mu)$の計算

    同様に、$[psi_nu^dagger psi_nu, psi_mu]$ を計算する。

    $#ref(<anticommutator_of_psi>)$ より $[psi_nu^dagger, psi_mu]_(+) = delta_(mu equiv nu (mod M))$ であるから、

    $
      psi_nu^dagger psi_mu
      =
      delta_(mu equiv nu (mod M))
      -
      psi_mu psi_nu^dagger
    $

    $
      psi_nu^dagger psi_nu psi_mu
      &=
      psi_nu^dagger
      (
        -
        psi_mu psi_nu
      )
      quad
      (because #ref(<anticommutator_of_psi>)"より" [psi_nu, psi_mu]_(+) = 0)
      \
      &=
      -
      psi_nu^dagger psi_mu psi_nu
      \
      &=
      -
      (
        delta_(mu equiv nu (mod M))
        -
        psi_mu psi_nu^dagger
      )
      psi_nu
      \
      &=
      -
      delta_(mu equiv nu (mod M))
      psi_nu
      +
      psi_mu psi_nu^dagger psi_nu
    $

    したがって、

    $
      [psi_nu^dagger psi_nu, psi_mu]
      &=
      psi_nu^dagger psi_nu psi_mu
      -
      psi_mu psi_nu^dagger psi_nu
      \
      &=
      -
      delta_(mu equiv nu (mod M))
      psi_nu
      +
      psi_mu psi_nu^dagger psi_nu
      -
      psi_mu psi_nu^dagger psi_nu
      \
      &=
      -
      delta_(mu equiv nu (mod M))
      psi_nu
      \
      &=
      -
      delta_(mu equiv nu (mod M))
      psi_mu
    $

    よって、

    $
      "ad"(X)(psi_mu)
      &=
      -
      sum_(nu in cal(M))
      gamma(theta_nu)
      (
        -
        delta_(mu equiv nu (mod M))
        psi_mu
      )
      \
      &=
      gamma(theta_mu)
      psi_mu
    $

    $psi_mu$ は $"ad"(X)$ の固有ベクトルであり、固有値は $gamma(theta_mu)$ である。Step 4 と同様に、

    $
      T_((V'))(psi_mu)
      &=
      exp("ad"(X))(psi_mu)
      \
      &=
      e^(gamma(theta_mu))
      psi_mu
    $
  ]
]
