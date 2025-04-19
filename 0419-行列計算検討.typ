このtypist形式の行列計算をsagemath形式に変換して

変数は
x
x^(prime)
y
y^(prime)
mu
M

mat(
  cosh(x),
  - sqrt(-1)
  exp(
    sqrt(-1)
    ((2 pi mu) / M)
  )
  sinh(x)
  ;
  sqrt(-1)
  exp(
    -
    sqrt(-1)
    ((2 pi mu) / M)
  )
  sinh(x),
  cosh(x)
  ;
)
mat(
  cosh(2 y^(prime)),
  - sqrt(-1)
  sinh(2 y^(prime))
  ;
  sqrt(-1)
  sinh(2 y^(prime)),
  cosh(2 y^(prime))
  ;
)
mat(
  cosh(x),
  - sqrt(-1)
  exp(
    sqrt(-1)
    ((2 pi mu) / M)
  )
  sinh(x)
  ;
  sqrt(-1)
  exp(
    -
    sqrt(-1)
    ((2 pi mu) / M)
  )
  sinh(x),
  cosh(x)
  ;
)
-
mat(
  cosh(2 x) cosh(2 y^(prime))
  -
  sinh(2 x) sinh(2 y^(prime)) cos(((2 pi mu) / M)),
  sqrt(-1) exp(sqrt(-1) ((2 pi mu) / M))
  sinh(2 y^(prime)) (cosh(2 x) cos(((2 pi mu) / M)) - sqrt(-1) sin(((2 pi mu) / M)) - sinh(2 x) cosh(2 y));
  - sqrt(-1) exp(- sqrt(-1)((2 pi mu) / M))
  sinh(2 y^(prime)) (cosh(2 x) cos(((2 pi mu) / M)) + sqrt(-1) sin(((2 pi mu) / M)) - sinh(2 x) cosh(2 y)),
  cosh(2 x) cosh(2 y^(prime))
  -
  sinh(2 x) sinh(2 y^(prime)) cos(((2 pi mu) / M));
)

cosh(2 K_1) = cosh(2 x)
cosh(2 K_1^(*)) = cosh(2 x^(prime))
sinh(2 K_1) = sinh(2 x)
sinh(2 K_1^(*)) = sinh(2 x^(prime))
cosh(2 K_2) = cosh(2 y)
cosh(2 K_2^(*)) = cosh(2 y^(prime))
sinh(2 K_2) = sinh(2 y)
sinh(2 K_2^(*)) = sinh(2 y^(prime))
theta = ((2 pi mu) / M)