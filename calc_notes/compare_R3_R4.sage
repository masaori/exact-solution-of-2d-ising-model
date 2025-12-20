# ---------------------------------------------------------
# SageMath: 式R.3と式R.4の等価性検証コード
# ---------------------------------------------------------

# 変数の定義
var('K1 K2 theta_mu')
K1_star = exp(-2*K1)
K2_star = exp(-2*K2)
s_1 = sinh(2*K1)
c_1 = cosh(2*K1)
s_2 = sinh(2*K2)
c_2 = cosh(2*K2)
s_1_star = sinh(2*K1_star)
c_1_star = cosh(2*K1_star)
s_2_star = sinh(2*K2_star)
c_2_star = cosh(2*K2_star)
alpha_1 = tanh(K1) * tanh(K2_star)
alpha_2 = tanh(K2_star) / tanh(K1)

# ---------------------------------------------------------
# 式R.3の定義
# ---------------------------------------------------------
# 式R.3(typst):
#     (
#       e^(sqrt(-1) theta_(mu))
#       (
#         (e^(2 K_1) + e^(-2 K_1))/2
#         (e^(sqrt(-1) theta_(mu)) + e^(-sqrt(-1) theta_(mu)))/2
#         -
#         sqrt(-1)
#         (e^(sqrt(-1) theta_(mu)) - e^(-sqrt(-1) theta_(mu)))/(2 sqrt(-1))
#         -
#         (e^(2 K_1) - e^(-2 K_1))/2
#         (e^(2 K_2) + e^(-2 K_2))/2
#       )
#     )
#     /
#     (
#       e^(-sqrt(-1) theta_(mu))
#       (
#         (e^(2 K_1) + e^(-2 K_1))/2
#         (e^(-sqrt(-1) theta_(mu)) + e^(sqrt(-1) theta_(mu)))/2
#         -
#         sqrt(-1)
#         (e^(-sqrt(-1) theta_(mu)) - e^(sqrt(-1) theta_(mu)))/(2 sqrt(-1))
#         -
#         (e^(2 K_1) - e^(-2 K_1))/2
#         (e^(2 K_2) + e^(-2 K_2))/2
#       )
#     )

i = I  # Sage では I が虚数単位

rad1 = (
    exp(i*theta_mu)
    * (
        (exp(2*K1) + exp(-2*K1))/2
        * (exp(i*theta_mu) + exp(-i*theta_mu))/2
        - i
        * (exp(i*theta_mu) - exp(-i*theta_mu))/(2*i)
        - (exp(2*K1) - exp(-2*K1))/2
        * (exp(2*K2) + exp(-2*K2))/2
      )
) / (
    exp(-i*theta_mu)
    * (
        (exp(2*K1) + exp(-2*K1))/2
        * (exp(-i*theta_mu) + exp(i*theta_mu))/2
        - i
        * (exp(-i*theta_mu) - exp(i*theta_mu))/(2*i)
        - (exp(2*K1) - exp(-2*K1))/2
        * (exp(2*K2) + exp(-2*K2))/2
      )
)

# 簡約
rad1_simplified = rad1.simplify_full()

print("\n--- rad1 (R.3) simplified ---")
print(rad1_simplified)

# ---------------------------------------------------------
# 式R.4の定義
# ---------------------------------------------------------
# 式R.4(typst):
#       (
#           e^(sqrt(-1) theta_(mu))
#           (
#             (e^(2 K_1) + e^(-2 K_1))
#             (e^(sqrt(-1) theta_(mu)) + e^(-sqrt(-1) theta_(mu)))
#             -
#             2(e^(sqrt(-1) theta_(mu)) - e^(-sqrt(-1) theta_(mu)))
#             -
#             (e^(2 K_1) - e^(-2 K_1))
#             (e^(2 K_2) + e^(-2 K_2))
#           )
#         )
#         /
#         (
#           e^(-sqrt(-1) theta_(mu))
#           (
#             (e^(2 K_1) + e^(-2 K_1))
#             (e^(-sqrt(-1) theta_(mu)) + e^(sqrt(-1) theta_(mu)))
#             -
#             2(e^(-sqrt(-1) theta_(mu)) - e^(sqrt(-1) theta_(mu)))
#             -
#             (e^(2 K_1) - e^(-2 K_1))
#             (e^(2 K_2) + e^(-2 K_2))
#           )
#         )

rad2 = (
    exp(i*theta_mu)
    * (
        (exp(2*K1) + exp(-2*K1))
        * (exp(i*theta_mu) + exp(-i*theta_mu))
        - 2*(exp(i*theta_mu) - exp(-i*theta_mu))
        - (exp(2*K1) - exp(-2*K1))
        * (exp(2*K2) + exp(-2*K2))
      )
) / (
    exp(-i*theta_mu)
    * (
        (exp(2*K1) + exp(-2*K1))
        * (exp(-i*theta_mu) + exp(i*theta_mu))
        - 2*(exp(-i*theta_mu) - exp(i*theta_mu))
        - (exp(2*K1) - exp(-2*K1))
        * (exp(2*K2) + exp(-2*K2))
      )
)

rad2_simplified = rad2.simplify_full()

print("\n--- rad2 (R.4) simplified ---")
print(rad2_simplified)

# ---------------------------------------------------------
# 記号的な等価性チェック（sqrtを取らずに中身を比較）
# ---------------------------------------------------------
print("\n--- Symbolic check of radicands (without sqrt) ---")
diff_rad = (rad1_simplified - rad2_simplified).simplify_full()
print("rad1 - rad2 simplified =")
print(diff_rad)

# 可能なら bool(...) で 0 かどうか評価
try:
    print("Is rad1_simplified == rad2_simplified ? ->", bool(diff_rad == 0))
except Exception as e:
    print("bool 判定時にエラー:", e)

# ---------------------------------------------------------
# 数値代入による確認（sqrtを取らずに中身を比較）
# ---------------------------------------------------------
print("\n--- Numerical Verification (theta_mu grid, without sqrt) ---")
M_val = 100
mu_list = [m for m in range(-M_val, M_val + 1) if m != 0]

# テスト用の値（必要に応じて変更したり増やしたりしてよい）
val_K1 = 0.004
val_K2 = 0.008

print(f"Parameters: K1={val_K1}, K2={val_K2}, M={M_val}")

all_ok = True
for mu in mu_list:
    th = (2 * pi * mu) / M_val

    # 値の計算（sqrtを取らずに中身を比較）
    v1 = rad1.subs({K1: val_K1, K2: val_K2, theta_mu: th}).n()
    v2 = rad2.subs({K1: val_K1, K2: val_K2, theta_mu: th}).n()

    err = abs(v1 - v2)
    if err > 1e-14:
        print(f"Mismatch at mu={mu}: |rad1 - rad2| = {err}")
        all_ok = False

if all_ok:
    print("Result: All numerical checks (without sqrt) passed within precision limits.")
