以下のSageMathコードの式1,2を与えられた新しいtypstコードの式と置き換えて
コピペしやすいよう全コード出力して


```sagemath
# ---------------------------------------------------------
# SageMath: 式1と式2の等価性検証コード
# ---------------------------------------------------------

# 変数の定義
var('K1 K2 theta_mu')

# K2^* = e^(-2 K2)
K2_star = exp(-2*K2)

# ---------------------------------------------------------
# 式1の定義
# ---------------------------------------------------------
# 式1:
# sqrt(
#   (
#     i e^(i theta_mu) (cosh(2 K1) cos(theta_mu) - i sin(theta_mu) - sinh(2 K1) cosh(2 K2))
#   )
#   /
#   (
#     i e^(-i theta_mu) (cosh(2 K1) cos(-theta_mu) - i sin(-theta_mu) - sinh(2 K1) cosh(2 K2))
#   )
# )

i = I  # Sage では I が虚数単位

rad1 = ( i*exp(i*theta_mu)
         * ( cosh(2*K1)*cos(theta_mu)
             - i*sin(theta_mu)
             - sinh(2*K1)*cosh(2*K2) )
       ) / (
         i*exp(-i*theta_mu)
         * ( cosh(2*K1)*cos(-theta_mu)
             - i*sin(-theta_mu)
             - sinh(2*K1)*cosh(2*K2) )
       )

expr1 = sqrt(rad1)

# cos(-x) = cos(x), sin(-x) = -sin(x) を使って簡約
rad1_simplified = rad1.simplify_full()

print("\n--- rad1 simplified ---")
print(rad1_simplified)

# ---------------------------------------------------------
# 式2の定義
# ---------------------------------------------------------
# 式2:
# sqrt(
#   (1 - (tanh K1 * tanh K2^*) e^(i theta_mu))
#   / (1 - (tanh K1 * tanh K2^*) e^(-i theta_mu))
#   *
#   (1 - ((tanh K1)^(-1) * tanh K2^*)^(-1) e^(i theta_mu))
#   / (1 - ((tanh K1)^(-1) * tanh K2^*)^(-1) e^(-i theta_mu))
# )

t1 = tanh(K1)
t2 = tanh(K2_star)

factor1 = (1 - t1*t2*exp(i*theta_mu)) / (1 - t1*t2*exp(-i*theta_mu))
factor2 = (1 - ((t1**(-1) * t2)**(-1))*exp(i*theta_mu)) / (1 - ((t1**(-1) * t2)**(-1))*exp(-i*theta_mu))

rad2 = factor1 * factor2
expr2 = sqrt(rad2)

rad2_simplified = rad2.simplify_full()

print("\n--- rad2 simplified ---")
print(rad2_simplified)

# ---------------------------------------------------------
# 記号的な等価性チェック（平方根の中身同士）
# ---------------------------------------------------------
print("\n--- Symbolic check of radicands ---")
diff_rad = (rad1_simplified - rad2_simplified).simplify_full()
print("rad1 - rad2 simplified =")
print(diff_rad)

# 可能なら bool(...) で 0 かどうか評価
try:
    print("Is rad1_simplified == rad2_simplified ? ->", bool(diff_rad == 0))
except Exception as e:
    print("bool 判定時にエラー:", e)

# ---------------------------------------------------------
# 数値代入による確認（ユーザ指定のスタイル）
# ---------------------------------------------------------
print("\n--- Numerical Verification (theta_mu grid) ---")
M_val = 100
mu_list = [m for m in range(-M_val, M_val + 1) if m != 0]

# テスト用の値（必要に応じて変更したり増やしたりしてよい）
val_K1 = 10.4
val_K2 = 1.8

print(f"Parameters: K1={val_K1}, K2={val_K2}, M={M_val}")

all_ok = True
for mu in mu_list:
    th = (2 * pi * mu) / M_val

    # 値の計算（平方根を含む元の式）
    v1 = expr1.subs({K1: val_K1, K2: val_K2, theta_mu: th}).n()
    v2 = expr2.subs({K1: val_K1, K2: val_K2, theta_mu: th}).n()

    err = abs(v1 - v2)
    if err > 1e-14:
        print(f"Mismatch at mu={mu}: |expr1 - expr2| = {err}")
        all_ok = False

if all_ok:
    print("Result: All numerical checks (with sqrt) passed within precision limits.")

# ---------------------------------------------------------
# 平方根の枝の影響を避けるため、平方根の中身（rad1, rad2）でも数値チェック
# ---------------------------------------------------------
print("\n--- Numerical Verification (inside square roots: rad1 vs rad2) ---")
all_ok_rad = True
for mu in mu_list:
    th = (2 * pi * mu) / M_val

    vv1 = rad1_simplified.subs({K1: val_K1, K2: val_K2, theta_mu: th}).n()
    vv2 = rad2_simplified.subs({K1: val_K1, K2: val_K2, theta_mu: th}).n()

    err = abs(vv1 - vv2)
    if err > 1e-14:
        print(f"Mismatch at mu={mu}: |rad1 - rad2| = {err}")
        all_ok_rad = False

if all_ok_rad:
    print("Result: All numerical checks (radicands) passed within precision limits.")
```

# 新しい式1
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
            e^(sqrt(-1) theta_(mu))
            +
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
            e^(-sqrt(-1) theta_(mu))
            +
            e^(sqrt(-1) theta_(mu))
            -
            (e^(2 K_1) - e^(-2 K_1))
            (e^(2 K_2) + e^(-2 K_2))
          )
        )
      )

# 新しい式2
sqrt(
        (
          (e^(2 K_1) + e^(-2 K_1))
          e^(2 sqrt(-1) theta_(mu))
          +
          (e^(2 K_1) + e^(-2 K_1))
          -
          e^(2sqrt(-1) theta_(mu))
          +
          1
          -
          (e^(2 K_1) - e^(-2 K_1))
          (e^(2 K_2) + e^(-2 K_2))
          e^(sqrt(-1) theta_(mu))
        )
        /
        (
          (e^(2 K_1) + e^(-2 K_1))
          e^(-2sqrt(-1) theta_(mu))
          +
          (e^(2 K_1) + e^(-2 K_1))
          -
          e^(-2sqrt(-1) theta_(mu))
          +
          1
          -
          (e^(2 K_1) - e^(-2 K_1))
          (e^(2 K_2) + e^(-2 K_2))
          e^(-sqrt(-1) theta_(mu))
        )
      )