# 方針メモ
- Z(J, J')の定義を{1-, 1}ではなくて、Z/Z2 := {+,-} でやってみる
    - 自然数でない何かを添え字とする行列
    - 状態のペアに値をふるものとして捉えている。コラムっぽく買いとけば良いのでは？

# 必要な要素

## 構成案(1: 数ベクトル空間 $R^n$ をベースとして展開
### 0. 記号
##### 略称
- $\newcommand{\Kset}{\mathbf{K}} \Kset$
- $\newcommand{\Kf}{\mathbb{K}} \Kf$
- $\newcommand{\linsp}[1]{#1\text{-}\mathrm{線形空間}} \linsp{\Kf}$
##### 定義しない
- $\renewcommand{\Z}{\mathbf{Z}}
    \Z: 集合としての整数$
- $\newcommand{\Zpos}{\mathbf{Z}_{\geq 0}}
    \Zpos := \{0, 1, 2, ...\} \subset \Z $
- $\newcommand{\Zone}{\mathbf{Z}_{\geq 1}}
    \Zone := \{1, 2, ...\} \subset \Z $
- $\renewcommand{\R}{\mathbf{R}}
    \R: 集合としての実数$
- $\newcommand{\C}{\mathbf{C}}
    \C: 集合としての複素数$
- $\newcommand{\Zr}{\mathbb{Z}}
    \Zr := (\mathbf{Z}, +_{\Zr},\cdot_{\Zr}): 整数環$
- $\newcommand{\Rf}{\mathbb{R}}
    \Rf := (\mathbf{R}, +_{\Rf},\cdot_{\Rf}): 実数体$
- $\newcommand{\Cf}{\mathbb{C}}
    \Cf := (\mathbf{C}, +_{\Cf},\cdot_{\Cf}): 複素数体$
- $\newcommand{\Rabel}{\mathbb{R}^{\times}}
    \Rabel := \Rf\backslash{0} := (\mathbf{R},\cdot_{\Rf}): 実数の乗法群$
- $\newcommand{\Cabel}{\mathbb{C}^{\times}}
    \Cabel := \Cf\backslash{0} := (\mathbf{C},\cdot_{\Cf}): 複素数の乗法群$

##### 定義する
- $\newcommand{\Mat}[2]{\mathbf{M}(#1, #2)}
    \Mat{n}{K}: K上のn次行列の集合$
- $\newcommand{\congas}[1]{\underset{\text{as}\ #1}{\cong}}
    \congas{aaa}: 同型$
- $\newcommand{\congaslin}{\congas{\text{lin. sp.}}}
    \congaslin: 線形同型$
- $\newcommand{\congasalg}[1]{\congas{\text{ass.}\ #1\text{-alg.}}}
    \congasalg{\Rf}: 結合代数同型$
- $\newcommand{\congasztwo}{\congas{\text{ass.}\ \Zr_{2}次数つき\text{alg.}}}
    \congasztwo: \Zr_{2} 代数同型$
- $\newcommand{\subspadd}[1]{+^{\text{sub.sp.}}_{#1}}
    \newcommand{\subspaddja}[1]{部分空間 \ #1 同士の和}
    \subspadd{V}: \subspaddja{V}$
- $\newcommand{\eqclass}[2]{\left[#2\right]_{#1}}
    \newcommand{\eqclassja}[2]{集合 \ #1 における #2 の 同値類}
    \eqclass{S}{v}: \eqclassja{S}{v}$
- $\newcommand{\Ztwo}{\Zr_{2}}
    \Ztwo := \Zr/2\Zr から積を忘れて巡回群として見たもの$
- $\Kf := (\Kset, +_{\Kf},\cdot_{\Kf}): 体に対して、$
  - $\newcommand{\stdlin}[2]{#1_{\mathrm{lin}}^{#2}}
    \newcommand{\stdlinja}[2]{#2 次元標準\linsp{#1}}
    \stdlin{\Kset}{n} := (\Kset^{n}, +_{\stdlin{\Kset}{n}},\cdot^{sc}_{\stdlin{\Kset}{n}}) : \stdlinja{\Kf}{n}$
- $\newcommand{\scprod}[1]{\cdot^{\text{sc}}_{#1}}
    \newcommand{\scprodja}[1]{\linsp{\mathbb{K}} \ #1 の スカラー積}
    \scprod{V}: \scprodja{V}$
- $\newcommand{\basis}[1]{E_{#1}}
    \newcommand{\basisja}[2]{#1 \ #2 の 基底}
    \basis{V}: \basisja{\linsp{\mathbb{K}}}{V}$
    - 一意に定まらない
- $\newcommand{\basiselm}[2]{e^{(#2)}_{#1}}
    \newcommand{\basiselmja}[3]{#1 \ #2 の 基底の要素 で添え字が #3 }
    \basiselm{V}{i}: \basiselmja{\linsp{\mathbb{K}}}{V}{i}$
    - 一意に定まらない
- $\newcommand{\stdbasis}[1]{E^{std}_{{#1}}}
    \newcommand{\stdbasisja}[2]{{#1} \ {#2} の標準基底}
    \stdbasis{\stdlin{\Kset}{n}}: \stdbasisja{\linsp{\mathbb{K}}}{\stdlin{\Kset}{n}}$
- $\newcommand{\stdbasiselm}[2]{e^{std(#2)}_{#1}}
    \newcommand{\stdbasiselmja}[3]{#1 \ #2 の 標準基底の要素 で添え字が #3 }
    \stdbasiselm{\stdlin{\Kset}{n}}{i}: \stdbasiselmja{\linsp{\mathbb{K}}}{\stdlin{\Kset}{n}}{i}$
- $\newcommand{\complexification}[1]{{#1}^{\Cf}}
    \newcommand{\complexificationja}[1]{\linsp{\Rf} \ #1 の複素化}
    \complexification{V}: \complexificationja{V}$
- $\newcommand{\Rlin}[1]{\mathbf{R}_{\mathrm{lin}}^{#1}}
    \newcommand{\Rlinja}[1]{#1 次元標準\linsp{\Rf}}
    \Rlin{n} := (\mathbf{R}^{n}, +_{\Rlin{n}},\cdot^{sc}_{\Rlin{n}}) : \Rlinja{n}$
- $\newcommand{\Clin}[1]{\mathbf{C}_{\mathrm{lin}}^{#1}}
    \newcommand{\Clinja}[1]{#1 次元標準\linsp{\Cf}}
    \Clin{n} := (\mathbf{C}^{n}, +_{\Clin{n}},\cdot^{sc}_{\Clin{n}}) : \Clinja{n}$
- $\newcommand{\Matset}[2]{\mathbf{M}(#1, #2)}
    \newcommand{\Matsetja}[2]{#2上の#1次正方行列のなす集合}
    \Matset{n}{K}: \Matsetja{n}{K}$
- $\newcommand{\Matlin}[2]{\mathbf{M}_{\mathrm{lin}}(#1, #2)}
    \newcommand{\Matlinja}[2]{#2上の#1次正方行列のなす\linsp{#2}}
    \Matlin{n}{K} := (\Matset{n}{K}, +_{\Matlin{n}{K}}, \scprod{\Matlin{n}{K}}): \Matlinja{n}{K}$
- $\newcommand{\MatAlg}[2]{\mathbf{M}_{\mathrm{alg}}(#1, #2)}
    \newcommand{\MatAlgja}[2]{#2上の#1次正方行列のなすK \text{-} 結合代数 }
    \MatAlg{n}{K} := (\Matset{n}{K}, +_{\MatAlg{n}{K}}, \cdot_{\MatAlg{n}{K}}, \scprod{\MatAlg{n}{K}}): \MatAlgja{n}{K}$
- $\newcommand{\signedInnerProd}[4]{<#3,#4>_{#1,#2}}
    \newcommand{\signedInnerProdja}[4]{(#1,#2)\text{-符号つき内積}}
    \signedInnerProd{p}{q}{\cdot}{\cdot}: \signedInnerProdja{p}{q}{\cdot}{\cdot}$
- $\newcommand{\complexifiedSignedInnerProd}[4]{<#3,#4>^{\Cf}_{#1,#2}}
    \newcommand{\complexifiedSignedInnerProdja}[4]{(#1,#2)\text{-符号つきエルミート内積}}
    \complexifiedSignedInnerProd{p}{q}{\cdot}{\cdot}: \complexifiedSignedInnerProdja{p}{q}{\cdot}{\cdot}$
- $\newcommand{\signedInnerProdR}[2]{\mathbf{R}^{#1,#2}_{\mathrm{lin}}}
    \newcommand{\signedInnerProdRja}[2]{符号つき内積 \signedInnerProd{p}{q}{\cdot}{\cdot} をもつ (#1+#2) 次元標準\linsp{\Rf}} 
    \signedInnerProdR{p}{q}: \signedInnerProdRja{p}{q}$
- $\newcommand{\signedInnerProdRstdbasiselm}[3]{e^{std(#3)}_{\signedInnerProdR{#1}{#2}}}
    \newcommand{\signedInnerProdRstdbasiselmja}[4]{#1 の 標準基底の要素 で添え字が #4 }
    \signedInnerProdRstdbasiselm{p}{q}{i}: \signedInnerProdRstdbasiselmja{\signedInnerProdR{p}{q}}{p}{q}{i}$
- $\newcommand{\Ggradedalg}[1]{#1\text{-}次数代数}
    \newcommand{\Ggradedalgja}[1]{#1\text{-}次数代数} 
    \Ggradedalg{G}: \Ggradedalgja{G}$
- $\newcommand{\tensoralg}[1]{T(#1)}
    \newcommand{\tensoralgja}[1]{#1上のテンソル代数} 
    \tensoralg{V}: \tensoralgja{V}$
- $\newcommand{\tensoralgbasis}[1]{\{1_{\Rf}\} \cup \left( \bigcup_{k=1}^{\infty}\{ \bigotimes^{k}_{i=1} \basiselm{V}{j_{i}}\} \right)} 
    \newcommand{\tensoralgbasisja}[1]{#1上のテンソル代数の基底} 
    \tensoralgbasis{V}: \tensoralgbasisja{V}$
- $\newcommand{\tensoralgbasiselm}[1]{T_{\Rf}(#1)}
    \newcommand{\tensoralgbasiselmja}[1]{#1上のテンソル代数の基底の要素} 
    \tensoralgbasiselm{V}: \tensoralgbasiselmja{V}$
- $\newcommand{\Cl}[1]{\mathrm{C}l(#1)}
    \newcommand{\Clja}[1]{#1上のクリフォード代数}
    \Cl{V}: \Clja{V}$
- $\newcommand{\Clpq}[2]{\mathrm{C}l_{#1,#2}}
    \newcommand{\Clpqja}[2]{#1次元#2次数のクリフォード代数}
    \Clpq{p}{q} := (\tensoralg{\Rlin{p+q}}を割ったもの) : 実クリフォード代数$
- $\newcommand{\CCl}[1]{\mathbb{Cl}(#1)}
    \CCl{V}: V上の複素クリフォード代数$
- $\newcommand{\CClp}[1]{\mathbb{Cl}_{#1}}
    \CClp{p}: 複素クリフォード代数$
- $\newcommand{\Clgrpp}[1]{G_{\mathbb{Cl}_{#1}}}
    \newcommand{\Clgrppja}[1]{\CClp{#1}のクリフォード群}
    \Clgrpp{p}: \Clgrppja{p}$

- $\newcommand{\Cmat}[1]{\mathbb{C}({#1})}
    \Cmat{p}: \Cf 行列環$
- $\newcommand{\sublinspGeneratedBy}[1]{\left\langle #1 \right\rangle_{lin}}
    \sublinspGeneratedBy{S} : Sで生成される部分空間$
- $\newcommand{\idealGeneratedBy}[1]{\left\langle #1 \right\rangle_{ideal}}
    \idealGeneratedBy{S} : Sで生成されるイデアル$
- $\newcommand{\otimeslin}[1]{\otimes^{lin}_{#1}}
    \otimeslin{\Rf}: \Rf - 線形空間のテンソル積$
- $\newcommand{\otimesalg}[1]{\otimes^{alg}_{#1}}
    \otimesalg{\Cf}: \Cf - 代数のテンソル積$
- $\newcommand{\otimeshat}{\widehat{\otimes}}
    \otimeshat: \Ggradedalg{\Ztwo}のテンソル積$ 
<!-- スタイル -->

### 1. 定義と定理

#### めも
$\Kf:=(\Kset, +_\Kf,\cdot_\Kf)$

このような「再帰」してしまっている定義は、暗黙的な記号の濫用のルールが存在しているということなので、コラムとかで紹介できるといいかもしれない。本書のテーマとして「数学書を読むときは書いてあることを信じるな」がある。

記号 $\Kf$ のもと、まず演算記号 $+_\Kf, \cdot_\Kf$ が定まり、それによって定まる三つ組を記号の濫用で$\Kf$と定義する、が正しい？

- 群
    - Z2 (Rから0,1取ってきて演算表で定義)
- 体
    - 定義
        3つ組 $\Kf:=(\Kset, +_\Kf,\cdot_\Kf)$が
        $$
        \begin{align}
            \Kset&:\text{set}\\
            +_{\Kf}&:S \times S \to S\\
                \cdot_{\Kf}&:S \times S \to S
        \end{align}
        $$
        であって、以下を満たすとき、$\Kf$を体という.
    
        - (1) $\Kset$ の任意の元  に対し, $(a+_{\Kf}b)+_{\Kf}c=a+_{\Kf}(b+_{\Kf}c)$ がなりたつ. (和の結合則)
        - (2) $\Kset$ の元 $0_{\Kf}$ で, $\Kset$ の任意の元 $a$ に対し, $a+_{\Kf}0_{\Kf}=0_{\Kf}+_{\Kf}a=a$ をみたすも のがただ 1 つある. (零元の存在)
        - (3) $\Kset$ の任意の元 $a$ に対し, $a+_{\Kf}b=b+_{\Kf}a=0$ をみたす $\Kset$ の元 $b$ がただ 1 つある. (和の逆元の存在)
        - (4) $\Kset$ の任意の元 $a, b$ に対し, $a+_{\Kf}b=b+_{\Kf}a$ がなりたつ. (和の可換則)
        - (5) $\Kset$ の任意の元 $a, b, c$ に対し, $(a \cdot_{\Kf} b) c=a \cdot_{\Kf} (b \cdot_{\Kf} c)$ がなりたつ. (積の結合則)
        - (6) $\Kset$ の 0 でない元 $1_{\Kf}$ で, $\Kset$ の任意の元 $a$ に対し, $a \cdot_{\Kf} 1_{\Kf}=1_{\Kf} \cdot_{\Kf} a=a$ をみたす ものがただ 1 つある. (積の単位元の存在)
        - (7) $\Kset$ の 0 でない任意の元 $a$ に対し, $a \cdot_{\Kf} b=b \cdot_{\Kf} a=1$ をみたす $\Kset$ の元 $b$ がた だ 1 つある. (積の逆元の存在)
        - (8) $\Kset$ の任意の元 $a, b$ に対し, $a \cdot_{\Kf} b=b \cdot_{\Kf} a$ がなりたつ. (積の可換則)
        - (9) $\Kset$ の任意の元 $a, b, c$ に対し, $(a+_{\Kf}b) c=a c+_{\Kf}b \cdot_{\Kf} c, a(b+_{\Kf}c)=a \cdot_{\Kf} b+_{K}a c$ が なりたつ. (分配則)

    - memo
        - ↑論理式で書き直す
        - $\Rfと\Cfは体の具体例です$
### 線型空間
$\Kf:=(\Kset, +_\Kf,\cdot_\Kf)$：体
3つ組$V_{\text{lin}}:=(V,+_{V_{\text{lin}}},\scprod{V_{\text{lin}}})$が
$$
\begin{align}
    V&:\text{set}\\
    +_{V_{\text{lin}}}&:S \times S \to S\\
    \scprod{V_{\text{lin}}}&:K \times S \to S
\end{align}
$$
であり、以下を満たすとき$V_{\text{lin}}:=(V, +_{V_{\text{lin}}}, \scprod{V_{\text{lin}}})$を$\linsp{\Kf}$という
- (1) $S$ の任意の元 $x, y, z$ に対し, $(x+_{V_{\text{lin}}}y)+_{V_{\text{lin}}}z=x+_{V_{\text{lin}}}(y+_{V_{\text{lin}}}z)$ がなりたつ.
- (2) $S$ の元 0 で, $S$ の任意の元 $x$ に対し, $x+_{V_{\text{lin}}}0=0+_{V_{\text{lin}}}x=x$ をみたすもの がただ 1 ある.
- (3) $S$ の任意の元 $x$ に対し, $x+_{V_{\text{lin}}}y=y+_{V_{\text{lin}}}x=0$ をみたす $S$ の元 $y$ がただ 1 つある。
- (4) $S$ の任意の元 $x, y$ に対し, $x+_{V_{\text{lin}}}y=y+_{V_{\text{lin}}}x$ がなりたつ.
- (5) $K$ の任意の元 $a$ と $S$ の任意の元 $x, y$ に対し, $a \scprod{V_{\text{lin}}}(x+_{V_{\text{lin}}}y)=a \scprod{V_{\text{lin}}} x+_{V_{\text{lin}}}a \scprod{V_{\text{lin}}} y$ がな りたつ.
- (6) $K$ の任意の元 $a, b$ と $S$ の任意の元 $x$ に対し, $(a \scprod{V_{\text{lin}}} b) x=a \scprod{V_{\text{lin}}} (b \scprod{V_{\text{lin}}} x)$ と $(a+_{V_{\text{lin}}}b) x=a \scprod{V_{\text{lin}}} x+_{V_{\text{lin}}}b \scprod{V_{\text{lin}}} x$ がなりたつ.
- (7) $S$ の任意の元 $x$ に対し, $1_{\Kf} \scprod{V_{\text{lin}}} x=x$ がなりたつ.

- memo
    - ↑論理式で書き直す
    - $\Rlin{n}$ (n次元標準\R線型空間) は具体例です
#### def. 基底
$V$ を $K$ 線形空間とし, $x_1, \ldots, x_n$ を $V$ の元とする. $x_1, \ldots, x_n$
が $V$ の基底 (basis) であるとは, $V$ の任意の元 $x$ に対し, $x=a_1 x_1+\cdots+a_n x_n$ をみたす $a=\left(\begin{array}{c}a_1 \\ \vdots \\ a_n\end{array}\right) \in K^n$ が，たた 1 つ存在することをいう.

==== この辺は本に投げても良いかも
#### def. 線型独立
$V_{lin}$ を $K$ 線形空間とし, $x_1, \ldots, x_n$ を $V$ の元とする. $x_1, \ldots, x_n$ が $\left\langle x_1, \ldots, x_n\right\rangle$ の基底であるとき， $x_1, \ldots, x_n$ は 1 次独立 (linearly independent) であるという.

#### def. 線型従属
$V$ を $K$ 線形空間とし, $x_1, \ldots, x_n$ を $V$ の元とする. $x_1, \ldots, x_n$ が $\left\langle x_1, \ldots, x_n\right\rangle$ の基底でないとき， $x_1, \ldots, x_n$ は 1 次従属 (linearly dependent) であるという.

====
#### def. 部分空間
$V$ を $K$ 線形空間とする. $W$ が $V$ の $K$ 部分空間 (subspace) で あるとは, $W$ が $V$ 部分集合であって，次の条件をみたすことである.
$$
+_{W}: W \times W \to W \\
\scprod{W}: K \times W \to W
$$
- (1) $\forall x, y \in W, x+_{W}y \in W$
- (2) $\forall k \in K, x \in W, k \scprod{W} x \in W$
- (3) $0 \in W$

#### def, 有限次元 / 無限次元
$V$ を線形空間とする. $n$ 個の元からなる $V$ の基底 $x_1, \ldots, x_n$ が 存在するとき, $V$ は有限次元 (finite dimension) であるといい, $n$ を $V$ 次元 (dimension) という. $V$ の次元を $\operatorname{dim} V$ で表す.
$V$ が有限次元でないとき, $V$ は無限 (infinite) 次元であるという.

#### def. 線型写像
$V, W$ を $K$ 線形空間とする. 写像 $f: V \rightarrow W$ が $K$ 線形写像 (linear mapping) であるとは，次の条件を満たすことをいう．
- (1) 任意の $x, y \in V$ に対し, $f(x+_{V}y)=f(x)+_{W}f(y)$ がなりたつ.
- (2) 任意の $a \in K$ と $x \in V$ に対し, $f(a \scprod{V} x)=a \scprod{W} f(x)$ がなりたつ.

#### def. 同型
$V$ と $W$ を $K$ 線形空間とする.
1. 可逆な線形写像 $f: V \rightarrow W$ を同形 (isomorphism) とよぶ.
2. 同形 $f: V \rightarrow W$ が存在するとき, $V$ と $W$ は同形 (isomorphic) である という.

↑ 逆向きの線形写像があって合成するとidになる、を定義にしたほうがいい？

#### proc. 準同型定理
- いるかも

#### def. 同値類
$$
\begin{align}
X &: 集合 \\
\sim_{R} &: 同値関係 \\
\end{align}
$$
とするとき、

$x \in X$について
$$
\eqclass{\sim_{R}}{x} := \{ y \in X \mid x \sim_{R} y\}
$$

を$x$の$\sim_{R}$についての同値類という。

$[\cdot ]_{\sim_{R}} : X \to P(X)$

#### def. 商空間
$V$ を $K$ 線形空間とし, $W$ を $V$ の $K$ 部分空間とする. 

$V$ の $W$ による商空間 (quotient space) とは, $V$ の部分集合 $V/W$ であって, 次の条件をみたすものである.

同値関係$\sim_{W}$を、
$$
\begin{align}
    x \sim_{W} y \Leftrightarrow x-y \in W
\end{align}
$$
と定める。

$$
\begin{align}
    +_{V/W}&: V/\sim_{W} \times V/\sim_{W} \to V/\sim_{W} \\
    \scprod{V/W}&: K \times V/\sim_{W} \to V/\sim_{W}
\end{align}
$$
を、
$$
\begin{align}
    \eqclass{\sim_{W}}{x} +_{V/W} \eqclass{\sim_{W}}{y} &:= \eqclass{\sim_{W}}{x+_{V}y} \\
    k \scprod{V/W} \eqclass{\sim_{W}}{x} &:= \eqclass{\sim_{W}}{k \scprod{V} x}
\end{align}
$$
で定めたとき、$V/W := (V/\sim_{W}, +_{V/W}, \scprod{V/W})$を、$V$の$W$による商空間という。

$V/W$は$K$線形空間である。

#### def. 商空間の同値類
$V$ を $K$ 線形空間とし, $W$ を $V$ の $K$ 部分空間、$V/W$を商空間とする。

$v \in V$について、$v$の$V/W$における同値類を、
$$
\eqclass{V/W}{v} := \eqclass{\sim_{W}}{v}
$$
と定める。

### 直和
TODO

### テンソル積
$\Kf:=(\Kset, +_\Kf,\cdot_\Kf) \ 体$

$V, W: \linsp{\Kf}$

$\Kset^{(V \times W)}=\{h: V \times W \rightarrow K \mid h(x, y) \neq 0$ となる $(x, y) \in V \times W$ は有限個 $\}$

$e_{x, y} \in \Kset^{(V \times W)}$ を、
$$
e_{x, y}(x, y) =
\begin{cases}
    1 & \left((x, y) =\left(x^{\prime}, y^{\prime}\right)\right) \\
    0 & \left((x, y) \neq\left(x^{\prime}, y^{\prime}\right)\right)
\end{cases}
$$
で定める。

$\Kset^{(V \times W)}は、\linsp{\Kf}$である。

$R_1, R_2, R_3 \subset \Kset^{(V \times W)}$ を、

$$
\begin{aligned}
    & R_1=\sublinspGeneratedBy{e_{x+x^{\prime}, y}-_{\Kset^{(V \times W)}}e_{x, y}-_{\Kset^{(V \times W)}}e_{x^{\prime}, y} \mid x, x^{\prime} \in V, y \in W} \\ 
    & R_2=\sublinspGeneratedBy{e_{x, y+y^{\prime}}-_{\Kset^{(V \times W)}}e_{x, y}-_{\Kset^{(V \times W)}}e_{x, y^{\prime}} \mid x \in V, y, y^{\prime} \in W} \\ 
    & R_3=\sublinspGeneratedBy{e_{a x, y}-_{\Kset^{(V \times W)}}a e_{x, y}, e_{x, a y}-_{\Kset^{(V \times W)}}a e_{x, y} \mid a \in K, x \in V, y \in W}
\end{aligned}$$

$V \otimeslin{\Kf} W := \Kset^{(V \times W)} / (R_{1}\subspadd{\Kset^{(V \times W)}}R_{2}\subspadd{\Kset^{(V \times W)}}R_{3})$

$V \otimeslin{\Kf} W$を、$V$と$W$のテンソル積という。

#### テンソル積の元
$x \in V, y \in W$について、$x \otimeslin{\Kf} y \in V \otimeslin{\Kf} W$を、
$$
    x \otimeslin{\Kf} y := \eqclass{V \otimeslin{\Kf} W}{e_{x, y}}
$$

#### テンソル積のn乗
TODO
    
### 複素化
TODO

## 環
### 環の定義
$R: 集合$
$$
\begin{align}
    +_{R}&:R \times R \to R\\
    \cdot_{R}&:R \times R \to R
\end{align}
$$
が、以下を満たすとき$(R, +_{R}, \cdot_{R})$を環という
- (1) $R$ の任意の元  に対し, $(a+_{R}b)+_{R}c=a+_{R}(b+_{R}c)$ がなりたつ. (和の結合則)
- (2) $R$ の元 $0_{R}$ で, $R$ の任意の元 $a$ に対し, $a+_{R}0_{R}=0_{R}+_{R}a=a$ をみたすも のがただ 1 つある. (零元の存在)
- (3) $R$ の任意の元 $a$ に対し, $a+_{R}b=0_{R}$ をみたす $R$ の元 $b$ がただ 1 つある. (和の逆元の存在)
- (4) $R$ の任意の元 $a, b$ に対し, $a+_{R}b=b+_{R}a$ がなりたつ. (和の可換則)
- (5) $R$ の任意の元 $a, b, c$ に対し, $(a\cdot_{R}b)\cdot_{R}c=a\cdot_{R}(b\cdot_{R}c)$ がなりたつ. (積の結合則)
- (6) $R$ の $0_{R}$ でない元 $1_{R}$ で, $R$ の任意の元 $a$ に対し, $a\cdot_{R}1_{R}=1_{R}\cdot_{R}a=a$ をみたす ものがただ 1 つある. (積の単位元の存在)
- (7) $R$ の任意の元 $a, b, c$ に対し, $a\cdot_{R}(b+_{R}c)=a\cdot_{R}b+a\cdot_{R}c, (a+_{R}b)\cdot_{R}c=a\cdot_{R}c+b\cdot_{R}c$ が なりたつ. (分配則)

### イデアル
$R: 環$
$I \subset R$ で、以下を満たすものを左イデアルという
$$
\begin{align}
    \forall a, b \in I, a+_{R}b \in I \\
    \forall a \in I, r \in R, r\cdot_{R}a \in I
\end{align}
$$
$I \subset R$ で、以下を満たすものを右イデアルという
$$
\begin{align}
    \forall a, b \in I, a+_{R}b \in I \\
    \forall a \in I, r \in R, a\cdot_{R}r \in I
\end{align}
$$
$I \subset R$ で、左イデアルでも右イデアルでもあるものを両側イデアルという

単にイデアルと言ったら、左イデアル、右イデアル、両側イデアルのいずれかを指す

### 剰余環
$R: 環, I: Rのイデアル$

同値関係$\sim_{I}$を、
$$
\begin{align}
    a \sim_{I} b \Leftrightarrow a-b \in I
\end{align}
$$
と定める。

$$
\begin{align}
    +_{R/I}&: R/\sim_{I} \times R/\sim_{I} \to R/\sim_{I} \\
    \cdot_{R/I}&: R/\sim_{I} \times R/\sim_{I} \to R/\sim_{I}
\end{align}
$$
を、
$$
\begin{align}
    \eqclass{\sim_{I}}{a} +_{R/I} \eqclass{\sim_{I}}{b} &:= \eqclass{\sim_{I}}{a+_{R}b} \\
    \eqclass{\sim_{I}}{a} \cdot_{R/I} \eqclass{\sim_{I}}{b} &:= \eqclass{\sim_{I}}{a\cdot_{R}b}
\end{align}
$$
で定めたとき、$R/I := (R/\sim_{I}, +_{R/I}, \cdot_{R/I})$を、$R$の$I$による剰余環という。



## 体
### 体の定義
$R: 環$ について、
$R$が、以下を満たすとき、$R$を体という
- (8) $R$ の 0 でない任意の元 $a$ に対し, $a\cdot_{R}b=b\cdot_{R}a=1_{R}$ をみたす $R$ の元 $b$ がた だ 1 つある. (積の逆元の存在)


## 結合代数 
### の結合代数の定義
$A: 集合, R: 環$
$$
\begin{align}
    +_{A}&:A \times A \to A \\
    \cdot_{A}&:A \times A \to A \\
    \scprod{A}&: R \times A \to A
\end{align}
$$
が、以下を満たすとき$(A, +_{A}, \cdot_{A}, \scprod{A})$を$R$-結合代数という
- (1) $A$ の任意の元  に対し, $(a+_{A}b)+_{A}c=a+_{A}(b+_{A}c)$ がなりたつ. (和の結合則)
- (2) $A$ の元 $0_{A}$ で, $A$ の任意の元 $a$ に対し, $a+_{A}0_{A}=0_{A}+_{A}a=a$ をみたすも のがただ 1 つある. (零元の存在)
- (3) $A$ の任意の元 $a$ に対し, $a+_{A}b=0_{A}$ をみたす $A$ の元 $b$ がただ 1 つある. (和の逆元の存在)
- (4) $A$ の任意の元 $a, b$ に対し, $a+_{A}b=b+_{A}a$ がなりたつ. (和の可換則)
- (5) $A$ の任意の元 $a, b, c$ に対し, $(a\cdot_{A}b)\cdot_{A}c=a\cdot_{A}(b\cdot_{A}c)$ がなりたつ. (積の結合則)
- (6) $A$ の 0 でない元 1 で, $A$ の任意の元 $a$ に対し, $a\cdot_{A}1_{A}=1_{A}\cdot_{A}a=a$ をみたす ものがただ 1 つある. (積の単位元の存在)
- (7) $A$ の任意の元 $a, b, c$ に対し, $a\cdot_{A}(b+_{A}c)=a\cdot_{A}b+a\cdot_{A}c, (a+_{A}b)\cdot_{A}c=a\cdot_{A}c+b\cdot_{A}c$ が なりたつ. (分配則)
- (8) $R$ の任意の元 $r$ と $A$ の任意の元 $a, b$ に対し, $r\scprod{A}(a+_{A}b)=r\scprod{A}a+r\scprod{A}b$ がな りたつ. (スカラー倍の分配則)
- (9) $R$ の任意の元 $r_{1}, r_{2}$ と $A$ の任意の元 $a$ に対し, $(r_{1} +_{R} r_{2})\scprod{A}a=r_{1}\scprod{A}a+r_{2}\scprod{A}a$ がなりたつ. (スカラー倍の分配則)
- (10) $R$ の任意の元 $r_{1}, r_{2}$ と $A$ の任意の元 $a$ に対し, $(r_{1} \cdot_{R} r_{2})\scprod{A}a=r_{1}\scprod{A}(r_{2}\scprod{A}a)$ がなりたつ. (スカラー倍の結合則)
- (11) $A$ の任意の元 $a$ に対し, $1_{R}\scprod{A}a=a$ がなりたつ. (スカラー倍の単位元)
- (12) $A$ の任意の元 $a, b, c$ に対し, $a\scprod{A}(b\cdot_{A}c)=(a\scprod{A}b)\cdot_{A}c$ がなりたつ. (スカラー倍の積の結合則)

(1)-(7)を考えると$(A, +_{A}, \cdot_{A})$は環である

(1)-(4), (8)-(12)を考え、$R$が体$K$であるとき$A$を$\linsp{K}$とみなせる

### 商結合代数
$R: 環$

$A: R\text{-}結合代数, I: Aのイデアル$

$A/I: Aを環とみたときのIによる剰余環$

$$
\begin{align}
    \scprod{A/I}&: R \times A/I \to A/I
\end{align}
$$
を、
$$
\begin{align}
    r\scprod{A/I}\eqclass{\sim_{I}}{a} &:= \eqclass{\sim_{I}}{r\scprod{A}a}
\end{align}
$$
で定めたとき、$A/I := (A/\sim_{I}, +_{A/I}, \cdot_{A/I}, \scprod{A/I})$を、$A$の$I$による商結合代数という。

### 自由代数
TODO: 自由代数ならば生成系上の写像があれば代数準同型が一意に定まる、をやる時に戻ってくる

### テンソル代数
$\Kf: 体, V: \linsp{\Kf}$

$$
\tensoralg{V} := \bigoplus_{n=0}^{\infty} V^{\otimeslin{\Kf} n} \hspace{40pt} (\text{ただし、}V^{\otimeslin{\Kf} 0} := \Kf)
$$

を、$V$のテンソル代数という。

#### テンソル代数の基底
$\Kf := (\Kset, +_\Kf,\cdot_\Kf) \ 体$

$\stdlin{\Kset}{n}: \stdlinja{\mathbf{\Kf}}{n}$

$\tensoralg{\stdlin{\Kset}{n}}: \tensoralgja{\stdlin{\Kset}{n}}$

$\stdbasiselm{\stdlin{\Kset}{n}}{1}, \dots ,\stdbasiselm{\stdlin{\Kset}{n}}{n} \in \stdbasis{\Kset}{n}$とするとき、

$$
\basis{\tensoralg{\stdlin{\Kset}{n}}} := \{ 1_{\Kf} \} \cup \{ \stdbasiselm{\stdlin{\Kset}{n}}{i_1} \otimeslin{\Kf} \cdots \otimeslin{\Kf} \stdbasiselm{\stdlin{\Kset}{n}}{i_m} \mid m \in \Zone, \ i_1, \dots, i_m \in \{1, \dots, n\} \}
$$

### クリフォード代数
#### $\Rlinja{n}$
$\R^{n} := \R \times \cdots \times \R$ に対して
$$
\begin{align}
    +_{\Rlin{n}}&:\R^{n} \times \R^{n} \to \R^{n} \\
    \scprod{\Rlin{n}}&: \R \times \R^{n} \to \R^{n}
\end{align}
$$
を、
$$
\begin{align}
    \forall x=, y \in \R^{n}, x +_{\Rlin{n}} y &:= (x_1 +_{\R} y_1, \ldots, x_n +_{\R} y_n) \\
    \forall a \in \R, x \in \R^{n}, a \scprod{\Rlin{n}} x &:= (a \cdot_{\R} x_1, \ldots, a \cdot_{\R} x_n)
\end{align}
$$
と定めたとき、$\Rlin{n} := (\R^{n}, +_{\R^{n}}, \scprod{\R^{n}})$を、n次元標準$\R$-線型空間という。

### $\signedInnerProdja{p}{q}{\cdot}{\cdot}$
$\R^{n} := \R \times \cdots \times \R$ に対して

$\signedInnerProd{p}{q}{\cdot}{\cdot}:\R^{n} \times \R^{n} \to \R$ を、

$$
\begin{align}
    \forall x, y \in \R^{n}に対して\  \signedInnerProd{p}{q}{x}{y} &:= \sum_{i=1}^{p} x_i\cdot_{\Rf} y_i - \sum_{i=p+1}^{n} x_i\cdot_{\Rf} y_i
\end{align}
$$

と定めたとき、$\signedInnerProd{p}{q}{\cdot}{\cdot}$を、$\R^{n}$上の$\signedInnerProdja{p}{q}{\cdot}{\cdot}$という。

TODO:
- $\signedInnerProdR{p}{q}$が定義できる
- $Cl_{p,q}$ : ($\R^{n}_{p,q}$の自由代数の商結合代数)
    - $I := \left(\{v \cdot v - \signedInnerProd{p}{q}{v}{v} \mid v \in \R^{n}_{p,q} \}から生成される両側イデアル\right)$
    - $Cl_{p,q} := \tensoralg{\signedInnerProdR{p}{q}}/I$
- $Cl_{0,1}$の基底
    - $\{ (\stdbasiselm{\signedInnerProdR{0}{1}}{1})^{\otimes 0}, (\stdbasiselm{\signedInnerProdR{0}{1}}{1})^{\otimes 1}, \cdots \} \subset \tensoralg{\signedInnerProdR{p}{q}}$は、基底
    - $l \in Cl_{0,1}$は、$l = r_{even} \scprod{Cl_{0,1}} \eqclass{Cl_{0,1}}{(\stdbasiselm{\signedInnerProdR{0}{1}}{1})^{\otimes 0}} - r_{odd} \scprod{Cl_{0,1}} \eqclass{Cl_{0,1}}{(\stdbasiselm{\signedInnerProdR{0}{1}}{1})^{\otimes 1}}$
        - 証明はone note $Cl_{1} \cong \Cf$ 参照
    - $\{ \eqclass{Cl_{0,1}}{(\stdbasiselm{\signedInnerProdR{0}{1}}{1})^{\otimes 0}},  \eqclass{Cl_{0,1}}{(\stdbasiselm{\signedInnerProdR{0}{1}}{1})^{\otimes 1}}\}$
        が$Cl_{0,1}$の基底であることを示す
        - 証明はone note $Cl_{1} \cong \Cf$ 参照
- $Cl_{0,2}$の基底
    - 照明は、スピン幾何学参照
- スピン幾何学 補題1.1
    - $ \mathrm{Cl}_{n, 0} \otimes \mathrm{Cl}_{0,2} \cong \mathrm{Cl}_{0, n+2}, \quad \mathrm{Cl} l_{0, n} \otimes \mathrm{Cl}_{2,0} \cong \mathrm{Cl}_{n+2,0} $
    - これを複素化する
        - $ \mathrm{Cl}_{p, q} \otimes_{\mathbb{R}} \Cf は、 \mathbb{Cl}_{p+q}$ になる
- スピン幾何学に従って $\mathbb{C}$-行列環との同型までは行ける？
    - 命題1.10 証明ミスってる気がするから自分たちの証明を参照する
- 基底の記号を定める

### G-次数代数
#### Z2-次数代数

### 行列環

- 結合代数 (環R上の結合代数)
    - 剰余環: (「環上の加群」に従う)
    - 商結合代数
        - 親の環と剰余環に同じスカラー倍がwell-definedであることを言う
    - 自由代数
    - G-次数代数
    - Z2-次数代数
        - 超代数の別名
    - テンソル代数は自由代数でZ2-次数代数
- 行列環
- クリフォード代数 (符号数つき内積付き$R^n$のテンソル代数の商代数)
        
### 2. イジング模型の分配関数の計算
- その先の計算 (イジング模型の分配関数 => $ST:\R^{2^{n}\times 2^{n}}$これの固有値を計算する)
    - 「イジング模型と厳密解 (伊達悦朗)」
    - 「ホロノミック量子場」付録A ?

<!-- ## 構成案(2: 線形代数 一般論から 入る
- 線形空間 (体K上の加群)
    - テンソル積 (線型空間の直積からの双線形写像を使って商空間)
- 結合代数 (環R上の結合代数)
    - テンソル代数 ($R^n$の自由代数)
- クリフォード代数 (符号数つき内積付き$R^n$のテンソル代数の商代数)
    - 符号数つき内積っぽい二項演算を定義する (あんまり名前もつけずに記号として定める) 
    - $Cl_{p.q}$から定める -->

# Notes

## クリフォード代数 - 行列環との同型

### 示したい命題
- $m\in\Zpos \\
    \CClp{2m+1} \cong \Cmat{2^{m}} \oplus \Cmat{2^{m}} \\
    \CClp{2m+2} \cong \Cmat{2^{m+1}}$
    - $m\in\Zpos \\
        \CClp{m+2} \cong \CClp{m} \otimesalg{\Cf} \CClp{2}$
        - $n\in\Zpos \\
            \Clpq{n}{0} \otimesalg{\Rf} \Clpq{0}{2} \cong \Clpq{0}{n+2},
            \quad
            \Clpq{0}{n} \otimesalg{\Rf} \Clpq{2}{0} \cong \Clpq{n+2}{0}
            $
        

## ホロノミック量子場
### TODO/メモ

- 行列の主平方根について存在を示す必要あり https://ja.wikipedia.org/wiki/%E8%A1%8C%E5%88%97%E3%81%AE%E5%B9%B3%E6%96%B9%E6%A0%B9
    - semipositiveであることを示す
- 自由エネルギー $f$は、系全体の自由エネルギーの格子点ごとの平均という意味

$V = V_{1}^{1/2}V_{2}V_{1}^{1/2}$

$Z_{MN}(K_{1}, K_{2}) = tr(V^{N})$

$V$の最大固有値を$\lambda_{0,M}$と書く時、

$$
-\beta f=\lim _{M, N \rightarrow \infty} \frac{1}{M N} \log Z_{MN}(K_{1}, K_{2})=\lim _{M \rightarrow \infty} \frac{1}{M} \log \lambda_{0, M}
$$

が成り立つので、Vの固有値を求めたい。

$\sigma_k^x := I \otimes \cdots \otimes \stackrel{k\text{th}}{\sigma^x} \otimes \cdots \otimes I$

$\sigma_k^y := I \otimes \cdots \otimes \stackrel{k\text{th}}{\sigma^y} \otimes \cdots \otimes I$

$\sigma_k^z := I \otimes \cdots \otimes \stackrel{k\text{th}}{\sigma^z} \otimes \cdots \otimes I$

$V_1=\exp K_1\left(\sigma_1^z \sigma_2^z+\sigma_2^z \sigma_3^z+\cdots+\sigma_M^z \sigma_1^z\right)$

$V_2=\left(2 \sinh 2 K_2\right)^{\frac{M}{2}} \exp K_2^*\left(\sigma_1^x+\sigma_2^x+\cdots+\sigma_M^x\right)$

$\mathcal{F} := (\Cf^{2})^{\otimes M}$

$Z_m := \sigma_1^x \cdots \sigma_{m-1}^x \sigma_m^z$

$Y_m := \sigma_1^x \cdots \sigma_{m-1}^x \sigma_m^y$

$K_{1}^{*} := -\frac{1}{2}\log(\tanh K_{1}) \Leftrightarrow \sinh{K_{1}}\sinh{K_{1}^{*}} = 1$

$K_{2}^{*} := -\frac{1}{2}\log(\tanh K_{2}) \Leftrightarrow \sinh{K_{2}}\sinh{K_{2}^{*}} = 1$

$c_i := \cosh 2 K_i, \quad s_i := \sinh 2 K_i$,

$c_i^* := \cosh 2 K_i^*, \quad s_i^* := \sinh 2 K_i^*$

$\varepsilon := \sigma_1^x \cdots \sigma_M^x = (\sqrt{-1})^M Z_1 Y_1 \cdots Y_M Y_M$

とおくと、

$$
V_{1}=\exp \left(\sqrt{-1} K_1\left(Y_1 Z_2+Y_2 Z_3+\cdots-\varepsilon Y_M Z_1\right)\right)
$$

$$
V_{2}=\left(2 s_2\right)^{\frac{M}{2}} \exp \left(\sqrt{-1} K_2^*\left(Z_1 Y_1+Z_2 Y_2+\cdots+Y_M Y_M\right)\right)
$$

と表せる

### Clifford群

Claim.
$$
\text{End}((\Cf^{2})^{\otimes M}) = \MatAlg{2^{M}}{\Cf} \congasalg{\Cf} \CClp{2M}
$$
Proof. スピン幾何学 定理 1.3

---
($\signedInnerProdR{2M}{0} は、\CClp{2M} の台線型空間$)

$\signedInnerProdR{2M}{0} \supset \{\signedInnerProdRstdbasiselm{2M}{0}{1}, \dots, \signedInnerProdRstdbasiselm{2M}{0}{2M} \}$ を正規直交基底とするとき、$\CClp{2M}$ の部分空間として

$$
\complexification{(\signedInnerProdR{2M}{0})} = \mathbb{C} \scprod{\CClp{2M}} \eqclass{\CClp{2M}}{\signedInnerProdRstdbasiselm{2M}{0}{1}} \oplus \cdots \oplus \mathbb{C} \eqclass{\CClp{2M}}{\signedInnerProdRstdbasiselm{2M}{0}{2M}}
$$

に対して、

$$
\Clgrpp{2M} := \left\{ g \in \CClp{2M} \mid gは可逆 \land \left(\forall x \in \complexification{(\signedInnerProdR{2M}{0})} \text{ に対して、 } g \cdot_{\CClp{2M}} x \cdot_{\CClp{2M}} g^{-1} \in \complexification{(\signedInnerProdR{2M}{0})} \right)  \right\}
$$
を$\Clgrppja{2M}$という

$g \in \Clgrpp{2M}$ に対して、
$$
T_{g}: \CClp{2M} \to \CClp{2M} \\
T_{g}(x) := g \cdot_{\CClp{2M}} x \cdot_{\CClp{2M}} g^{-1}
$$
を定める。

---
Claim
$$
\complexification{(\signedInnerProdR{2M}{0})} の内積は \complexifiedSignedInnerProd{2M}{0}{v}{w} := (TODO)
$$
Proof. (TODO)

---

Claim
$g \in \Clgrpp{2M}$ に対して、
$$
\forall v, w \in \complexification{(\signedInnerProdR{2M}{0})} (\complexifiedSignedInnerProd{2M}{0}{v}{w} = \complexifiedSignedInnerProd{2M}{0}{T_{g} \mid_{\complexification{(\signedInnerProdR{2M}{0})}}(v)}{T_{g} \mid_{\complexification{(\signedInnerProdR{2M}{0})}}(w)})

$$

Proof. (TODO)

---

def. $O\left(\complexification{(\signedInnerProdR{2M}{0})}\right)
    := \{ T は \complexification{(\signedInnerProdR{2M}{0})}上の線形写像
        \mid
        \forall v, w \in \complexification{(\signedInnerProdR{2M}{0})} (\complexifiedSignedInnerProd{2M}{0}{v}{w} = \complexifiedSignedInnerProd{2M}{0}{T(v)}{T(w)}) \}$

---
$Claim$

$T_{g}$と$g$は定数倍を除いて一対一対応する

めも : 全単射よりも強いなんらかの関係があるかも？

乗法群$\Cabel$の$\Clgrpp{2M}$への作用、
$$
\begin{align}
    \Cabel \times \Clgrpp{2M} &\to \Clgrpp{2M} \\
    (c, g) &\mapsto c \cdot_{\CClp{2M}} g
\end{align}
$$
を考える時、
$$
全単射 \ f: \{ T_{g} \mid g \in \Clgrpp{2M} \} \to \Cabel \backslash \Clgrpp{2M} \ が存在する。
$$


Proof. (TODO)

---

めも

ただし、上記 $\cdot_{\CClp{2M}}$は、$\Cabel$を\CClp{2M}に乗法群で埋め込んだものと見ている

R^2M -> T(R^2M) -> Cl(R^2M) -> Cl(R^2M) $\otimes \Cf \hookleftarrow$ $\Cabel$

---

# 対角化の計算 (ホロノミック量子場 付録B)

$\mathcal{F} := (\Cf^{2})^{\otimes M}$

$\sigma_k^x := I \otimes \cdots \otimes \stackrel{k\text{th}}{\sigma^x} \otimes \cdots \otimes I \in \text{End}(\mathcal{F})$

$\sigma_k^y := I \otimes \cdots \otimes \stackrel{k\text{th}}{\sigma^y} \otimes \cdots \otimes I \in \text{End}(\mathcal{F})$

$\sigma_k^z := I \otimes \cdots \otimes \stackrel{k\text{th}}{\sigma^z} \otimes \cdots \otimes I \in \text{End}(\mathcal{F})$

$V_1:=\exp K_1\left(\sigma_1^z \sigma_2^z+\sigma_2^z \sigma_3^z+\cdots+\sigma_M^z \sigma_1^z\right) \in \text{End}(\mathcal{F})$

$V_2:=\left(2 \sinh 2 K_2\right)^{\frac{M}{2}} \exp K_2^*\left(\sigma_1^x+\sigma_2^x+\cdots+\sigma_M^x\right) \in \text{End}(\mathcal{F})$

$Z_m := \sigma_1^x \cdots \sigma_{m-1}^x \sigma_m^z \in \text{End}(\mathcal{F}) \ ただし、Z_{1} := \sigma_1^z \quad (ホロノミック量子場ではp_{m})$

正し、$Z_{M+1} := Z_{1}$

$Y_m := \sigma_1^x \cdots \sigma_{m-1}^x \sigma_m^y \in \text{End}(\mathcal{F}) \ ただし、Y_{1} := \sigma_1^y \quad (ホロノミック量子場ではq_{m})$

正し、$Y_{M+1} := Y_{1}$

$K_{1}^{*} := -\frac{1}{2}\log(\tanh K_{1}) \Leftrightarrow \sinh{K_{1}}\sinh{K_{1}^{*}} = 1$

$K_{2}^{*} := -\frac{1}{2}\log(\tanh K_{2}) \Leftrightarrow \sinh{K_{2}}\sinh{K_{2}^{*}} = 1$

$c_i := \cosh 2 K_i, \quad s_i := \sinh 2 K_i$,

$c_i^* := \cosh 2 K_i^*, \quad s_i^* := \sinh 2 K_i^*$

$\varepsilon := \sigma_1^x \cdots \sigma_M^x = (\sqrt{-1})^M Z_1 Y_1 \cdots Y_M Y_M \in \text{End}(\mathcal{F})$

---

Def. $\mathcal{F}^{(\pm)}$

$\mathcal{F^{+}}:=\{f\in\mathcal{F} \mid \varepsilon f=+f\}$

$\mathcal{F^{-}}:=\{f\in\mathcal{F} \mid \varepsilon f=-f\}$


---
$Claim.$

$n \in \Zpos について、\\$
$$
\begin{align*}

\end{align*}
$$

---

Claim. 
$$
\begin{align*}
V_1 &= \exp \sqrt{-1} K_1\left(Y_1 Z_2+Y_2 Z_3+\cdots-\varepsilon Y_M Z_1\right) \\
V_2 &= \left(2 s_2\right)^{\frac{M}{2}} \exp\sqrt{-1}  K_2^*\left(Z_1 Y_1+Z_2 Y_2+\cdots+Y_M Y_M\right)
\end{align*}
$$

Proof.
$$
\begin{align*}
Z_m :&= \sigma_1^x \cdots \sigma_{m-1}^x \sigma_m^z \ ただし、Z_{1} := \sigma_1^z \\
Y_m :&= \sigma_1^x \cdots \sigma_{m-1}^x \sigma_m^y \ ただし、Y_{1} := \sigma_1^y \\
\end{align*}
$$

より、
$$
\begin{align*}
Z_1 Y_1 &= \sigma_1^z \sigma_1^y = -\sqrt{-1} \sigma_1^x \\
2 \
Z_m Y_m &= (\sigma_1^x \cdots \sigma_{m-1}^x \sigma_m^z) (\sigma_1^x \cdots \sigma_{m-1}^x \sigma_m^y) \\
&= \left(
    (\stackrel{1\text{th}}{\sigma^x} \otimes \cdots \otimes I)
    \cdot_{\text{End}(\mathcal{F})} \cdots \cdot_{\text{End}(\mathcal{F})}
    (I \otimes \cdots \otimes \stackrel{m-1\text{th}}{\sigma^x} \otimes \cdots \otimes I)
    \cdot_{\text{End}(\mathcal{F})}
    (I \otimes \cdots \otimes \stackrel{m\text{th}}{\sigma^z} \otimes \cdots \otimes I)
\right)
\cdot_{\text{End}(\mathcal{F})}
\left(
    (\stackrel{1\text{th}}{\sigma^x} \otimes \cdots \otimes I)
    \cdot_{\text{End}(\mathcal{F})} \cdots \cdot_{\text{End}(\mathcal{F})}
    (I \otimes \cdots \otimes \stackrel{m-1\text{th}}{\sigma^x} \otimes \cdots \otimes I)
    \cdot_{\text{End}(\mathcal{F})}
    (I \otimes \cdots \otimes \stackrel{m\text{th}}{\sigma^y} \otimes \cdots \otimes I)
\right) \\
&= \overbrace{\sigma^x \cdot_{\text{End}(\Cf^{2})} \sigma^x}^{1\text{th}}
    \otimes \cdots \otimes
\overbrace{\sigma^x \cdot_{\text{End}(\Cf^{2})} \sigma^x}^{m-1\text{th}}
\otimes
\overbrace{\sigma^z \cdot_{\text{End}(\Cf^{2})} \sigma^y}^{m\text{th}}
\otimes \cdots \otimes
I \\
&= \overbrace{I}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{I}^{m-1\text{th}}
\otimes
\overbrace{-\sqrt{-1} \sigma^x}^{m\text{th}}
\otimes \cdots \otimes
I
\ \left(\because パウリ行列の性質 \right) \\
&= -\sqrt{-1} \sigma_{m}^{x}
\end{align*}
$$
同様に、
$$
\begin{align*}
Y_1 Z_2 &= \sigma_1^y (\sigma_1^x \sigma_2^z) \\
&= (\sigma_1^y \sigma_1^x) \sigma_2^z \\
&= -\sqrt{-1} \sigma_1^z \sigma_2^z \\
Y_m Z_{m+1} &= (\sigma_1^x \cdots \sigma_{m-1}^x \sigma_m^y) (\sigma_1^x \cdots \sigma_{m}^x \sigma_{m+1}^z) \\
&= \overbrace{\sigma^x \
\cdot_{\text{End}(\Cf^{2})} \sigma^x}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{\sigma^x \cdot_{\text{End}(\Cf^{2})} \sigma^x}^{m-1\text{th}}
\otimes
\overbrace{\sigma^y \cdot_{\text{End}(\Cf^{2})} \sigma^x}^{m\text{th}}
\otimes
\overbrace{\sigma^z}^{m+1\text{th}}
\otimes \cdots \otimes
I
\\
&= \overbrace{I}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{I}^{m-1\text{th}}
\otimes
\overbrace{-\sqrt{-1} \sigma^z}^{m\text{th}}
\otimes
\overbrace{\sigma^z}^{m+1\text{th}}
\otimes \cdots \otimes
I
 \\
&= -\sqrt{-1} \sigma_{m}^{z} \sigma_{m+1}^{z} \\
\end{align*}
$$

また、
$$
\begin{align*}
- \varepsilon Y_M Z_1 :&= - (\sigma_1^x \cdots \sigma_M^x) (\sigma_1^x \cdots \sigma_{M-1}^x \sigma_M^y) \sigma_1^z \\
&= - \left(
    \overbrace{
    \left(\sigma^x \cdot_{\text{End}(\Cf^{2})} \sigma^x \right) \cdot_{\text{End}(\Cf^{2})} \sigma^z
    }^{1\text{th}}
    \otimes \cdots \otimes
    \overbrace{
        \sigma^x \cdot_{\text{End}(\Cf^{2})} \sigma^x
    }^{M-1\text{th}}
    \otimes
    \overbrace{
        \sigma^x \cdot_{\text{End}(\Cf^{2})} \sigma^y
    }^{M\text{th}}
\right) \\
&= - \left(
    \overbrace{\sigma^z}^{1\text{th}}
    \otimes \cdots \otimes
    \overbrace{I}^{M-1\text{th}}
    \otimes
    \overbrace{\sqrt{-1} \sigma^z}^{M\text{th}}
\right) \\
&= -\sqrt{-1} \sigma_{M}^{z} \sigma_{1}^{z}
\end{align*}
$$

より、
$$
\begin{align*}
Z_1 Y_2+Z_2 Z_3+\cdots+Y_M Y_M = -\sqrt{-1} \left(
    \sigma_1^z \sigma_2^z + \sigma_2^z \sigma_3^z + \cdots + \sigma_M^z \sigma_1^z
\right) \\
\end{align*}
$$
$$
\begin{align*}
Y_1 Z_2+Y_2 Z_3+\cdots-\varepsilon Y_M Z_1
&= (-\sqrt{-1} \sigma_1^z \sigma_2^z) + (-\sqrt{-1} \sigma_2^z \sigma_3^z) + \cdots + (-\sqrt{-1} \sigma_M^z \sigma_1^z) \\
&= -\sqrt{-1} \left(
    \sigma_1^z \sigma_2^z + \sigma_2^z \sigma_3^z + \cdots
        +\sigma_M^z \sigma_1^z
\right) \\
\end{align*}
$$
$Q.E.D.$

Claim

$1 \leq m - 1 \leq M$ に対して、
$$
\begin{align*}
\varepsilon Z_{m} Z_{m+1} = Z_{m} Z_{m+1} \varepsilon
\end{align*}
$$
かつ、
$$
\begin{align*}
\varepsilon Y_{M} Z_{1} = Y_{M} Z_{1} \varepsilon
\end{align*}
$$
Proof
$$
\begin{align*}
1 \leq m \leq M - 1 に対して、 \\
\varepsilon Z_{m} Z_{m+1}
&= (\sigma_1^x \cdots \sigma_M^x) (\sigma_1^x \cdots \sigma_{m-1}^x \sigma_{m}^y) (\sigma_1^x \cdots \sigma_{m}^x \sigma_{m+1}^z) \\
&= \overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \left(
        \sigma^x \cdot_{\text{End}(\Cf^{2})} \sigma^x
    \right)
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \left(
        \sigma^x \cdot_{\text{End}(\Cf^{2})} \sigma^x
    \right)
}^{m-1\text{th}}
\otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \left(
        \sigma^y \cdot_{\text{End}(\Cf^{2})} \sigma^x
    \right)
}^{m\text{th}}
\otimes
\overbrace{
    \sigma^x \cdot_{\text{End}(\Cf^{2})} \sigma^z
}^{m+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
}^{M-1\text{th}}
\otimes
\overbrace{
    \sigma^x
}^{M\text{th}}
\end{align*}
$$
$ \overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \left(
        \sigma^y \cdot_{\text{End}(\Cf^{2})} \sigma^x
    \right)
}^{m\text{th}}
= - \left(\sigma^y \cdot_{\text{End}(\Cf^{2})} \sigma^x \right) \cdot_{\text{End}(\Cf^{2})} \sigma^x
$

$ \overbrace{
    \sigma^x \cdot_{\text{End}(\Cf^{2})} \sigma^z
}^{m+1\text{th}}
= - \sigma^z \cdot_{\text{End}(\Cf^{2})} \sigma^x
$

この２つ以外の項は、入れ替えても符号が変わらないので、

$$
\begin{align*}
\varepsilon Z_{m} Z_{m+1} = Z_{m} Z_{m+1} \varepsilon
\end{align*}
$$

また、
$$
\begin{align*}
\varepsilon Y_{M} Z_{1} &= (\sigma_1^x \cdots \sigma_M^x) (\sigma_1^x \cdots \sigma_{M-1}^x \sigma_M^y) \sigma_1^z \\
&= \overbrace{
    \sigma^x \cdot_{\text{End}(\Cf^{2})} \left( \sigma^x \cdot_{\text{End}(\Cf^{2})} \sigma^z  \right)
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x \cdot_{\text{End}(\Cf^{2})} \sigma^x
}^{M-1\text{th}}
\otimes
\overbrace{
    \sigma^x \cdot_{\text{End}(\Cf^{2})} \sigma^y
}^{M\text{th}}
\end{align*}
$$

$ \overbrace{
    \sigma^x \cdot_{\text{End}(\Cf^{2})} \left( \sigma^x \cdot_{\text{End}(\Cf^{2})} \sigma^z  \right)
}^{1\text{th}}
= - \left( \sigma^x \cdot_{\text{End}(\Cf^{2})} \sigma^z  \right) \cdot_{\text{End}(\Cf^{2})} \sigma^x
$

$ \overbrace{
    \sigma^x \cdot_{\text{End}(\Cf^{2})} \sigma^y
}^{M\text{th}}
= - \sigma^y \cdot_{\text{End}(\Cf^{2})} \sigma^x
$

この２つ以外の項は、入れ替えても符号が変わらないので、
$$
\begin{align*}
\varepsilon Y_{M} Z_{1} = Y_{M} Z_{1} \varepsilon
\end{align*}
$$

$Q.E.D.$

---
Claim.
$$
V_{1} \mid_{\mathcal{F}^{(\pm)}}
= \left(
    \exp \left(
            \sqrt{-1} K_1\left(Y_1 Z_2+Y_2 Z_3+\cdots \mp Y_M Z_1\right)
    \right)
\right) \mid_{\mathcal{F}^{(\pm)}}
$$

Proof
$$
\begin{align*}
V_{1} = \exp \left(
    \sqrt{-1} K_1\left(Y_1 Z_2+Y_2 Z_3+\cdots-\varepsilon Y_M Z_1\right)
\right)
&= \sum_{n=0}^{\infty} \frac{1}{n!} \left(\sqrt{-1} K_1\left(Y_1 Z_2+Y_2 Z_3+\cdots-\varepsilon Y_M Z_1\right)\right)^{n} \\
\end{align*}
$$
$ n \in \Z $ について、$\left(\sqrt{-1} K_1\left(Y_1 Z_2+Y_2 Z_3+\cdots-\varepsilon Y_M Z_1\right)\right)^{n}$ を展開したときの各項は全て、一番右に$(- \varepsilon)^{k} (1 \leq k \leq M)$ がかかっている形になっている。 $(\because 上記Claim)$

各項が、$\sigma \in \text{End}(\mathcal{F})$を用いて、$\sigma \cdot (- \varepsilon)^{k}$と書けるので、$f^{(\pm)} \in \mathcal{F}^{(\pm)}$ について、
$$
\begin{align*}
\left( \sigma \cdot (- \varepsilon)^{k} \right) \cdot f^{(\pm)} 
&= \sigma \cdot (- \varepsilon)^{k-1} \cdot \left(- \varepsilon \cdot f^{(\pm)} \right) \\
&= \sigma \cdot (- \varepsilon)^{k-1} \cdot \left((-1) \cdot (\pm 1_{\text{End}(\mathcal{F})}) \cdot f^{(\pm)} \right) \\
&= \sigma \cdot (- \varepsilon)^{k-2}
    \cdot
    \left((-1) \cdot \varepsilon \right)
    \cdot
    \left(
        (-1) \cdot (\pm 1_{\text{End}(\mathcal{F})}) \cdot f^{(\pm)}
    \right) \\
&= \sigma \cdot (- \varepsilon)^{k-2}
    \cdot
    \left(
        (-1)^{2} \cdot (\varepsilon \cdot \pm 1_{\text{End}(\mathcal{F})}) \cdot f^{(\pm)}
    \right) \\
&= \sigma \cdot (- \varepsilon)^{k-2}
    \cdot
    \left(
        (-1)^{2} \cdot (\pm 1_{\text{End}(\mathcal{F})} \cdot \varepsilon) \cdot f^{(\pm)}
    \right) \\
&= \sigma \cdot (- \varepsilon)^{k-2}
    \cdot
    \left(
        (-1)^{2} \cdot \pm 1_{\text{End}(\mathcal{F})} \cdot (\varepsilon \cdot f^{(\pm)})
    \right) \\
&= \sigma \cdot (- \varepsilon)^{k-2}
    \cdot
    \left(
        (-1)^{2} \cdot \pm 1_{\text{End}(\mathcal{F})} \cdot (\pm 1_{\text{End}(\mathcal{F})} \cdot f^{(\pm)})
    \right) \\
&= \sigma \cdot (- \varepsilon)^{k-2}
    \cdot
    \left(
        (-1)^{2} \cdot (\pm 1_{\text{End}(\mathcal{F})})^{2} \cdot f^{(\pm)}
    \right) \\
&= \sigma \cdot (- \varepsilon)^{k-2}
    \cdot
    \left(
        (\mp 1_{\text{End}(\mathcal{F})})^{2} \cdot f^{(\pm)}
    \right) \\
&= \cdots \\
&= \sigma \cdot (- \varepsilon) \cdot \left((\mp 1_{\text{End}(\mathcal{F})})^{k-1} \cdot f^{(\pm)} \right) \\
&= \sigma \cdot \left((\mp 1_{\text{End}(\mathcal{F})})^{k} \cdot f^{(\pm)} \right) \\
&= \left( \sigma \cdot (\mp 1_{\text{End}(\mathcal{F})})^{k} \right) \cdot f^{(\pm)} \\
\end{align*}
$$

よって、

$$
\begin{align*}
\sigma \cdot (- \varepsilon)^{k} = \sigma \cdot (\mp 1_{\text{End}(\mathcal{F})})^{k}
\end{align*}
$$

$\mp 1_{\text{End}(\mathcal{F})}$ は、任意の$\sigma \in \text{End}(\mathcal{F})$と可換なので、
$$
\left(\sqrt{-1} K_1\left(Y_1 Z_2+Y_2 Z_3+\cdots-\varepsilon Y_M Z_1\right)\right)^{n}
= \left(\sqrt{-1} K_1\left(Y_1 Z_2+Y_2 Z_3+\cdots \mp 1_{\text{End}(\mathcal{F})} Y_M Z_1\right)\right)^{n}
$$

$$
\begin{align*}
V_{1}^{(\pm)}
&= V_{1} \mid_{\mathcal{F}^{(\pm)}} \\
&= \left(
    \sum_{n=0}^{\infty} \frac{1}{n!} \left(\sqrt{-1} K_1\left(Y_1 Z_2+Y_2 Z_3+\cdots-\varepsilon Y_M Z_1\right)\right)^{n} \\
\right) \mid_{\mathcal{F}^{(\pm)}} \\
&= \left(
    \sum_{n=0}^{\infty} \frac{1}{n!} \left(\sqrt{-1} K_1\left(Y_1 Z_2+Y_2 Z_3+\cdots \mp 1_{\text{End}(\mathcal{F})} Y_M Z_1\right)\right)^{n} \\
\right) \mid_{\mathcal{F}^{(\pm)}} \\
&= \left(
    \exp \left(
        \sqrt{-1} K_1\left(Y_1 Z_2+Y_2 Z_3+\cdots \mp 1_{\text{End}(\mathcal{F})} Y_M Z_1\right)
    \right)
\right) \mid_{\mathcal{F}^{(\pm)}} \\
\end{align*}
$$

よって、Q.E.D.

---
def.

$H_{1}^{(\pm)} := Y_1 Z_2+Y_2 Z_3+\cdots \mp 1_{\text{End}(\mathcal{F})} Y_M Z_1$

$V_{1}^{(\pm)} : \text{End}(\mathcal{F}^{(\pm)})$ を、
$$
V_{1}^{(\pm)} := \exp \left(
    \sqrt{-1} K_1 H_{1}^{(\pm)}
\right)
$$
で、定める。

また、

$H_{2} := Z_1 Y_1+Z_2 Y_2+\cdots+Y_M Y_M$

$V_{2}=\left(2 s_2\right)^{\frac{M}{2}} \exp \left(\sqrt{-1} K_2^* H_{2}\right)
$

と、書く。

---

$Claim$

$$
V_{1}^{(\pm)} := \exp \left(
    \sqrt{-1} K_1\left(Y_1 Z_2+Y_2 Z_3+\cdots \mp 1_{\text{End}(\mathcal{F})} Y_M Z_1\right)
\right) \in \Clgrpp{2M}
$$

$Proof$

TODO: 一般論(exp(二次式)は〜云々)として示す？

---

$Claim$ (付録B) ベイカー–キャンベル–ハウスドルフの公式　https://ja.wikipedia.org/wiki/%E4%BA%A4%E6%8F%9B%E5%AD%90
$$
e^X Y e^{-X}=e^{\operatorname{ad}(X)}(Y)
$$

TODO:
- 多様体はいらなさそう
- リー群とリー環で十分そう

---
$def.$

$\mathcal{M} := \{-M, \dots, -2, -1, 1, 2, \dots, M\}$

と定める。

Def. $\widehat{Z}_{\mu}^{(\pm)} \quad \widehat{Y}_{\mu}$

$\mu \in \mathcal{M}$ について、

$$
\begin{align*}
\widehat{Z}_{\mu}^{(\pm)}
:=&
\sum_{j=1}^{M} \left(
    \left(
        \begin{cases}
            +1 & \text{if} \ j \not= 1 \\
            \mp 1 & \text{if} \ j = 1 \\
        \end{cases}
    \right)
    \cdot
    Z_{j}
    \exp \left(
        -
        \sqrt{-1}
        j
        \frac{
            2
            \pi
            \mu
        }{
            M
        }
    \right)
\right) \\
=&
\mp
Z_{1}
\exp \left(
    -
    \sqrt{-1}
    \frac{
        2
        \pi
        \mu
    }{
        M
    }
\right)
+
\sum_{j=2}^{M} \left(
    Z_{j}
    \exp \left(
        -
        \sqrt{-1}
        j
        \frac{
            2
            \pi
            \mu
        }{
            M
        }
    \right)
\right)
\\
\widehat{Y}_{\mu}
:=&
\sum_{j=1}^{M} \left(
    Y_{j}
    \exp \left(
        -
        \sqrt{-1}
        j
        \frac{
            2
            \pi
            \mu
        }{
            M
        }
    \right)
\right) \\
\end{align*}
$$


### 離散フーリエ変換

TODO: $\widehat{Z}_{\mu}^{(\pm)}$ と $\widehat{Y}_{\mu}$ の定義が変わっているのでやり直し。逆変換は必要かもわからん(8/25)

$Claim$ : expの和の公式 (等比数列の和と見る)

$k \in \Zr$ について、
$$
\begin{align*}
\sum_{j = 1}^{M}
\exp\left(
    k
    \cdot
    \theta_{j}
\right)
=
\begin{cases}
    M & (k = 0) \\
    0 & (k \neq 0)
\end{cases}
\end{align*}
$$

$Proof$

#### (a) $k = 0$ のとき
$$
\begin{align*}
\sum_{j = 1}^{M}
\exp\left(
    0
    \cdot
    \theta_{j}
\right)
&=
\sum_{j = 1}^{M}
\exp\left(
    0
\right) \\
&=
\sum_{j = 1}^{M}
1 \\
&=
M
\end{align*}
$$

#### (b) $k \neq 0$ のとき
$$
\begin{align*}
\sum_{j = 1}^{M}
\exp\left(
    k
    \cdot
    \theta_{\mu}    
\right)
&=
\sum_{j = 1}^{M}
\exp\left(
    \frac{
        2 \pi \sqrt{-1} k \mu
    }{
        M
    }
\right) \\
&=
\left(
    \exp\left(
        \frac{
            2 \pi \sqrt{-1} k
        }{
            M
        }
    \right)
\right)
\frac{
    1
    -
    \left(
        \exp\left(
            \frac{
                2 \pi \sqrt{-1} k
            }{
                M
            }
        \right)
    \right)^{M}
}{
    1
    -
    \exp\left(
        \frac{
            2 \pi \sqrt{-1} k
        }{
            M
        }
    \right)
} \\
&=
\frac{
    \exp\left(
        \frac{
            2 \pi \sqrt{-1} k
        }{
            M
        }
    \right)
}{
    1
    -
    \exp\left(
        \frac{
            2 \pi \sqrt{-1} k
        }{
            M
        }
    \right)
}
\left(
    1
    -
    \left(
        \exp\left(
            \frac{
                2 \pi \sqrt{-1} k
            }{
                M
            }
            M
        \right)
    \right)
\right)
\\
&=
\frac{
    \exp\left(
        \frac{
            2 \pi \sqrt{-1} k
        }{
            M
        }
    \right)
}{
    1
    -
    \exp\left(
        \frac{
            2 \pi \sqrt{-1} k
        }{
            M
        }
    \right)
}
\left(
    1
    -
    \overbrace{
        \left(
            \exp\left(
                2 \pi \sqrt{-1} k
            \right)
        \right)
    }^{1}
\right) \\
&=
0
\\
\end{align*}
$$

$Q.E.D.$

---
$Claim$ (逆変換の成立)

TODO: (7/21) やり直し
$1 \leq m \leq M$ について、

$$
\begin{align*}
Z_{m} &= \frac{1}{M} \sum_{\mu \in \{1, \cdots, M\}} \left(
    \widehat{Z}_{m} \exp\left( \sqrt{-1} m \theta_{\mu} \right)
\right) \\
Y_{m} &= \frac{1}{M} \sum_{\mu \in \{1, \cdots, M\}} \left(
    \widehat{Y}_{m} \exp\left( \sqrt{-1} m \theta_{\mu} \right)
\right)
\end{align*}
$$

$Proof$

$$
\begin{align*}
\frac{1}{M} \sum_{\mu \in \{1, \cdots, M\}} \left(
    \widehat{Y} \exp\left( \sqrt{-1} m \theta_{\mu} \right)
\right) 
&=
\frac{1}{M} \sum_{\mu \in \{1, \cdots, M\}} \left(
    \sum^{M}_{j=1}\left(
        Y_{j}\exp\left( -\sqrt{-1} j \theta_{\mu} \right)
    \right)
    \exp\left( \sqrt{-1} m \theta_{\mu} \right)
\right) \\
&=
\frac{1}{M} \sum_{\mu \in \{1, \cdots, M\}} \left(
    \sum^{M}_{j=1}\left(
        Y_{j}\exp\left( -\sqrt{-1} j \left(2 \pi \mu\right) / M \right)
    \right)
    \exp\left( \sqrt{-1} m \left(2 \pi \mu\right) / M \right)
\right) \\
&=
\frac{1}{M} \sum_{\mu \in \{1, \cdots, M\}} \left(
    \sum^{M}_{j=1}\left(
        Y_{j}\exp\left(
            -\sqrt{-1} j \left(2 \pi \mu\right) / M
            +
            \sqrt{-1} m \left(2 \pi \mu\right) / M
        \right)
    \right)
\right) \\
&=
\frac{1}{M} \sum_{\mu \in \{1, \cdots, M\}} \left(
    \sum^{M}_{j=1}\left(
        Y_{j}\exp\left(
            \frac{
                \sqrt{-1} 2 \pi \mu
            }{
                M
            }
            (
                -j
                +
                m
            )
        \right)
    \right)
\right) \\
&=
\frac{1}{M} \sum^{M}_{j=1} \left(
    \sum_{\mu \in \{1, \cdots, M\}} \left(
        Y_{j}\exp\left(
            \frac{
                \sqrt{-1} 2 \pi \mu
            }{
                M
            }
            (
                -j
                +
                m
            )
        \right)
    \right)
\right) \\
&=
\frac{1}{M} \sum^{M}_{j=1} \left(
    Y_{j} \cdot \sum_{\mu \in \{1, \cdots, M\}} \left(
        \exp\left(
            \frac{
                \sqrt{-1} 2 \pi \mu
            }{
                M
            }
            (
                -j
                +
                m
            )
        \right)
    \right)
\right) \\
&=
\frac{1}{M} \sum^{M}_{j=1} \left(
    \begin{cases}
        Y_{m} \cdot M & (j = m) \\
        0 & (j \neq m)
    \end{cases}
\right) \ \left(\because 上記Claim \right)\\
&=
Y_{m}
\end{align*}
$$

$\widehat{Z}$ についても同様に示せる。

$Q.E.D.$

---

$def.$

TODO: このデルタ記号に名前をつけてグローバルに定義
$\newcommand{\diracDelta}[3]{\delta^{#1}_{#2, #3}}$

$k, l \in \Zr$ について、

$$
\diracDelta{M}{k}{l} :=
\begin{cases}
    1 & (k \equiv l \mod M) \\
    0 & (k \not\equiv l \mod M)
\end{cases}
$$

### $Z_{\mu}, Y_{\mu}$ の反交換関係

$Claim$

$\mu, \nu \in \{1, \dots, M \}$ について、

$$
\left[Z_\mu, Z_\nu\right]_{+} = 2I \diracDelta{M}{\mu}{\nu}
, \quad
\left[Z_\mu, Y_\nu\right]_{+} = 0
, \quad
\left[Y_\mu, Y_\nu\right]_{+} = 2I \diracDelta{M}{\mu}{\nu}
$$

$Proof$

$Z_m := \sigma_1^x \cdots \sigma_{m-1}^x \sigma_m^z \in \text{End}(\mathcal{F}) \ ただし、Z_{1} := \sigma_1^z$

正し、$Z_{M+1} := Z_{1}$

$Y_m := \sigma_1^x \cdots \sigma_{m-1}^x \sigma_m^y \in \text{End}(\mathcal{F}) \ ただし、Y_{1} := \sigma_1^y$

正し、$Y_{M+1} := Y_{1}$

## $\left[Z_\mu, Z_\nu\right]_{+}$ について、
### $\text{(i)} \nu - \mu \geq 2$ のとき

$$
\begin{align*}
\left[Z_\mu, Z_\nu\right]_{+} 
&=
Z_{\mu} Z_{\nu} + Z_{\nu} Z_{\mu} \\
&=
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^z
\right)
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^z
\right)
+
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^z
\right)
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^z
\right) \\
&=
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu-1\text{th}}
\otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^z
}^{\mu\text{th}}
\otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\mu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\nu-1\text{th}}
\otimes
\overbrace{
    \sigma^z
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\nu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{M\text{th}} \\
&\quad +
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu-1\text{th}}
\otimes
\overbrace{
    \sigma^z
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\nu-1\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^z
}^{\nu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{M\text{th}} \\
&=
\overbrace{
    I
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{\mu-1\text{th}}
\otimes
\overbrace{
    -\sqrt{-1}\sigma^y
}^{\mu\text{th}}
\otimes
\overbrace{
    \sigma^x
}^{\mu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
}^{\nu-1\text{th}}
\otimes
\overbrace{
    \sigma^z
}^{\nu\text{th}}
\otimes
\overbrace{
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{M\text{th}} \\
&\quad +
\overbrace{
    I
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{\mu-1\text{th}}
\otimes
\overbrace{
    \sqrt{-1}\sigma^y
}^{\mu\text{th}}
\otimes
\overbrace{
    \sigma^x
}^{\mu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
}^{\nu-1\text{th}}
\otimes
\overbrace{

    \sigma^z
}^{\nu\text{th}}
\otimes
\overbrace{
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{M\text{th}} \\
&=
-\sqrt{-1}
    \sigma^y_{\mu}
    \sigma^x_{\mu+1}
    \sigma^x_{\nu-1}
    \sigma^z_{\nu}
+
\sqrt{-1}
    \sigma^y_{\mu}
    \sigma^x_{\mu+1}
    \sigma^x_{\nu-1}
    \sigma^z_{\nu} \\
&= 0
\end{align*}
$$

### $\text{(ii)} \nu - \mu = 1$ のとき
$$
\begin{align*}
\left[Z_\mu, Z_\nu\right]_{+} 
&=
Z_{\mu} Z_{\nu} + Z_{\nu} Z_{\mu} \\
&=
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^z
\right)
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^z
\right)
+
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^z
\right)
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^z
\right) \\
&=
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu-1\text{th}}
\otimes
\overbrace{
    \sigma^z
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu\text{th} = \nu-1\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^z
}^{\nu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{M\text{th}} \\
&\quad +
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu-1\text{th}}
\otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^z
}^{\mu\text{th} = \nu-1\text{th}}
\otimes
\overbrace{
    \sigma^z
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\nu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{M\text{th}} \\
&=
\overbrace{
    I
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{\mu-1\text{th}}
\otimes
\overbrace{
    \sqrt{-1}\sigma^y
}^{\mu\text{th} = \nu-1\text{th}}
\otimes
\overbrace{
    \sigma^z
}^{\nu\text{th}}
\otimes
\overbrace{
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{M\text{th}} \\
&\quad +
\overbrace{
    I
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{\mu-1\text{th}}
\otimes
\overbrace{
    -\sqrt{-1}\sigma^y
}^{\mu\text{th} = \nu-1\text{th}}
\otimes
\overbrace{
    \sigma^z
}^{\nu\text{th}}
\otimes
\overbrace{
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{M\text{th}} \\
&=
\sqrt{-1}
    \sigma^y_{\mu}
    \sigma^z_{\nu}
-\sqrt{-1}
    \sigma^y_{\mu}
    \sigma^z_{\nu} \\
&= 0
\end{align*}
$$

### $\text{(iii)} \nu \equiv \mu \mod M \Leftrightarrow \nu - \mu = 0, \pm M$ のとき
##### a) $\nu - \mu = 0$ のとき
$$
\begin{align*}
\left[Z_\mu, Z_\nu\right]_{+}
&=
Z_{\mu} Z_{\nu} + Z_{\nu} Z_{\mu} \\
&=
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^z
\right)
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^z
\right)
+
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^z
\right)
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^z
\right) \\
&=
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu-1\text{th} = \nu-1\text{th}}
\otimes
\overbrace{
    \sigma^z
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^z
}^{\mu\text{th} = \nu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\mu+1\text{th} = \nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{M\text{th}} \\
&\quad +
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu-1\text{th} = \nu-1\text{th}}
\otimes
\overbrace{
    \sigma^z
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^z
}^{\mu\text{th} = \nu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\mu+1\text{th} = \nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{M\text{th}} \\
&=
\overbrace{
    I
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{\mu-1\text{th} = \nu-1\text{th}}
\otimes
\overbrace{
    I
}^{\mu\text{th} = \nu\text{th}}
\otimes
\overbrace{
    I
}^{\mu+1\text{th} = \nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{M\text{th}} \\
&\quad +
\overbrace{
    I
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{\mu-1\text{th} = \nu-1\text{th}}
\otimes
\overbrace{
    I
}^{\mu\text{th} = \nu\text{th}}
\otimes
\overbrace{
    I
}^{\mu+1\text{th} = \nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{M\text{th}} \\
&= 2I
\end{align*}
$$

##### b) $\nu - \mu = M$ のとき
$1 \leq j \leq M-1$ として、$$ \mu = -M+j, \nu = j $$ とfixする。
$$
\begin{align*}
\left[Z_{-M+j}, Z_{j}\right]_{+}
&=
Z_{-M+j} Z_{j} + Z_{j} Z_{-M+j} \\
&=
\left(
    \sigma_1^x \cdots \sigma_{-M+j-1}^x \sigma_{-M+j}^z
\right)
\left(
    \sigma_1^x \cdots \sigma_{j-1}^x \sigma_{j}^z
\right)
+
\left(
    \sigma_1^x \cdots \sigma_{j-1}^x \sigma_{j}^z
\right)
\left(
    \sigma_1^x \cdots \sigma_{-M+j-1}^x \sigma_{-M+j}^z
\right) \\
\end{align*}
$$

### $\text{(iv)} \nu - \mu = -1$ のとき
TODO: 

### $\text{(v)} \nu - \mu \leq -2$ のとき
TODO: 

## $\left[Z_\mu, Y_\nu\right]_{+}$ について、
### $\text{(i)} \nu - \mu \geq 2$ のとき
$$
\begin{align*}
\left[Z_\mu, Y_\nu\right]_{+}
&=
Z_{\mu} Y_{\nu} + Y_{\nu} Z_{\mu} \\
&=
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^z
\right)
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^y
\right)
+
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^y
\right)
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^z
\right) \\
&=
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu-1\text{th}}
\otimes
\overbrace{
    \sigma^z
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\nu-1\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^y
}^{\nu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{M\text{th}} \\
&\quad +
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu-1\text{th}}
\otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^z
}^{\mu\text{th}}
\otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\mu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\nu-1\text{th}}
\otimes
\overbrace{
    \sigma^y
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\nu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{M\text{th}} \\
&=
\overbrace{
    I
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{\mu-1\text{th}}
\otimes
\overbrace{
    \sqrt{-1}\sigma^y
}^{\mu\text{th}}
\otimes
\overbrace{
    \sigma^x
}^{\mu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
}^{\nu-1\text{th}}
\otimes
\overbrace{
    \sigma^y
}^{\nu\text{th}}
\otimes
\overbrace{
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{M\text{th}} \\
&\quad +
\overbrace{
    I
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{\mu-1\text{th}}
\otimes
\overbrace{
    -\sqrt{-1}\sigma^y
}^{\mu\text{th}}
\otimes
\overbrace{
    \sigma^x
}^{\mu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
}^{\nu-1\text{th}}
\otimes
\overbrace{
    \sigma^y
}^{\nu\text{th}}
\otimes
\overbrace{
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{M\text{th}} \\
&=
\sqrt{-1}
    \sigma^y_{\mu}
    \sigma^x_{\mu+1}
    \sigma^x_{\nu-1}
    \sigma^y_{\nu}
-\sqrt{-1}
    \sigma^y_{\mu}
    \sigma^x_{\mu+1}
    \sigma^x_{\nu-1}
    \sigma^y_{\nu} \\
&= 0
\end{align*}
$$

### $\text{(ii)} \nu - \mu = 1$ のとき
$$
\begin{align*}
\left[Z_\mu, Y_\nu\right]_{+}
&=
Z_{\mu} Y_{\nu} + Y_{\nu} Z_{\mu} \\
&=
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^z
\right)
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^y
\right)
+
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^y
\right)
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^z
\right) \\
&=
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu-1\text{th}}
\otimes
\overbrace{
    \sigma^z
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu\text{th} = \nu-1\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^y
}^{\nu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{M\text{th}} \\
&\quad +
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu-1\text{th}}
\otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^z
}^{\mu\text{th} = \nu-1\text{th}}
\otimes
\overbrace{
    \sigma^y
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\nu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{M\text{th}} \\
&=
\overbrace{
    I
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{\mu-1\text{th}}
\otimes
\overbrace{
    \sqrt{-1}\sigma^y
}^{\mu\text{th} = \nu-1\text{th}}
\otimes
\overbrace{
    \sigma^y
}^{\nu\text{th}}
\otimes
\overbrace{
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{M\text{th}} \\
&\quad +
\overbrace{
    I
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{\mu-1\text{th}}
\otimes
\overbrace{
    -\sqrt{-1}\sigma^y
}^{\mu\text{th} = \nu-1\text{th}}
\otimes
\overbrace{
    \sigma^y
}^{\nu\text{th}}
\otimes
\overbrace{
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{M\text{th}} \\
&=
\sqrt{-1}
    \sigma^y_{\mu}
    \sigma^y_{\nu}
-\sqrt{-1}
    \sigma^y_{\mu}
    \sigma^y_{\nu} \\
&= 0
\end{align*}
$$

### $\text{(iii)} \nu = \mu$ のとき
$$
\begin{align*}
\left[Z_\mu, Y_\nu\right]_{+}
&=
Z_{\mu} Y_{\nu} + Y_{\nu} Z_{\mu} \\
&=
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^z
\right)
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^y
\right)
+
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^y
\right)
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^z
\right) \\
&=
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu-1\text{th} = \nu-1\text{th}}
\otimes
\overbrace{
    \sigma^z
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^y
}^{\mu\text{th} = \nu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\mu+1\text{th} = \nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{M\text{th}} \\
&\quad +
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu-1\text{th} = \nu-1\text{th}}
\otimes
\overbrace{
    \sigma^y
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^z
}^{\mu\text{th} = \nu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\mu+1\text{th} = \nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{M\text{th}} \\
&=
\overbrace{
    I
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{\mu-1\text{th} = \nu-1\text{th}}
\otimes
\overbrace{
    -\sqrt{-1}\sigma^x
}^{\mu\text{th} = \nu\text{th}}
\otimes
\overbrace{
    I
}^{\mu+1\text{th} = \nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{M\text{th}} \\
&\quad +
\overbrace{
    I
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{\mu-1\text{th} = \nu-1\text{th}}
\otimes
\overbrace{
    \sqrt{-1}\sigma^x
}^{\mu\text{th} = \nu\text{th}}
\otimes
\overbrace{
    I
}^{\mu+1\text{th} = \nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{M\text{th}} \\
&=
-\sqrt{-1}
    \sigma^x_{\mu}
+\sqrt{-1}
    \sigma^x_{\mu} \\
&= 0
\end{align*}
$$

### $\text{(iv)} \nu - \mu = -1$ のとき
$$
\begin{align*}
\left[Z_\mu, Y_\nu\right]_{+}
&=
Z_{\mu} Y_{\nu} + Y_{\nu} Z_{\mu} \\
&=
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^z
\right)
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^y
\right)
+
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^y
\right)
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^z
\right) \\
&=
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\nu-1\text{th}}
\otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^y
}^{\nu\text{th} = \mu-1\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^z
}^{\mu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\mu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{M\text{th}} \\
&\quad +
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\nu-1\text{th}}
\otimes
\overbrace{
    \sigma^y
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\nu\text{th} = \mu-1\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^z
}^{\mu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\mu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{M\text{th}} \\
&=
\overbrace{
    I
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{\nu-1\text{th}}
\otimes
\overbrace{
    \sqrt{-1}\sigma^z
}^{\nu\text{th} = \mu-1\text{th}}
\otimes
\overbrace{
    \sigma^z
}^{\mu\text{th}}
\otimes
\overbrace{
    I
}^{\mu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{M\text{th}} \\
&\quad +
\overbrace{
    I
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{\nu-1\text{th}}
\otimes
\overbrace{
    -\sqrt{-1}\sigma^z
}^{\nu\text{th} = \mu-1\text{th}}
\otimes
\overbrace{
    \sigma^z
}^{\mu\text{th}}
\otimes
\overbrace{
    I
}^{\mu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{M\text{th}} \\
&=
\sqrt{-1}
    \sigma^z_{\nu}
    \sigma^z_{\mu}
-\sqrt{-1}
    \sigma^z_{\nu}
    \sigma^z_{\mu} \\
&= 0
\end{align*}
$$

### $\text{(v)} \nu - \mu \leq -2$ のとき
$$
\begin{align*}
\left[Z_\mu, Y_\nu\right]_{+}
&=
Z_{\mu} Y_{\nu} + Y_{\nu} Z_{\mu} \\
&=
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^z
\right)
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^y
\right)
+
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^y
\right)
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^z
\right) \\
&=
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\nu-1\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^y
}^{\nu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu-1\text{th}}
\otimes
\overbrace{
    \sigma^z
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{M\text{th}} \\
&\quad +
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\nu-1\text{th}}
\otimes
\overbrace{
    \sigma^y
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\nu\text{th}}
\otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^x
}^{\mu-1\text{th}}
\otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    \sigma^z
}^{\mu\text{th}}
\otimes
\overbrace{
    \sigma^x
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{\mu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
    \cdot_{\text{End}(\Cf^{2})}
    I
}^{M\text{th}} \\
&=
\overbrace{
    I
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
}^{\nu-1\text{th}}
\otimes
\overbrace{
    \sigma^y
}^{\nu\text{th}}
\otimes
\overbrace{
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{\mu-1\text{th}}
\otimes
\overbrace{
    \sqrt{-1}\sigma^y
}^{\mu\text{th}}
\otimes
\overbrace{
    \sigma^x
}^{\mu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{M\text{th}} \\
&\quad +
\overbrace{
    I
}^{1\text{th}}
\otimes \cdots \otimes
\overbrace{
    \sigma^x
}^{\nu-1\text{th}}
\otimes
\overbrace{
    \sigma^y
}^{\nu\text{th}}
\otimes
\overbrace{
    I
}^{\nu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{\mu-1\text{th}}
\otimes
\overbrace{
    -\sqrt{-1}\sigma^y
}^{\mu\text{th}}
\otimes
\overbrace{
    \sigma^x
}^{\mu+1\text{th}}
\otimes \cdots \otimes
\overbrace{
    I
}^{M\text{th}} \\
&=
\sqrt{-1}
    \sigma^y_{\nu}
    \sigma^x_{\mu}
    \sigma^x_{\nu-1}
    \sigma^y_{\mu}
-\sqrt{-1}
    \sigma^y_{\nu}
    \sigma^x_{\mu}
    \sigma^x_{\nu-1}
    \sigma^y_{\mu} \\
&= 0
\end{align*}
$$

## $\left[Y_\mu, Y_\nu\right]_{+}$ について、
$\left[Z_\mu, Z_\nu\right]_{+}$ と同様。
### $\text{(i)} \nu - \mu \geq 2$ のとき
$$
\begin{align*}
\left[Y_\mu, Y_\nu\right]_{+}
&=
Y_{\mu} Y_{\nu} + Y_{\nu} Y_{\mu} \\
&=
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^y
\right)
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^y
\right)
+
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^y
\right)
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^y
\right) \\
&=
-\sqrt{-1}
    \sigma^z_{\mu}
    \sigma^x_{\mu+1}
    \sigma^x_{\nu-1}
    \sigma^y_{\nu}
+
\sqrt{-1}
    \sigma^z_{\mu}
    \sigma^x_{\mu+1}
    \sigma^x_{\nu-1}
    \sigma^y_{\nu} \\
&= 0
\end{align*}
$$

### $\text{(ii)} \nu - \mu = 1$ のとき
$$
\begin{align*}
\left[Y_\mu, Y_\nu\right]_{+}
&=
Y_{\mu} Y_{\nu} + Y_{\nu} Y_{\mu} \\
&=
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^y
\right)
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^y
\right)
+
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^y
\right)
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^y
\right) \\
&=
\sqrt{-1}
    \sigma^z_{\mu}
    \sigma^y_{\nu}
-\sqrt{-1}
    \sigma^z_{\mu}
    \sigma^y_{\nu} \\
&= 0
\end{align*}
$$

### $\text{(iii)} \nu = \mu$ のとき
$$
\begin{align*}
\left[Y_\mu, Y_\nu\right]_{+}
&=
Y_{\mu} Y_{\nu} + Y_{\nu} Y_{\mu} \\
&=
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^y
\right)
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^y
\right)
+
\left(
    \sigma_1^x \cdots \sigma_{\nu-1}^x \sigma_{\nu}^y
\right)
\left(
    \sigma_1^x \cdots \sigma_{\mu-1}^x \sigma_{\mu}^y
\right) \\
&= 2I
\end{align*}
$$

### $\text{(iv)} \nu - \mu = -1$ のとき
TODO: 

### $\text{(v)} \nu - \mu \leq -2$ のとき
TODO: 

$Claim$

$\mu, \nu \in \mathcal{M}$ について、

$$
\diracDelta{M}{\mu + \nu}{0}
= 
\sum^{M}_{j=1}\left(
    \exp\left( -\sqrt{-1} j \theta_{\mu} \right)\exp\left( -\sqrt{-1} j \theta_{\nu} \right)
\right)
$$

めも

$\theta_{\mu} := \frac{2 \pi \mu}{M}$

$$
\begin{align*}
\sum_{j = 1}^{M} \left(
    \exp\left(
        k
        \cdot
        \frac{
            \sqrt{-1} 2 \pi j
        }{
            M
        }
    \right)
\right) =
\begin{cases}
    M & (k = 0) \\
    0 & (k \neq 0)
\end{cases}
\end{align*}
$$


$Proof$

$$
\begin{align*}
\sum^{M}_{j=1}\left(
    \exp\left( -\sqrt{-1} j \theta_{\mu} \right)\exp\left( -\sqrt{-1} j \theta_{\nu} \right)
\right)
&=
\sum^{M}_{j=1}\left(
    \exp\left( -\sqrt{-1} j \theta_{\mu} -\sqrt{-1} j \theta_{\nu} \right)
\right) \\
&=
\sum^{M}_{j=1}\left(
    \exp\left( -\sqrt{-1} j \left( \theta_{\mu} + \theta_{\nu} \right) \right)
\right) \\
&=
\sum^{M}_{j=1}\left(
    \exp\left(
        -\sqrt{-1} j
        \left(
            \frac{
                2\pi\mu
            }{
                M
            }
            +
            \frac{
                2\pi\nu
            }{
                M
            }
        \right)
    \right)
\right) \\
&=
\sum^{M}_{j=1}\left(
    \exp\left(
        \frac{
            -2 \pi\sqrt{-1} j
        }{
            M
        }
        \left(
            \mu
            +
            \nu
        \right)
    \right)
\right) \\
&=
\sum^{M}_{j=1}\left(
    \exp\left(
        -\left(
            \mu
            +
            \nu
        \right)
        \frac{
            2 \pi\sqrt{-1} j
        }{
            M
        }
    \right)
\right) \\
&=
\begin{cases}
    M & (\mu + \nu = 0) \\
    0 & (\mu + \nu \neq 0)
\end{cases} \\
&=
M\diracDelta{M}{\mu + \nu}{0}
\end{align*}
$$


### $\widehat{Z}$と$\widehat{Y}$の反交換関係

$Claim$ (論文 B.6)

$\mu, \nu \in \mathcal{M}$ について、

$$
\left[\widehat{Z}_{\mu}^{(\pm)}, \widehat{Z}_{\nu}^{(\pm)} \right]_{+} = 2 M \diracDelta{M}{\mu+\nu}{0} I
, \quad
\left[\widehat{Z}_{\mu}^{(\pm)}, \widehat{Y}_{\nu} \right]_{+} = 0
, \quad
\left[\widehat{Y}_{\mu}, \widehat{Y}_{\nu} \right]_{+}= 2 M \diracDelta{M}{\mu+\nu}{0} I
$$

$Proof$

$\pm$ は複号同順であるとする。

### $\left[\widehat{Z}_{\mu}^{(\pm)}, \widehat{Z}_{\nu}^{(\pm)} \right]_{+}$ について、

$$
\begin{align*}
\left[\widehat{Z}_{\mu}^{(\pm)}, \widehat{Z}_{\nu}^{(\pm)} \right]_{+}
=&
\left[
    \sum_{j=1}^{M} \left(
    \left(
        \begin{cases}
            +1 & \text{if} \ j \not= 1 \\
            \mp 1 & \text{if} \ j = 1 \\
        \end{cases}
    \right)
    \cdot
    Z_{j}
    \exp \left(
        -
        \sqrt{-1}
        j
        \frac{
            2
            \pi
            \mu
        }{
            M
        }
    \right)
\right)
,
\sum_{k=1}^{M} \left(
    \left(
        \begin{cases}
            +1 & \text{if} \ k \not= 1 \\
            \mp 1 & \text{if} \ k = 1 \\
        \end{cases}
    \right)
    \cdot
    Z_{k}
    \exp \left(
        -
        \sqrt{-1}
        k
        \frac{
            2
            \pi
            \nu
        }{
            M
        }
    \right)
\right)
\right]_{+}
\\
=&
\left(
    \sum_{j=1}^{M} \left(
        \left(
            \begin{cases}
                +1 & \text{if} \ j \not= 1 \\
                \mp 1 & \text{if} \ j = 1 \\
            \end{cases}
        \right)
        \cdot
        Z_{j}
        \exp \left(
            -
            \sqrt{-1}
            j
            \frac{
                2
                \pi
                \mu
            }{
                M
            }
        \right)
    \right)
\right)
\left(
    \sum_{k=1}^{M} \left(
        \left(
            \begin{cases}
                +1 & \text{if} \ k \not= 1 \\
                \mp 1 & \text{if} \ k = 1 \\
            \end{cases}
        \right)
        \cdot
        Z_{k}
        \exp \left(
            -
            \sqrt{-1}
            k
            \frac{
                2
                \pi
                \nu
            }{
                M
            }
        \right)
    \right)
\right)
+
\left(
    \sum_{k=1}^{M} \left(
        \left(
            \begin{cases}
                +1 & \text{if} \ k \not= 1 \\
                \mp 1 & \text{if} \ k = 1 \\
            \end{cases}
        \right)
        \cdot
        Z_{k}
        \exp \left(
            -
            \sqrt{-1}
            k
            \frac{
                2
                \pi
                \nu
            }{
                M
            }
        \right)
    \right)
\right)
\left(
    \sum_{j=1}^{M} \left(
        \left(
            \begin{cases}
                +1 & \text{if} \ j \not= 1 \\
                \mp 1 & \text{if} \ j = 1 \\
            \end{cases}
        \right)
        \cdot
        Z_{j}
        \exp \left(
            -
            \sqrt{-1}
            j
            \frac{
                2
                \pi
                \mu
            }{
                M
            }
        \right)
    \right)
\right)
\\
=&
\sum_{j,k=1}^{M} \left(
    \left(
        \begin{cases}
            +1 & \text{if} \ j \not= 1 \\
            \mp 1 & \text{if} \ j = 1 \\
        \end{cases}
    \right)
    \cdot
    Z_{j}
    \exp \left(
        -
        \sqrt{-1}
        j
        \frac{
            2
            \pi
            \mu
        }{
            M
        }
    \right)
    \cdot
    \left(
        \begin{cases}
            +1 & \text{if} \ k \not= 1 \\
            \mp 1 & \text{if} \ k = 1 \\
        \end{cases}
    \right)
    \cdot
    Z_{k}
    \exp \left(
        -
        \sqrt{-1}
        k
        \frac{
            2
            \pi
            \nu
        }{
            M
        }
    \right)
\right)
+
\sum_{j,k=1}^{M} \left(
    \left(
        \begin{cases}
            +1 & \text{if} \ k \not= 1 \\
            \mp 1 & \text{if} \ k = 1 \\
        \end{cases}
    \right)
    \cdot
    Z_{k}
    \exp \left(
        -
        \sqrt{-1}
        k
        \frac{
            2
            \pi
            \nu
        }{
            M
        }
    \right)
    \cdot
    \left(
        \begin{cases}
            +1 & \text{if} \ j \not= 1 \\
            \mp 1 & \text{if} \ j = 1 \\
        \end{cases}
    \right)
    \cdot
    Z_{j}
    \exp \left(
        -
        \sqrt{-1}
        j
        \frac{
            2
            \pi
            \mu
        }{
            M
        }
    \right)
\right)
\\
=&
\sum_{j,k=1}^{M} \left(
    \left(
        \begin{cases}
            +1 & \text{if} \ j \not= 1 \\
            \mp 1 & \text{if} \ j = 1 \\
        \end{cases}
    \right)
    \cdot
    \left(
        \begin{cases}
            +1 & \text{if} \ k \not= 1 \\
            \mp 1 & \text{if} \ k = 1 \\
        \end{cases}
    \right)
    \cdot
    Z_{j}
    Z_{k}
    \cdot
    \exp \left(
        -
        \sqrt{-1}
        j
        \frac{
            2
            \pi
            \mu
        }{
            M
        }
        -
        \sqrt{-1}
        k
        \frac{
            2
            \pi
            \nu
        }{
            M
        }
    \right)
\right)
+
\sum_{j,k=1}^{M} \left(
    \left(
        \begin{cases}
            +1 & \text{if} \ k \not= 1 \\
            \mp 1 & \text{if} \ k = 1 \\
        \end{cases}
    \right)
    \cdot
    \left(
        \begin{cases}
            +1 & \text{if} \ j \not= 1 \\
            \mp 1 & \text{if} \ j = 1 \\
        \end{cases}
    \right)
    \cdot
    Z_{k}
    Z_{j}
    \cdot
    \exp \left(
        -
        \sqrt{-1}
        k
        \frac{
            2
            \pi
            \nu
        }{
            M
        }
        -
        \sqrt{-1}
        j
        \frac{
            2
            \pi
            \mu
        }{
            M
        }
    \right)
\right)
\\
=&
\sum_{j,k=1}^{M} \left(
    \left(
        \begin{cases}
            +1 & \text{if} \ j \not= 1 \\
            \mp 1 & \text{if} \ j = 1 \\
        \end{cases}
    \right)
    \cdot
    \left(
        \begin{cases}
            +1 & \text{if} \ k \not= 1 \\
            \mp 1 & \text{if} \ k = 1 \\
        \end{cases}
    \right)
    \cdot
    Z_{j}
    Z_{k}
    \cdot
    \exp \left(
        -
        \sqrt{-1}
        \frac{
            2
            \pi
        }{
            M
        }
        \left(
            j \mu + k \nu
        \right)
    \right)
\right)
+
\sum_{j,k=1}^{M} \left(
    \left(
        \begin{cases}
            +1 & \text{if} \ k \not= 1 \\
            \mp 1 & \text{if} \ k = 1 \\
        \end{cases}
    \right)
    \cdot
    \left(
        \begin{cases}
            +1 & \text{if} \ j \not= 1 \\
            \mp 1 & \text{if} \ j = 1 \\
        \end{cases}
    \right)
    \cdot
    Z_{k}
    Z_{j}
    \cdot
    \exp \left(
        -
        \sqrt{-1}
        \frac{
            2
            \pi
        }{
            M
        }
        \left(
            j \mu + k \nu
        \right)
    \right)
\right)
\\
=&
\sum_{j,k=1}^{M} \left(
    \left(
        \begin{cases}
            +1 & \text{if} \ j \not= 1 \\
            \mp 1 & \text{if} \ j = 1 \\
        \end{cases}
    \right)
    \cdot
    \left(
        \begin{cases}
            +1 & \text{if} \ k \not= 1 \\
            \mp 1 & \text{if} \ k = 1 \\
        \end{cases}
    \right)
    \cdot
    Z_{j}
    Z_{k}
    \cdot
    \exp \left(
        -
        \sqrt{-1}
        \frac{
            2
            \pi
        }{
            M
        }
        \left(
            j \mu + k \nu
        \right)
    \right)
    +
    \left(
        \begin{cases}
            +1 & \text{if} \ k \not= 1 \\
            \mp 1 & \text{if} \ k = 1 \\
        \end{cases}
    \right)
    \cdot
    \left(
        \begin{cases}
            +1 & \text{if} \ j \not= 1 \\
            \mp 1 & \text{if} \ j = 1 \\
        \end{cases}
    \right)
    \cdot
    Z_{k}
    Z_{j}
    \cdot
    \exp \left(
        -
        \sqrt{-1}
        \frac{
            2
            \pi
        }{
            M
        }
        \left(
            j \mu + k \nu
        \right)
    \right)
\right)
\\
=&
\sum_{j,k=1}^{M} \left(
    \left(
        \begin{cases}
            +1 & \text{if} \ j \not= 1 \\
            \mp 1 & \text{if} \ j = 1 \\
        \end{cases}
    \right)
    \cdot
    \left(
        \begin{cases}
            +1 & \text{if} \ k \not= 1 \\
            \mp 1 & \text{if} \ k = 1 \\
        \end{cases}
    \right)
    \cdot
    \exp \left(
        -
        \sqrt{-1}
        \frac{
            2
            \pi
        }{
            M
        }
        \left(
            j \mu + k \nu
        \right)
    \right)
    \cdot
    \left(
        Z_{j}
        Z_{k}
        +
        Z_{k}
        Z_{j}
    \right)
\right)
\\
=&
\sum_{j,k=1}^{M} \left(
    \left(
        \begin{cases}
            +1 & \text{if} \ j \not= 1 \\
            \mp 1 & \text{if} \ j = 1 \\
        \end{cases}
    \right)
    \cdot
    \left(
        \begin{cases}
            +1 & \text{if} \ k \not= 1 \\
            \mp 1 & \text{if} \ k = 1 \\
        \end{cases}
    \right)
    \cdot
    \exp \left(
        -
        \sqrt{-1}
        \frac{
            2
            \pi
        }{
            M
        }
        \left(
            j \mu + k \nu
        \right)
    \right)
    \cdot
    \left[
        Z_{j}
        ,
        Z_{k}
    \right]_{+}
\right)
\\
=&
\sum_{j,k=1}^{M} \left(
    \left(
        \begin{cases}
            +1 & \text{if} \ j \not= 1 \\
            \mp 1 & \text{if} \ j = 1 \\
        \end{cases}
    \right)
    \cdot
    \left(
        \begin{cases}
            +1 & \text{if} \ k \not= 1 \\
            \mp 1 & \text{if} \ k = 1 \\
        \end{cases}
    \right)
    \cdot
    \exp \left(
        -
        \sqrt{-1}
        \frac{
            2
            \pi
        }{
            M
        }
        \left(
            j \mu + k \nu
        \right)
    \right)
    \cdot
    2I \diracDelta{M}{j}{k}
\right)
\\
=&
\sum_{j=1}^{M} \left(
    2
    I
     \left(
        \begin{cases}
            +1 & \text{if} \ j \not= 1 \\
            \mp 1 & \text{if} \ j = 1 \\
        \end{cases}
    \right)
    \cdot
    \left(
        \begin{cases}
            +1 & \text{if} \ j \not= 1 \\
            \mp 1 & \text{if} \ j = 1 \\
        \end{cases}
    \right)
    \cdot
    \exp \left(
        -
        \sqrt{-1}
        \frac{
            2
            \pi
        }{
            M
        }
        \left(
            j \mu + j \nu
        \right)
    \right)
\right)
\\
=&
\sum_{j=1}^{M} \left(
    2
    I
    \cdot
    \exp \left(
        -
        \sqrt{-1}
        \frac{
            2
            \pi
        }{
            M
        }
        \left(
            j \mu + j \nu
        \right)
    \right)
\right)
\quad
\left(
    \because 複号同順のため
\right)
\\
=&
\sum_{j=1}^{M} \left(
    2
    I
    \cdot
    \exp \left(
        -
        \sqrt{-1}
        \frac{
            2
            j
            \pi
        }{
            M
        }
        \left(
            \mu + \nu
        \right)
    \right)
\right)
\quad
\cdots
\quad
(1)
\\
\end{align*}
$$

##### a) $\mu + \nu = 0 \mod M$ のとき

$l = 1,2$ を用いて、

$$
\begin{align*}
(1)
=&
\sum_{j=1}^{M} \left(
    2
    \cdot
    \overbrace{
        \exp \left(
            -
            \sqrt{-1}
            2
            l
            j
            \pi
        \right)
    }^{
        1
    }
\right)
\\
=&
2MI
\end{align*}
$$

##### b) $\mu + \nu \not= 0 \mod M$ のとき

$$
\begin{align*}
(1)
=
2
\sum_{j=1}^{M} \left(
    \exp \left(
        -
        \sqrt{-1}
        \frac{
            2
            j
            \pi
        }{
            M
        }
        \left(
            \mu + \nu
        \right)
    \right)
\right)
=&
2
\cdot
\underbrace{
    \overbrace{
        \exp \left(
            -
            \sqrt{-1}
            \frac{
                2
                \pi
            }{
                M
            }
            \left(
                \mu + \nu
            \right)
        \right)
    }^{初項}
    \cdot
    \frac{
        1
        -
        \left(
            \overbrace{
                \exp \left(
                    -
                    \sqrt{-1}
                    \frac{
                        2
                        \pi
                    }{
                        M
                    }
                \right)
            }^{公比}
        \right)
        ^{M}
    }{
        1
        -
        \overbrace{
            \exp \left(
                -
                \sqrt{-1}
                \frac{
                    2
                    \pi
                }{
                    M
                }
            \right)
        }^{公比}     
    }
}_{等比級数の和}
\\
=&
\exp \left(
    -
    \sqrt{-1}
    \frac{
        2
        \pi
    }{
        M
    }
    \left(
        \mu + \nu
    \right)
\right)
\cdot
\frac{
    1
    -
    \overbrace{
        \left(
            \exp \left(
                -
                \sqrt{-1}
                2
                \pi
            \right)
        \right)
    }^{1}
}{
    1
    -
    \exp \left(
        -
        \sqrt{-1}
        \frac{
            2
            \pi
        }{
            M
        }
    \right)
}
\\
=&
0
\end{align*}
$$

$Q.E.D.$

### $H$の定義
$
H_{1}^{(\pm)} := Y_1 Z_2+Y_2 Z_3+\cdots \mp 1_{\text{End}(\mathcal{F})} Y_M Z_1
$

$
H_{2} := Z_1 Y_1+Z_2 Y_2+\cdots+Z_M Y_M
$

### $H$を$\widehat{Z}$と$\widehat{Y}$で表す
$Claim$
$$
\begin{align*}
H_{1}^{(\pm)} &= \frac{1}{M} \sum_{j \in \{1, \cdots, M\}} \left(
    \widehat{Y}_{j}
    \widehat{Z}_{-j}^{(\pm)}
    \exp \left(
        -
        \sqrt{-1}
        \frac{
            2
            \pi
            j
        }{
            M
        }
    \right)
\right) \\

H_{2} &= \frac{1}{M} \sum_{j \in \{1, \cdots, M\}} \left(
    \widehat{Z}_{-j}^{(-)}
    \widehat{Y}_{j}
\right)
\end{align*}
$$

$Proof$

$H_{1}^{(\pm)}$ について、

$$
\begin{align*}
(右辺)
&=
\frac{1}{M} \sum_{j \in \{1, \cdots, M\}} \left(
    \widehat{Y}_{j}
    \widehat{Z}_{-j}^{(\pm)}
    \exp \left(
        -
        \sqrt{-1}
        \frac{
            2
            \pi
            j
        }{
            M
        }
    \right)
\right) \\
&=
\frac{1}{M} \sum_{j \in \{1, \cdots, M\}} \left(
    \overbrace{
        \left(
            \sum_{k=1}^{M} \left(
                Y_{k}
                \exp \left(
                    -
                    \sqrt{-1}
                    k
                    \frac{
                        2
                        \pi
                        j
                    }{
                        M
                    }
                \right)
            \right)
        \right)
    }^{\widehat{Y}_{j}}
    \overbrace{
        \left(
            \sum_{l=1}^{M} \left(
                \left(
                    \begin{cases}
                        +1 & \text{if} \ l \not= 1 \\
                        \mp 1 & \text{if} \ l = 1 \\
                    \end{cases}
                \right)
                \cdot
                Z_{l}
                \exp \left(
                    -
                    \sqrt{-1}
                    l
                    \frac{
                        2
                        \pi
                        (-j)
                    }{
                        M
                    }
                \right)
            \right)
        \right)
    }^{\widehat{Z}_{-j}^{(\pm)}}
    \exp \left(
        -
        \sqrt{-1}
        \frac{
            2
            \pi
            j
        }{
            M
        }
    \right)
\right) \\
&=
\frac{1}{M} \sum_{j \in \{1, \cdots, M\}} \left(
    \sum_{k,l=1}^{M} \left(
        Y_{k}
        \exp \left(
            -
            \sqrt{-1}
            k
            \frac{
                2
                \pi
                j
            }{
                M
            }
        \right)
        \cdot
        \left(
            \begin{cases}
                +1 & \text{if} \ l \not= 1 \\
                \mp 1 & \text{if} \ l = 1 \\
            \end{cases}
        \right)
        \cdot
        Z_{l}
        \exp \left(
            -
            \sqrt{-1}
            l
            \frac{
                2
                \pi
                (-j)
            }{
                M
            }
        \right)
    \right)
    \exp \left(
        -
        \sqrt{-1}
        \frac{
            2
            \pi
            j
        }{
            M
        }
    \right)
\right) \\
&=
\frac{1}{M} \sum_{j \in \{1, \cdots, M\}} \left(
    \sum_{k,l=1}^{M} \left(
        \left(
            \begin{cases}
                +1 & \text{if} \ l \not= 1 \\
                \mp 1 & \text{if} \ l = 1 \\
            \end{cases}
        \right)
        \cdot
        \exp \left(
            -
            \sqrt{-1}
            k
            \frac{
                2
                \pi
                j
            }{
                M
            }
        \right)
        \cdot
        \exp \left(
            -
            \sqrt{-1}
            l
            \frac{
                2
                \pi
                (-j)
            }{
                M
            }
        \right)
        \cdot
        \exp \left(
            -
            \sqrt{-1}
            \frac{
                2
                \pi
                j
            }{
                M
            }
        \right)
        Y_{k}
        Z_{l}
    \right)
\right) \\
&=
\frac{1}{M} \sum_{j \in \{1, \cdots, M\}} \left(
    \sum_{k,l=1}^{M} \left(
        \left(
            \begin{cases}
                +1 & \text{if} \ l \not= 1 \\
                \mp 1 & \text{if} \ l = 1 \\
            \end{cases}
        \right)
        \cdot
        \exp \left(
            -
            \sqrt{-1}
            k
            \frac{
                2
                \pi
                j
            }{
                M
            }
            -
            \sqrt{-1}
            l
            \frac{
                2
                \pi
                (-j)
            }{
                M
            }
            -
            \sqrt{-1}
            \frac{
                2
                \pi
                j
            }{
                M
            }
        \right)
        \cdot
        Y_{k}
        Z_{l}
    \right)
\right) \\
&=
\frac{1}{M} \sum_{j \in \{1, \cdots, M\}} \left(
    \sum_{k,l=1}^{M} \left(
        \left(
            \begin{cases}
                +1 & \text{if} \ l \not= 1 \\
                \mp 1 & \text{if} \ l = 1 \\
            \end{cases}
        \right)
        \cdot
        \exp \left(
            -
            \sqrt{-1}
            \frac{
                2
                \pi
                j
            }{
                M
            }
            \left(
                k
                -
                l
                +
                1
            \right)
        \right)
        \cdot
        Y_{k}
        Z_{l}
    \right)
\right) \\
&=
\frac{1}{M} \sum_{j \in \{1, \cdots, M\}} \left(
    \sum_{
        \begin{align*}
        &k,l \in \{1, \dots, M\} \\
        &k - l + 1 \equiv 0 \mod M
        \end{align*}
    } \left(
        \left(
            \begin{cases}
                +1 & \text{if} \ l \not= 1 \\
                \mp 1 & \text{if} \ l = 1 \\
            \end{cases}
        \right)
        \cdot
        \exp \left(
            -
            \sqrt{-1}
            \frac{
                2
                \pi
                j
            }{
                M
            }
            \left(
                k
                -
                l
                +
                1
            \right)
        \right)
        \cdot
        Y_{k}
        Z_{l}
    \right)
\right) \\
&=
\frac{1}{M} \sum_{j \in \{1, \cdots, M\}} \left(
    Y_{1}
    Z_{2}
    +
    Y_{3}
    Z_{2}
    + \cdots \mp
    Y_{M}
    Z_{1}
\right) \\
&=
\frac{1}{M}
\cdot
M
\cdot
\left(
    Y_{1}
    Z_{2}
    +
    Y_{3}
    Z_{2}
    + \cdots \mp
    Y_{M}
    Z_{1}
\right) \\
&=
Y_{1}
Z_{2}
+
Y_{3}
Z_{2}
+ \cdots \mp
Y_{M}
Z_{1}
\end{align*}
$$

$Q.E.D.$

$H_{2}$ について、

$$
\begin{align*}
(右辺)
&=
\frac{1}{M} \sum_{j \in \{1, \cdots, M\}} \left(
    \widehat{Z}_{-j}^{(-)}
    \widehat{Y}_{j}
\right) \\
&=
\frac{1}{M} \sum_{j \in \{1, \cdots, M\}} \left(
    \overbrace{
        \left(
            \sum_{k=1}^{M} \left(
                Z_{k}
                \exp \left(
                    -
                    \sqrt{-1}
                    k
                    \frac{
                        2
                        \pi
                        (-j)
                    }{
                        M
                    }
                \right)
            \right)
        \right)
    }^{\widehat{Z}_{-j}^{(-)}}
    \overbrace{
        \left(
            \sum_{l=1}^{M} \left(
                Y_{l}
                \exp \left(
                    -
                    \sqrt{-1}
                    l
                    \frac{
                        2
                        \pi
                        j
                    }{
                        M
                    }
                \right)
            \right)
        \right)
    }^{\widehat{Y}_{j}}
\right) \\
&=
\frac{1}{M} \sum_{j \in \{1, \cdots, M\}} \left(
    \sum_{k,l=1}^{M} \left(
        Z_{k}
        \exp \left(
            -
            \sqrt{-1}
            k
            \frac{
                2
                \pi
                (-j)
            }{
                M
            }
        \right)
        \cdot
        Y_{l}
        \exp \left(
            -
            \sqrt{-1}
            l
            \frac{
                2
                \pi
                j
            }{
                M
            }
        \right)
    \right)
\right) \\
&=
\frac{1}{M} \sum_{j \in \{1, \cdots, M\}} \left(
    \sum_{k,l=1}^{M} \left(
        \exp \left(
            -
            \sqrt{-1}
            k
            \frac{
                2
                \pi
                (-j)
            }{
                M
            }
            -
            \sqrt{-1}
            l
            \frac{
                2
                \pi
                j
            }{
                M
            }
        \right)
        \cdot
        Z_{k}
        Y_{l}
    \right)
\right) \\
&=
\frac{1}{M} \sum_{j \in \{1, \cdots, M\}} \left(
    \sum_{k,l=1}^{M} \left(
        \exp \left(
            -
            \sqrt{-1}
            \frac{
                2
                \pi
                j
            }{
                M
            }
            \left(
                -k
                +
                l
            \right)
        \right)
        \cdot
        Z_{k}
        Y_{l}
    \right)
\right) \\
&=
\frac{1}{M} \sum_{j \in \{1, \cdots, M\}} \left(
    \sum_{
        \begin{align*}
        &k,l \in \{1, \dots, M\} \\
        &-k + l \equiv 0 \mod M
        \end{align*}
    } \left(
        \exp \left(
            -
            \sqrt{-1}
            \frac{
                2
                \pi
                j
            }{
                M
            }
            \left(
                -k
                +
                l
            \right)
        \right)
        \cdot
        Z_{k}
        Y_{l}
    \right)
\right) \\
&=
\frac{1}{M} \sum_{j \in \{1, \cdots, M\}} \left(
    Z_{1}
    Y_{1}
    +
    Z_{2}
    Y_{2}
    + \cdots+
    Z_{M}
    Y_{M}
\right) \\
&=
\frac{1}{M}
\cdot
M
\cdot
\left(
    Z_{1}
    Y_{1}
    +
    Z_{2}
    Y_{2}
    + \cdots+
    Z_{M}
    Y_{M}
\right) \\
&=
Z_{1}
Y_{1}
+
Z_{2}
Y_{2}
+ \cdots+
Z_{M}
Y_{M}
\end{align*}
$$

$Q.E.D.$

### $H$との交換関係

---

$Claim$

$$
\begin{align*}
\left[H_{1}^{(\pm)}, \widehat{Z}_{\mu}^{(\pm)}\right]
&=
-
2 
\exp \left(
    -
    \sqrt{-1}
    \frac{
        2
        \pi
        \mu
    }{
        M
    }
\right)
\cdot
\widehat{Y}_{\mu}
\\
\left[H_{1}^{(\pm)}, \widehat{Y}_{\mu}\right]
&=
2 
\exp \left(
    -
    \sqrt{-1}
    \frac{
        2
        \pi
        \mu
    }{
        M
    }
\right)
\cdot
\widehat{Z}_{\mu}^{(\pm)}
\\
\left[H_{2}, \widehat{Z}_{\mu}^{(\pm)}\right]
&=
2 
\cdot
\widehat{Y}_{\mu}
\\
\left[H_{2}, \widehat{Y}_{\mu}\right]
&=
-
2 
\cdot
\widehat{Z}_{\mu}^{(\pm)}
\\
\end{align*}
$$

---


$Proof$

#### $\left[H_{1}^{(\pm)}, \widehat{Z}_{\mu}^{(\pm)}\right]$ について、

$\mu \in \mathcal{M}$ について、

$$
\begin{align*}
\left[H_{1}^{(\pm)}, \widehat{Z}_{\mu}^{(\pm)}\right]
&=
H_{1}^{(\pm)} \widehat{Z}_{\mu}^{(\pm)} - \widehat{Z}_{\mu}^{(\pm)} H_{1}^{(\pm)} \\
&=
\left(
    \frac{1}{M}
    \sum_{j \in \{1, \cdots, M\}}
    \left(
        \widehat{Y}_{j}
        \widehat{Z}_{-j}^{(\pm)}
        \exp \left(
            -
            \sqrt{-1}
            \frac{
                2
                \pi
                j
            }{
                M
            }
        \right)
    \right)
\right)
\widehat{Z}_{\mu}^{(\pm)}
-
\widehat{Z}_{\mu}^{(\pm)}
\left(
    \frac{1}{M}
    \sum_{j \in \{1, \cdots, M\}}
    \left(
        \widehat{Y}_{j}
        \widehat{Z}_{-j}^{(\pm)}
        \exp \left(
            -
            \sqrt{-1}
            \frac{
                2
                \pi
                j
            }{
                M
            }
        \right)
    \right)
\right)
\\
&=
\frac{1}{M}
\left(
    \sum_{j \in \{1, \cdots, M\}}
    \left(
        \widehat{Y}_{j}
        \widehat{Z}_{-j}^{(\pm)}
        \widehat{Z}_{\mu}^{(\pm)}
        \exp \left(
            -
            \sqrt{-1}
            \frac{
                2
                \pi
                j
            }{
                M
            }
        \right)
        -
        \widehat{Z}_{\mu}^{(\pm)}
        \widehat{Y}_{j}
        \widehat{Z}_{-j}^{(\pm)}
        \exp \left(
            -
            \sqrt{-1}
            \frac{
                2
                \pi
                j
            }{
                M
            }
        \right)
    \right)
\right)
\\
&=
\frac{1}{M}
\sum_{j \in \{1, \cdots, M\}}
\exp \left(
    -
    \sqrt{-1}
    \frac{
        2
        \pi
        j
    }{
        M
    }
\right)
\left(
    \widehat{Y}_{j}
    \widehat{Z}_{-j}^{(\pm)}
    \widehat{Z}_{\mu}^{(\pm)}
    -
    \widehat{Z}_{\mu}^{(\pm)}
    \widehat{Y}_{j}
    \widehat{Z}_{-j}^{(\pm)}
\right)
\\
&=
\frac{1}{M}
\sum_{j \in \{1, \cdots, M\}}
\exp \left(
    -
    \sqrt{-1}
    \frac{
        2
        \pi
        j
    }{
        M
    }
\right)
\left(
    \widehat{Y}_{j}
    \widehat{Z}_{-j}^{(\pm)}
    \widehat{Z}_{\mu}^{(\pm)}
    +
    \widehat{Y}_{j}
    \widehat{Z}_{\mu}^{(\pm)}
    \widehat{Z}_{-j}^{(\pm)}
\right)
\quad
\left(
    \because \left[\widehat{Z}_{\mu}^{(\pm)}, \widehat{Y}_{j}\right]_{+} = 0
\right)
\\
&=
\frac{1}{M}
\sum_{j \in \{1, \cdots, M\}}
\exp \left(
    -
    \sqrt{-1}
    \frac{
        2
        \pi
        j
    }{
        M
    }
\right)
\widehat{Y}_{j}
\cdot
\left(
    \widehat{Z}_{-j}^{(\pm)}
    \widehat{Z}_{\mu}^{(\pm)}
    +
    \widehat{Z}_{\mu}^{(\pm)}
    \widehat{Z}_{-j}^{(\pm)}
\right)
\\
&=
\frac{1}{M}
\sum_{j \in \{1, \cdots, M\}}
\exp \left(
    -
    \sqrt{-1}
    \frac{
        2
        \pi
        j
    }{
        M
    }
\right)
\widehat{Y}_{j}
\cdot
\left[\widehat{Z}_{\mu}^{(\pm)}, \widehat{Z}_{-j}^{(\pm)}\right]_{+}
\\
&=
\frac{1}{M}
\sum_{j \in \{1, \cdots, M\}}
\exp \left(
    -
    \sqrt{-1}
    \frac{
        2
        \pi
        j
    }{
        M
    }
\right)
\widehat{Y}_{j}
\cdot
\left(
    2 M \diracDelta{M}{\mu-j}{0} I
\right)
\quad
\left(
    \because \left[\widehat{Z}_{\mu}^{(\pm)}, \widehat{Z}_{-j}^{(\pm)}\right]_{+}
    = 2 M \diracDelta{M}{\mu-j}{0} I
\right)
\\
&=
\frac{1}{M}
\cdot
2 M 
\exp \left(
    -
    \sqrt{-1}
    \frac{
        2
        \pi
        \mu
    }{
        M
    }
\right)
\widehat{Y}_{\mu}
\\
&=
2 
\exp \left(
    -
    \sqrt{-1}
    \frac{
        2
        \pi
        \mu
    }{
        M
    }
\right)
\widehat{Y}_{\mu}
\\

\end{align*}
$$

$Q.E.D.$

#### $\left[H_{1}^{(\pm)}, \widehat{Y}_{\mu}\right]$ について、

TODO

#### $\left[H_{2}, \widehat{Z}_{\mu}^{(\pm)}\right]$ について、

TODO

#### $\left[H_{2}, \widehat{Y}_{\mu}\right]$ について、

TODO

---

### $T_{V_{1}}(\widehat{Z})$と$\widehat{Z},\widehat{Y}$の関係

ここからtypist


\end{align*}
$$

次回 (8/25)
- 上記証明する
    - どこで計算が進まなくなるかを見て、リー環リー群の必要な知識を探す


### メモ

$Z_{m}, Z_{m}$ を $\{1, \cdots, M\} \to \text{End}(\mathcal{F})$ という写像としてみたときに、これの定義域を$\Rf$に拡張した$C^{\infty}$関数が存在して、この関数の離散フーリエ変換をしていると考えることができる。

## $V_{1}$の対角化
### 方針メモ
- $V_{1}^{(\pm)} \in \Clgrpp{2M}$ は、それが、$T_{V_{1}^{(\pm)}}: \CClp{2M} \to \CClp{2M}$ によって定数倍を除いて決まるので、$T_{V_{1}^{(\pm)}}$を対角化することを考える
    - これは同型があるから良い
- $T_{V_{1}^{(\pm)}}$は添字のずらし $m \rightarrow m+1$ と関して不変な形をしているので, Fourier 変換によって $2 \times 2$ 行列の対角化に帰着させることができる.
    - (次回 6/9) $\widehat{Z}^{(\pm)}, \widehat{Y}^{(\pm)}$ を使って、$H_{1}, H_{2}及びV_{1}^{(\pm)}$を書く
    - 上の$Claim$ (付録B) が絡んでいるあたりが今の所完全にわからんので具体的に計算してみる
- $V_{1}^{( \pm)}$の固有ベクトルのうちで $\mathcal{F}^{( \pm)}$に属するものを集めれば $V$ 自身 の固有値・固有ベクトルがわかる.

(次回 6/2)
- 付録Bの右ページの計算を進める。一行ずつClaimにしないといけない
- $V_{1}^{(\pm)}の\mathcal{F}^{\pm}における固有ベクトルの和が、\mathcal{F}におけるV_{1}の固有ベクトルの数と等しい、みたいなことがありそう$
    - これの検証を進める

### 未来の話
- よくわかっている多様体上でのイジングモデル
    - 2次元トーラスではない閉曲面上のイジング模型を考えるのは面白そう
    - まずシンプルに種数を増やした閉曲面を考えて、モンテカルロシミュレーションやってみる
    - ポアンカレディスクを群作用で割るといろんな閉曲面が出てくる
        - トーラス(含む何種類か)だけ例外
- アニーリングとの関係
    - 完全にランダムな盤面から始まる状態の時間発展をいい感じに記述できると、厳密解に類するなんかがないか？
    - 無限時間後にありうる状態の集合が共通でもつ不変量があるとかないとか、が、厳密解の有無に関わってたりしないか
