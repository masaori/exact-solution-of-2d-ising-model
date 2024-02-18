# 必要な要素

## 構成案(1: 数ベクトル空間 $R^n$ をベースとして展開
### 0. 記号
##### 略称
- $\newcommand{\linsp}{\mathrm{Linear\ Space}} \linsp: 線型空間$
##### 定義する
- $\renewcommand{\Z}{\mathbf{Z}}
    \Z: 集合としての整数$
- $\newcommand{\Zpos}{\mathbf{Z}_{\geq 0}}
    \Zpos := \{0, 1, 2, ...\} \subset \Z $
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
- $\newcommand{\scprod}[1]{\cdot^{\text{sc}}_{#1}}
    \newcommand{\scprodja}[1]{\linsp \ #1 の スカラー積}
    \scprod{V}: \scprodja{V}$
- $\newcommand{\basis}[1]{E_{#1}}
    \newcommand{\basisja}[1]{\linsp \ #1 の 基底}
    \basis{V}: \basisja{V}$
- $\newcommand{\basiselm}[2]{e^{(#2)}_{#1}}
    \newcommand{\basiselmja}[2]{\linsp \ #1 の 基底の #2 番目の要素}
    \basiselm{V}{i}: \basiselmja{V}{i}$
- $\newcommand{\eqclass}[2]{[#2]_{#1}}
    \newcommand{\eqclassja}[2]{集合 \ #1 における #2 の 同値類}
    \eqclass{S}{v}: \eqclassja{S}{v}$

##### 定義する
- $\newcommand{\Ztwo}{\Zr_{2}}
    \Ztwo := \Zr/2\Zr から積を忘れて巡回群として見たもの$
- $\newcommand{\Rlin}[1]{\mathbf{R}_{\mathrm{lin}}^{#1}}
    \newcommand{\Rlinja}[1]{#1 次元標準\Rf線型空間}
    \Rlin{n} := (\mathbf{R}^{n}, +_{\Rlin{n}},\cdot^{sc}_{\Rlin{n}}) : \Rlinja{n}$
- $\newcommand{\Clin}[1]{\mathbf{C}_{\mathrm{lin}}^{#1}}
    \newcommand{\Clinja}[1]{#1 次元標準\Cf線型空間}
    \Clin{n} := (\mathbf{C}^{n}, +_{\Clin{n}},\cdot^{sc}_{\Clin{n}}) : \Clinja{n}$
- $\newcommand{\Matlin}[2]{\mathbf{M}_{\mathrm{lin}}(#1, #2)}
    \newcommand{\Matlinja}[2]{#2上の#1次正方行列のなすK線型空間}
    \Matlin{n}{K}: \Matlinja{n}{K}$
- $\newcommand{\signedInnerProd}[4]{<#3,#4>_{#1,#2}}
    \signedInnerProd{p}{q}{\cdot}{\cdot}: 符号つき内積$
- $\newcommand{\signedInnerProdR}[2]{\mathbf{R}_{#1,#2}}
    \newcommand{\signedInnerProdRja}[2]{符号つき内積をもつ (#1+#2) 次元標準 \R 線型空間} 
    \signedInnerProdR{p}{q}: \signedInnerProdRja{p}{q}$
- $\newcommand{\Ggradedalg}[1]{#1\text{-}次数代数}
    \newcommand{\Ggradedalgja}[1]{#1\text{-}次数代数} 
    \Ggradedalg{G}: \Ggradedalgja{G}$
- $\newcommand{\tensoralg}[1]{T^{*}(#1)}
    \newcommand{\tensoralgja}[1]{テンソル代数(#1:\linsp)} 
    \tensoralg{V}: \tensoralgja{V}$
- $\newcommand{\Cl}[1]{\mathrm{C}l(#1)}
    \Cl{V}: クリフォード代数(V:\linsp)$
- $\newcommand{\Clpq}[2]{\mathrm{C}l_{#1,#2}}
    \Clpq{p}{q}: 実クリフォード代数$
- $\newcommand{\CCl}[1]{\mathbb{Cl}(#1)}
    \CCl{V}: 複素クリフォード代数(V:\linsp)$
- $\newcommand{\CClp}[1]{\mathbb{Cl}_{#1}}
    \CClp{p}: 複素クリフォード代数$
- $\newcommand{\Cmat}[1]{\mathbb{C}({#1})}
    \Cmat{p}: \Cf 行列環$
- $\newcommand{\otimesalg}[1]{\otimes^{alg}_{#1}}
    \otimesalg{\Cf}: 代数のテンソル積$
- $\newcommand{\otimeshat}{\widehat{\otimes}}
    \otimeshat: \Ggradedalg{\Ztwo}のテンソル積$ 
<!-- スタイル -->

### 1. 定義と定理

- 群
    - Z2 (Rから0,1取ってきて演算表で定義)
- 体
    - 定義
    $$
    \begin{align}
        K&:\text{set}\\
        +_{K}&:K \times K \to K\\
            \cdot_{K}&:K \times K \to K
    \end{align}
    $$
    とする。
    - $K:set, +_{K}:K \times K \to K, \cdot_{K}:K \times K \to Kが以下を満たすとき(K, +_{K}, \cdot_{K})を体という$
        - (1) $K$ の任意の元  に対し, $(a+b)+c=a+(b+c)$ がなりたつ. (和の結合則)
        - (2) $K$ の元 0 で, $K$ の任意の元 $a$ に対し, $a+0=0+a=a$ をみたすも のがただ 1 つある. (零元の存在)
        - (3) $K$ の任意の元 $a$ に対し, $a+b=b+a=0$ をみたす $K$ の元 $b$ がただ 1 つある. (和の逆元の存在)
        - (4) $K$ の任意の元 $a, b$ に対し, $a+b=b+a$ がなりたつ. (和の可換則)
        - (5) $K$ の任意の元 $a, b, c$ に対し, $(a b) c=a(b c)$ がなりたつ. (積の結合則)
        - (6) $K$ の 0 でない元 1 で, $K$ の任意の元 $a$ に対し, $a 1=1 a=a$ をみたす ものがただ 1 つある. (積の単位元の存在)
        - (7) $K$ の 0 でない任意の元 $a$ に対し, $a b=b a=1$ をみたす $K$ の元 $b$ がた だ 1 つある. (積の逆元の存在)
        - (8) $K$ の任意の元 $a, b$ に対し, $a b=b a$ がなりたつ. (積の可換則)
        - (9) $K$ の任意の元 $a, b, c$ に対し, $(a+b) c=a c+b c, a(b+c)=a b+a c$ が なりたつ. (分配則)
    - ↑論理式で書き直す
    - $\Rfと\Cfは体の具体例です$
        - 積は略記します
### 線型空間
$$
\begin{align}
    V&:\text{set}\\
    +_{V}&:V \times V \to V\\
    \scprod{V}&:K \times V \to V
\end{align}
$$
が、以下を満たすとき$V$を$K-Linear\ Space$という
- (1) $V$ の任意の元 $x, y, z$ に対し, $(x+y)+z=x+(y+z)$ がなりたつ.
- (2) $V$ の元 0 で, $V$ の任意の元 $x$ に対し, $x+0=0+x=x$ をみたすもの がただ 1 ある.
- (3) $V$ の任意の元 $x$ に対し, $x+y=y+x=0$ をみたす $V$ の元 $y$ がただ 1 つある。
- (4) $V$ の任意の元 $x, y$ に対し, $x+y=y+x$ がなりたつ.
- (5) $K$ の任意の元 $a$ と $V$ の任意の元 $x, y$ に対し, $a(x+y)=a x+a y$ がな りたつ.
- (6) $K$ の任意の元 $a, b$ と $V$ の任意の元 $x$ に対し, $(a b) x=a(b x)$ と $(a+b) x=a x+b x$ がなりたつ.
- (7) $V$ の任意の元 $x$ に対し, $1 x=x$ がなりたつ.
- ↑論理式で書き直す
- $\Rlin{n}$ (n次元標準\R線型空間) は具体例です
#### def. 基底
$V$ を $K$ 線形空間とし, $x_1, \ldots, x_n$ を $V$ の元とする. $x_1, \ldots, x_n$
が $V$ の基底 (basis) であるとは, $V$ の任意の元 $x$ に対し, $x=a_1 x_1+\cdots+a_n x_n$ をみたす $a=\left(\begin{array}{c}a_1 \\ \vdots \\ a_n\end{array}\right) \in K^n$ が，たた 1 つ存在することをいう.

==== この辺は本に投げても良いかも
#### def. 線型独立
$V$ を $K$ 線形空間とし, $x_1, \ldots, x_n$ を $V$ の元とする. $x_1, \ldots, x_n$ が $\left\langle x_1, \ldots, x_n\right\rangle$ の基底であるとき， $x_1, \ldots, x_n$ は 1 次独立 (linearly independent) であるという.

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
$V$ を $K$ 線形空間とし, $W$ を $V$ の $K$ 部分空間とする. $V$ の $W$ による商空間 (quotient space) とは, $V$ の部分集合 $V/W$ であって, 次の条件をみたすものである.

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
[v]_{V/W} := \eqclass{\sim_{W}}{v}
$$
と定める。


### テンソル積


- (次回:2/14) ここから
    - テンソル代数/クリフォード代数の基底の表記くらいまではかっちり決めておきたい
    
- 複素化

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
    - $\Rlin{n}$ (n次元標準\R線型空間)
        - 和とスカラーを入れる (具体的にやっとく)
    - 符号数つき内積っぽい二項演算を$\R^n$上に定義する (あんまり名前もつけずに記号として定める) 
        - $\R^{n}_{p,q}$が定義できる
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
- クリフォード群 (?)
        
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
        
        
