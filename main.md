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
    \newcommand{\Rlinja}[1]{#1 次元標準\R線型空間}
    \Rlin{n} := (\mathbf{R}^{n}, +_{\Rlin{n}},\cdot^{sc}_{\Rlin{n}}) : \Rlinja{n}$
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
    $$
    \begin{align}
        K&:\text{set}\\
        +&:K \times K \to K\\
            \cdot&:K \times K \to K
    \end{align}
    $$
    とする。
    - $K:set, +:K \times K \to K, \cdot:K \times K \to Kが以下を満たすとき(K, +, \cdot)を体という$
    - $\Rfと\Cfは体の具体例です$
- 線形空間
    - テンソル積
    - 複素化
    - $\Rfと\Cfはの具体例です$
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
    # (2/5) ここから
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

## 構成案(2: 線形代数 一般論から 入る
- 線形空間 (体K上の加群)
    - テンソル積 (線型空間の直積からの双線形写像を使って商空間)
- 結合代数 (環R上の結合代数)
    - テンソル代数 ($R^n$の自由代数)
- クリフォード代数 (符号数つき内積付き$R^n$のテンソル代数の商代数)
    - 符号数つき内積っぽい二項演算を定義する (あんまり名前もつけずに記号として定める) 
    - $Cl_{p.q}$から定める


# Notes

## クリフォード代数 - 行列環との同型

### 示したい命題
- 
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
        
        
