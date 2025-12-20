# ---------------------------------------------------------
# SageMath: 式1 (L.9) と式2 (L.10) の等価性検証コード
# 注意: sqrtを取らず、中身をそのまま比較する
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
# 式1の定義 (L.9)
# ---------------------------------------------------------
# 式1(typst):
#     (
#       ((e^(2 K_1) + 1) - ((e^(2 K_1) - 1) e^(-2 K_2)) e^(sqrt(-1) theta_mu))
#     )
#     /
#     (
#       ((e^(2 K_1) + 1) - ((e^(2 K_1) - 1) e^(-2 K_2)) e^(-sqrt(-1) theta_mu))
#     )
#     ×
#     (
#       ((e^(2 K_1) + 1) e^(-2 K_2) - (e^(2 K_1) - 1) e^(sqrt(-1) theta_mu))
#     )
#     /
#     (
#       ((e^(2 K_1) + 1) e^(-2 K_2) - (e^(2 K_1) - 1) e^(-sqrt(-1) theta_mu))
#     )

i = I  # Sage では I が虚数単位

# 第1の分数
num1_1 = (exp(2*K1) + 1) - (exp(2*K1) - 1)*exp(-2*K2)*exp(i*theta_mu)
den1_1 = (exp(2*K1) + 1) - (exp(2*K1) - 1)*exp(-2*K2)*exp(-i*theta_mu)
frac1_1 = num1_1 / den1_1

# 第2の分数
num1_2 = (exp(2*K1) + 1)*exp(-2*K2) - (exp(2*K1) - 1)*exp(i*theta_mu)
den1_2 = (exp(2*K1) + 1)*exp(-2*K2) - (exp(2*K1) - 1)*exp(-i*theta_mu)
frac1_2 = num1_2 / den1_2

# 式1全体（積）
expr1 = frac1_1 * frac1_2

# 簡約
expr1_simplified = expr1.simplify_full()

print("\n--- expr1 (L.9) simplified ---")
print(expr1_simplified)

# ---------------------------------------------------------
# 式2の定義 (L.10)
# ---------------------------------------------------------
# 式2(typst):
#     (
#       (e^(2 K_1) + 1) - (e^(2 K_1) e^(-2 K_2) - e^(-2 K_2)) e^(sqrt(-1) theta_mu)
#     )
#     /
#     (
#       (e^(2 K_1) + 1) - (e^(2 K_1) e^(-2 K_2) - e^(-2 K_2)) e^(-sqrt(-1) theta_mu)
#     )
#     ×
#     (
#       e^(2 K_1) e^(-2 K_2) + e^(-2 K_2) - (e^(2 K_1) - 1) e^(sqrt(-1) theta_mu)
#     )
#     /
#     (
#       e^(2 K_1) e^(-2 K_2) + e^(-2 K_2) - (e^(2 K_1) - 1) e^(-sqrt(-1) theta_mu)
#     )

# 第1の分数
num2_1 = (exp(2*K1) + 1) - (exp(2*K1)*exp(-2*K2) - exp(-2*K2))*exp(i*theta_mu)
den2_1 = (exp(2*K1) + 1) - (exp(2*K1)*exp(-2*K2) - exp(-2*K2))*exp(-i*theta_mu)
frac2_1 = num2_1 / den2_1

# 第2の分数
num2_2 = exp(2*K1)*exp(-2*K2) + exp(-2*K2) - (exp(2*K1) - 1)*exp(i*theta_mu)
den2_2 = exp(2*K1)*exp(-2*K2) + exp(-2*K2) - (exp(2*K1) - 1)*exp(-i*theta_mu)
frac2_2 = num2_2 / den2_2

# 式2全体（積）
expr2 = frac2_1 * frac2_2

# 簡約
expr2_simplified = expr2.simplify_full()

print("\n--- expr2 (L.10) simplified ---")
print(expr2_simplified)

# ---------------------------------------------------------
# 記号的な等価性チェック
# ---------------------------------------------------------
print("\n--- Symbolic check ---")
diff_expr = (expr1_simplified - expr2_simplified).simplify_full()
print("expr1 - expr2 simplified =")
print(diff_expr)

# 可能なら bool(...) で 0 かどうか評価
try:
    print("Is expr1_simplified == expr2_simplified ? ->", bool(diff_expr == 0))
except Exception as e:
    print("bool 判定時にエラー:", e)

# ---------------------------------------------------------
# 数値代入による確認
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

    # 値の計算（sqrtは取らない）
    v1 = expr1.subs({K1: val_K1, K2: val_K2, theta_mu: th}).n()
    v2 = expr2.subs({K1: val_K1, K2: val_K2, theta_mu: th}).n()

    err = abs(v1 - v2)
    if err > 1e-14:
        print(f"Mismatch at mu={mu}: |expr1 - expr2| = {err}")
        all_ok = False

if all_ok:
    print("Result: All numerical checks passed within precision limits.")
