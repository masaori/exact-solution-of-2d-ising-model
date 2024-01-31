# 必要な要素

## 構成案(1: 数ベクトル空間 $R^n$ をベースとして展開
0. 記号
<!-- 略称 -->
- $\newcommand{\linsp}{\mathrm{Linear\ Space}} \linsp: 線型空間$
<!-- 定義なし -->
- $\renewcommand{\R}{\mathbb{R}} \R: 実数体$
- $\newcommand{\C}{\mathbb{C}} \C: 複素数体$
<!-- 定義あり -->
- $\newcommand{\Rlin}[1]{\mathbb{R}^{#1}}
    \newcommand{\Rlinja}[1]{#1 次元標準\R線型空間}
    \Rlin{n}: \Rlinja{n}$
- $\newcommand{\signedInnerProd}{<\cdot,\cdot>_{p,q}} \signedInnerProd: 符号つき内積$
- $\newcommand{\signedInnerProdR}[3]{\mathbb{R}^{#1}_{#2,#3}}
    \newcommand{\signedInnerProdRja}[1]{符号つき内積をもつ #1 次元標準\R線型空間} 
    \signedInnerProdR{n}{p}{q}: \signedInnerProdRja{n}$
- $\newcommand{\Cl}[1]{\mathrm{Cl}(#1)} \Cl{V}: クリフォード代数(V:\linsp)$
- $\newcommand{\Clpq}[2]{\mathrm{Cl}_{#1,#2}} \Clpq{p}{q}: 実クリフォード代数$
- $\newcommand{\CCl}[1]{\mathbb{Cl}(#1)} \CCl{V}: 複素クリフォード代数(V:\linsp)$
- $\newcommand{\CClpq}[2]{\mathbb{Cl}_{#1,#2}} \CClpq{p}{q}: 複素クリフォード代数$
<!-- スタイル -->

1. 定義と定理
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
        - $\Rと\Cは$
    - (1/24)この辺の列挙
    - 線形空間
        - テンソル積
        - 複素化
    - 結合代数 (環R上の結合代数)
        - 剰余環: (「環上の加群」に従う)
        - 商結合代数
            - 親の環と剰余環に同じスカラー倍がwell-definedであることを言う
        - 自由代数
    - 行列環
    - クリフォード代数 (符号数つき内積付き$R^n$のテンソル代数の商代数)
        - $\Rlin{n}$ (n次元標準\R線型空間)
            - 和とスカラーを入れる (具体的にやっとく)
        - 符号数つき内積っぽい二項演算を$\R^n$上に定義する (あんまり名前もつけずに記号として定める) 
            - $\R^{n}_{p,q}$が定義できる
        - $Cl_{p,q}$ : ($\R^{n}_{p,q}$の自由代数の商結合代数)
        - スピン幾何学 補題1.1
            - $ \mathrm{Cl}_{n, 0} \otimes \mathrm{Cl}_{0,2} \cong \mathrm{Cl}_{0, n+2}, \quad \mathrm{Cl} l_{0, n} \otimes \mathrm{Cl}_{2,0} \cong \mathrm{Cl}_{n+2,0} $
            - これを複素化する
        - スピン幾何学に従って $\mathbb{C}$-行列環との同型までは行ける？
            - 命題1.10 ミスってるのでは？？
    - クリフォード群 (?)
        
2. イジング模型の分配関数の計算
    - その先の計算 (イジング模型の分配関数 => $ST:\R^{2^{n}\times 2^{n}}$これの固有値を計算する)
        - 「イジング模型と厳密解 (伊達悦朗)」
        - 「ホロノミック量子場」付録A ?

# 次回(1/24)
- ↑続き
- one note 

## 構成案(2: 線形代数 一般論から 入る
- 線形空間 (体K上の加群)
    - テンソル積 (線型空間の直積からの双線形写像を使って商空間)
- 結合代数 (環R上の結合代数)
    - テンソル代数 ($R^n$の自由代数)
- クリフォード代数 (符号数つき内積付き$R^n$のテンソル代数の商代数)
    - 符号数つき内積っぽい二項演算を定義する (あんまり名前もつけずに記号として定める) 
    - $Cl_{p.q}$から定める

