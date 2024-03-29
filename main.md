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
    \mathbb{R} := (\mathbf{R}, +_{\Rf},\cdot_{\Rf}): 実数体$
- $\newcommand{\Cf}{\mathbb{C}}
    \mathbb{C} := (\mathbf{C}, +_{\Cf},\cdot_{\Cf}): 複素数体$

##### 定義する
- $\newcommand{\Mat}[2]{\mathbf{M}(#1, #2)}
    \Mat{n}{K}: K上のn次行列の集合$
- $\newcommand{\congas}[1]{\underset{\text{as}\ #1}{\cong}}
    \congas{aaa}: 同型$
- $\newcommand{\congaslin}{\congas{\text{lin. sp.}}}
    \congaslin: 線形同型$
- $\newcommand{\congasalg}[1]{\congas{\text{ass.}\ #1-\text{alg.}}}
    \congasalg{\Rf}: 結合代数同型$
- $\newcommand{\congasztwo}{\congas{\text{ass.}\ \Zr_{2}次数つき\text{alg.}}}
    \congasztwo: \Zr_{2} 代数同型$
- $\newcommand{\subspadd}[1]{+^{\text{sub.sp.}}_{#1}}
    \newcommand{\subspaddja}[1]{部分空間 \ #1 同士の和}
    \subspadd{V}: \subspaddja{V}$
- $\newcommand{\scprod}[1]{\cdot^{\text{sc}}_{#1}}
    \newcommand{\scprodja}[1]{\linsp{K} \ #1 の スカラー積}
    \scprod{V}: \scprodja{V}$
- $\newcommand{\basis}[1]{E_{#1}}
    \newcommand{\basisja}[1]{\linsp{K} \ #1 の 基底}
    \basis{V}: \basisja{V}$
- $\newcommand{\stdbasis}[2]{E^{std}_{{#1}^{#2}}}
    \newcommand{\stdbasisja}[2]{\linsp{K} {#1}^{#2} の標準基底}
    \stdbasis{K}{n}: \stdbasisja{K}{n}$
- $\newcommand{\stdbasiselm}[2]{e^{(#2)}_{#1}}
    \newcommand{\stdbasiselmja}[2]{\linsp{K} \ #1 の 標準基底の要素 で添え字が #2 }
    \stdbasiselm{V}{i}: \stdbasiselmja{V}{i}$
- $\newcommand{\eqclass}[2]{[#2]_{#1}}
    \newcommand{\eqclassja}[2]{集合 \ #1 における #2 の 同値類}
    \eqclass{S}{v}: \eqclassja{S}{v}$
- $\newcommand{\Ztwo}{\Zr_{2}}
    \Ztwo := \Zr/2\Zr から積を忘れて巡回群として見たもの$
- $\Kf := (\Kset, +_{\Kf},\cdot^{sc}_{\Kf}): 体に対して、$
  - $\newcommand{\stdlin}[2]{#1_{\mathrm{lin}}^{#2}}
    \newcommand{\stdlinja}[2]{#2 次元標準\linsp{#1}}
    \stdlin{\Kset}{n} := (\Kset^{n}, +_{\stdlin{\Kset}{n}},\cdot^{sc}_{\stdlin{\Kset}{n}}) : \stdlinja{\Kf}{n}$
- $\newcommand{\Rlin}[1]{\mathbf{R}_{\mathrm{lin}}^{#1}}
    \newcommand{\Rlinja}[1]{#1 次元標準\linsp{\Rf}}
    \Rlin{n} := (\mathbf{R}^{n}, +_{\Rlin{n}},\cdot^{sc}_{\Rlin{n}}) : \Rlinja{n}$
- $\newcommand{\Clin}[1]{\mathbf{C}_{\mathrm{lin}}^{#1}}
    \newcommand{\Clinja}[1]{#1 次元標準\linsp{\Cf}}
    \Clin{n} := (\mathbf{C}^{n}, +_{\Clin{n}},\cdot^{sc}_{\Clin{n}}) : \Clinja{n}$
- $\newcommand{\Matlin}[2]{\mathbf{M}_{\mathrm{lin}}(#1, #2)}
    \newcommand{\Matlinja}[2]{#2上の#1次正方行列のなす\linsp{K}}
    \Matlin{n}{K}: \Matlinja{n}{K}$
- $\newcommand{\signedInnerProd}[4]{<#3,#4>_{#1,#2}}
    \newcommand{\signedInnerProdja}[4]{(#1,#2)\text{-符号つき内積}}
    \signedInnerProd{p}{q}{\cdot}{\cdot}: \signedInnerProdja{p}{q}{\cdot}{\cdot}$
- $\newcommand{\signedInnerProdR}[2]{\mathbf{R}^{#1,#2}_{\mathrm{lin}}}
    \newcommand{\signedInnerProdRja}[2]{符号つき内積 \signedInnerProd{p}{q}{\cdot}{\cdot} をもつ (#1+#2) 次元標準\linsp{\Rf}} 
    \signedInnerProdR{p}{q}: \signedInnerProdRja{p}{q}$
- $\newcommand{\Ggradedalg}[1]{#1\text{-}次数代数}
    \newcommand{\Ggradedalgja}[1]{#1\text{-}次数代数} 
    \Ggradedalg{G}: \Ggradedalgja{G}$
- $\newcommand{\tensoralg}[1]{T(#1)}
    \newcommand{\tensoralgja}[1]{#1上のテンソル代数} 
    \tensoralg{V}: \tensoralgja{V}$
- $\newcommand{\Cl}[1]{\mathrm{C}l(#1)}
    \newcommand{\Clja}[1]{#1上のクリフォード代数}
    \Cl{V}: \Clja{V}$
- $\newcommand{\Clpq}[2]{\mathrm{C}l_{#1,#2}}
    \newcommand{\Clpqja}[2]{#1次元#2次数のクリフォード代数}
    \Clpq{p}{q}: 実クリフォード代数$
- $\newcommand{\CCl}[1]{\mathbb{Cl}(#1)}
    \CCl{V}: 複素クリフォード代数(V:\linsp)$
- $\newcommand{\CClp}[1]{\mathbb{Cl}_{#1}}
    \CClp{p}: 複素クリフォード代数$
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

次回(3/9)
- クリフォード代数の基底の記号を定め↓たら、計算を進める(最下部)

- $\signedInnerProdR{p}{q}$が定義できる
- $Cl_{p,q}$ : ($\R^{n}_{p,q}$の自由代数の商結合代数)
    - $I := \left(\{v \cdot v - \signedInnerProd{p}{q}{v}{v} \mid v \in \R^{n}_{p,q} \}から生成される両側イデアル\right)$
    - $Cl_{p,q} := \tensoralg{\signedInnerProdR{p}{q}}/I$
- $Cl_{0,1}$の基底
    - $\{ (\basiselm{\signedInnerProdR{0}{1}}{1})^{\otimes 0}, (\basiselm{\signedInnerProdR{0}{1}}{1})^{\otimes 1}, \cdots \} \subset \tensoralg{\signedInnerProdR{p}{q}}$は、基底
    - $l \in Cl_{0,1}$は、$l = r_{even} \scprod{Cl_{0,1}} \eqclass{Cl_{0,1}}{(\basiselm{\signedInnerProdR{0}{1}}{1})^{\otimes 0}} - r_{odd} \scprod{Cl_{0,1}} \eqclass{Cl_{0,1}}{(\basiselm{\signedInnerProdR{0}{1}}{1})^{\otimes 1}}$
        - 証明はone note $Cl_{1} \cong \Cf$ 参照
    - $\{ \eqclass{Cl_{0,1}}{(\basiselm{\signedInnerProdR{0}{1}}{1})^{\otimes 0}},  \eqclass{Cl_{0,1}}{(\basiselm{\signedInnerProdR{0}{1}}{1})^{\otimes 1}}\}$
        が$Cl_{0,1}$の基底であることを示す
        - 証明はone note $Cl_{1} \cong \Cf$ 参照
- $Cl_{0,2}$の基底
    - $\basiselm{}{}$
- スピン幾何学 補題1.1
    - $ \mathrm{Cl}_{n, 0} \otimes \mathrm{Cl}_{0,2} \cong \mathrm{Cl}_{0, n+2}, \quad \mathrm{Cl} l_{0, n} \otimes \mathrm{Cl}_{2,0} \cong \mathrm{Cl}_{n+2,0} $
    - これを複素化する
- スピン幾何学に従って $\mathbb{C}$-行列環との同型までは行ける？
    - 命題1.10 ミスってるのでは？？
- 基底の記号を定める
- クリフォード群 (?)

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
        
        
