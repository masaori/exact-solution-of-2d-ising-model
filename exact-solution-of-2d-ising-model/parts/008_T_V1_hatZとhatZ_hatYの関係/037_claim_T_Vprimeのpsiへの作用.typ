#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules
#claim([$T_((V'))$の$psi$への作用])[
  $mu in cal(M)$について、

  $
    T_((V'))(psi_mu^dagger) &= e^(-gamma(theta_mu)) psi_mu^dagger
    \
    T_((V'))(psi_mu) &= e^(gamma(theta_mu)) psi_mu
  $

  #remark[
    *TODO（クリティカル）: $#ref(<def_Vprime>)$ の $V'$ 定義の修正が必要*

    現状の定義 $V' := exp(-sum_(mu in cal(M)) gamma(theta_mu) (psi_mu^dagger psi_mu - 1/2))$ では、新しい反交換関係 $#ref(<anticommutator_of_psi>)$ ($[psi_mu^dagger, psi_nu]_(+) = delta^M_(mu + nu, 0) I$) のもとで $psi_mu^dagger$ は $"ad"(X)$ の固有ベクトルにならない。具体的には、

    $
      "ad"(X)(psi_mu^dagger)
      =
      - sum_(nu in cal(M)) gamma(theta_nu) delta^M_(mu + nu, 0) psi_nu^dagger
      = - 2 gamma(theta_mu) psi_(-mu)^dagger
    $

    （$nu equiv -mu (mod M)$ を満たす $nu in cal(M)$ が 2 個あり、いずれも $psi_nu^dagger = psi_(-mu)^dagger$、$gamma(theta_nu) = gamma(theta_mu)$ である）。

    上記のステートメントが成立するためには、$V'$ の定義を例えば

    $
      V' := exp(+ sum_(mu = 1)^M gamma(theta_mu) (psi_mu^dagger psi_(-mu) - 1/2))
    $

    のように、$psi_mu^dagger psi_(-mu)$ かつ半分のモードでの和に書き換える必要がある。$#ref(<def_Vprime>)$ の見直しが完了するまで本ステートメントの proof は保留。

    （以下の旧 proof は OLD の反交換関係 $[psi_nu, psi_mu^dagger]_(+) = delta_(mu equiv nu (mod M))$ に基づくもので、現行の $#ref(<anticommutator_of_psi>)$ と整合しない。参考用に残す。）
  ]

  #proof[
    // 注意: 以下は OLD の反交換関係 (delta_(mu equiv nu)) に基づく proof。
    // 現行の #ref(<anticommutator_of_psi>) (delta^M_(mu+nu,0)) では成立しない。
    // 詳細は上記 remark 参照。

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

    === Step 1: $"ad"(X)(psi_mu^dagger)$の計算（新しい反交換関係に基づく）

    $
      "ad"(X)(psi_mu^dagger)
      &=
      [X, psi_mu^dagger]
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

    ここで、$[psi_nu^dagger psi_nu, psi_mu^dagger]$ を計算する。$#ref(<anticommutator_of_psi>)$ より $[psi_nu, psi_mu^dagger]_(+) = delta^M_(mu + nu, 0) I$ であるから、

    $
      psi_nu psi_mu^dagger
      =
      delta^M_(mu + nu, 0) I
      -
      psi_mu^dagger psi_nu
    $

    これを代入すると、

    $
      psi_nu^dagger psi_nu psi_mu^dagger
      &=
      psi_nu^dagger
      (
        delta^M_(mu + nu, 0) I
        -
        psi_mu^dagger psi_nu
      )
      \
      &=
      delta^M_(mu + nu, 0)
      psi_nu^dagger
      -
      psi_nu^dagger psi_mu^dagger psi_nu
    $

    $#ref(<anticommutator_of_psi>)$ より $[psi_nu^dagger, psi_mu^dagger]_(+) = 0$ であるから、$psi_nu^dagger psi_mu^dagger = - psi_mu^dagger psi_nu^dagger$ であり、

    $
      psi_nu^dagger psi_nu psi_mu^dagger
      =
      delta^M_(mu + nu, 0)
      psi_nu^dagger
      +
      psi_mu^dagger psi_nu^dagger psi_nu
    $

    したがって、

    $
      [psi_nu^dagger psi_nu, psi_mu^dagger]
      =
      delta^M_(mu + nu, 0)
      psi_nu^dagger
    $

    === Step 2: $"ad"(X)(psi_mu^dagger)$の結果

    Step 1 の結果を代入すると、

    $
      "ad"(X)(psi_mu^dagger)
      =
      -
      sum_(nu in cal(M))
      gamma(theta_nu)
      delta^M_(mu + nu, 0)
      psi_nu^dagger
    $

    $delta^M_(mu + nu, 0) eq.not 0$ となる $nu in cal(M)$ は $nu equiv -mu (mod M)$ を満たすもので、$cal(M)$ 内に 2 個存在する。それらに対して $theta_nu = -theta_mu$ (mod $2 pi$) より $gamma(theta_nu) = gamma(theta_mu)$ (γは偶関数) かつ $psi_nu^dagger = psi_(-mu)^dagger$ (Ŷ, Ẑ の周期性より) である。よって、

    $
      "ad"(X)(psi_mu^dagger)
      =
      - 2 gamma(theta_mu) psi_(-mu)^dagger
    $

    *NOTE: ここで proof は中断する。* $psi_mu^dagger$ は $"ad"(X)$ の固有ベクトルではなく、$psi_(-mu)^dagger$ に写る。クレームの $T_((V'))(psi_mu^dagger) = e^(-gamma) psi_mu^dagger$ は現状の $V'$ 定義のもとでは成立しない。冒頭の remark を参照。
  ]
]
