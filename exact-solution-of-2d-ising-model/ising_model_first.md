めも
- $s_{i,j} \in \mathbb{Z}/2\mathbb{Z} := \{0, 1\}$みたいに捉えるのはどうか
- $\mathbb{Z}/2\mathbb{Z} \times \mathbf{R} \to \mathbf{R}$

$$
    Z(J,J'):=\sum_{
        \begin{align*}
            s_{i,j}\in \mathbb{Z}/2\mathbb{Z}\\
            s_{i,N+1=s_i,1}\\
            s_{M+1,j}=s_{1,j}
        \end{align*}
        }
        \left(\prod^M_{i=1}\left(
            \left(\prod^N_{j_1=1}\exp((s_{i,j_1}+_{\mathbb{Z}/2\mathbb{Z}} s_{i,j_1+1}) \cdot J)\right)
            \cdot 
            \left(\prod^N_{j_1=1}\exp(J\cdot s_{i,j_2}\cdot s_{i+1,j_2})\right)
        \right)\right)
$$

"2次元Ising模型の厳密解"
$$
\newcommand{\bM}{\mathbb{M}}
\newcommand{\bR}{\mathbb{R}}
\newcommand{\Rpos}{\mathbb{R}_{> 0}}
\newcommand{\Mone}{\mathbb{M}_{+1}}
\newcommand{\Zone}{\mathbb{Z}_{\geq 1}}
\newcommand{\dsp}{\displaystyle}
$$
- $J,J'\in\Rpos,\ M,N\in\Zone$として
    $$
    Z(J,J'):=\sum_{
        \begin{align*}
            s_{i,j}\in\{\pm 1\}\\
            s_{i,N+1=s_i,1}\\
            s_{M+1,j}=s_{1,j}
        \end{align*}
        }
        \left(\prod^M_{i=1}\left(
            \left(\prod^N_{j_1=1}\exp(J\cdot s_{i,j_1}\cdot s_{i,j_1+1})\right)
            \cdot 
            \left(\prod^N_{j_1=1}\exp(J\cdot s_{i,j_2}\cdot s_{i+1,j_2})\right)
        \right)\right)
    $$
- $\bM:=\{\mu:\{1,...,N\}\to\{-1,1\}\},\ \Mone:=\{\mu\{1,...,N+1\}\to\{-1,1\}\mid\mu(N+1)=\mu(1)\}$として
    $$
    \begin{align*}
    \Mone\longleftrightarrow\bM\\
    \mu\mapsto\mu|_{\{1,...,N,\}}\\
    \mu\text{ s.t. }\mu(i)=\mu'(i)\text{ and }\mu(N+1):=\mu'(1)\leftarrow\ \mu'
    \end{align*}
    $$
    により、1:1に対応する。
#
**命題1** $\Phi:\bM\rightarrow\{1,...,2^N\},\ \mu\mapsto 1+\dsp\sum^n_{i=1}\dfrac{\mu(i)+1}{2}\cdot2^{k-1}$は全単射。
#
**(proof)** 逆写像をつくる。

- **主張1.1** $m\in\{1,...2^N\}$に対し、
    $$
        m=1+\sum_{k \in K} 2^{k-1}
    $$
    となる$K\subset \{1,...,N\}$はただ一つ存在する。
    #
    (proof) 数学的帰納法で示す。
    1. m=1のとき、$K=\emptyset$が存在し、$K\neq\emptyset$のとき、$\exists k_0\in K$
        $$
        \begin{align*}
            &1+\underbrace{\sum_{k\in K}2^{k-1}}_{\normalsize \geq 2^{k_0-1}\geq 1}\\
            &\geq 2
        \end{align*}
        $$
         となるので、唯一つ。
    2. $m<2^N$となるmで成立するとき、$\exists !K_m \text { s.t. } m=1\dsp+\sum_{k \in K_m} 2^{k-1}$
    $K_m=\{1,...,N\}$とすると、$\dsp 1+\sum_{k\in K/m}2^{k-1}=2^N$となるので、$K_m\neq\{1,...,N\}$である。
    $K_mに入らない\{1,...,N\}$の最小の元を$k_0$とすると
        $$
        \begin{align*}
            &m+1
            =
            \left(1+\underline{\sum_{k \in K_m} 2^{k-1}}\right)+1\\
            &=
            1
            +
            \underline{
                \underbrace{\left(\sum_{\begin{align*}&\footnotesize k\in K_m\\&\footnotesize k<k_0\end{align*}} 2^{k-1}\right)}
                +
                \Biggl(\sum_{\begin{align*}&\footnotesize k\in K_m\\&\footnotesize k>k_0\end{align*}} 2^{k-1}\Biggl)
            }
            +
            1\\
            &\hspace{20pt}(\text{$k_0$を境に分けただけ})\\
            &=
            \underline{1}+
            \underline{\left(\sum_{k=1,2,...,k_0-1} 2^{k-1}\right)}
            +
            \Biggl(\sum_{\begin{align*}&\footnotesize k\in K_m\\&\footnotesize k>k_0\end{align*}} 2^{k-1}\Biggl)
            +
            1\\
            &\hspace{20pt}(\text{$k_0$の定義})\\
            &=
            \underbrace{\underline{2^{k_0}}}
            +
            \underbrace{\Biggl(\sum_{\begin{align*}&\footnotesize k\in K_m\\&\footnotesize k>k_0\end{align*}} 2^{k-1}\Biggl)}
            +
            1\\
            &\hspace{20pt}(\text{等比数列の公式})\\
            =
            1
            +
            \underbrace{\sum_{k \in\{k_0\}\cup(K_m\cap\{k_0<k\})} 2^{k-1}}
        \end{align*}
        $$
        よって$m+1$に対して命題を満たす$K_{m+1}$存在する。
        $K\neq K'$について $1+\sum_{k \in K} 2^{k-1}=1+\sum_{k \in K'} 2^{k-1}$・・・①が成立したとすると $\exists l\in K\setminus (K\cup K')$ or $\exists l\in K'\setminus (K\cup K')$となるので、最大なものを$l^*$とすると、まず$l^*\in K$のとき①から
        $$
        1+\sum_{\begin{align*}k\in K\cap K'\\ k>l^*\end{align*}}2^{k-1}
        $$
        を引いて
        $$
        \text{(左辺)}\geq 2^{l^*-1}>2^{l^*-1}-1=\sum_{k=1,...,l^*-1}\geq \text{(右辺)}
        $$
        となるので矛盾。$l^*\in K'$も同様。よって、$m+1$について示された。
    
    $\Psi:\{1,2,...,2^N\}\to \bM,\ m\mapsto \mu_m\text{ s.t. }\mu_m(x)=\begin{cases}-1 &(x\notin K)\\ 1 &(x\in K)\end{cases}$
    とすると
    $$
    \Psi\circ\Phi (\mu)=\Psi\left(1+\sum_{k=1}^N\dfrac{\mu (k)+1}{2}\cdot 2^{k-1}\right)\text{・・・②}
    $$
    $K_\mu:=\{k| \mu (k)=1\}$とすると
    $$
    \begin{align*}
    &1+\sum_{k\in K_\mu}2^{k-1}=1+\underbrace{\sum_{k\in K_\mu}\dfrac{\mu (k)+1}{2}\cdot 2^{k-1}}_{この範囲において常に\mu(k)=1なので}+\underbrace{\sum_{k\in\{1,...,N\}\setminus K_\mu}\dfrac{\mu (k)+1}{2}\cdot 2^{k-1}}_{=0 \text{ なので足して良い}}\\
    &=1+\sum_{k=1}^N\dfrac{\mu (k)+1}{2}\cdot 2^{k-1}
    \end{align*}
    $$
    となるので、命題1.1の唯一性より
    $$
        ②=\mu_m \text{ s.t. }\mu_m (x)=\begin{cases}-1  &(x\notin K)\\ 1 &(x\in K)\end{cases}
    $$
    よって、$\mu_m=\mu$より$②=\mu$
    また、
    $$
    \begin{align*}
    &\Phi\circ\Psi(m)=\Phi\left(\mu_m\text{ s.t. }\mu_m (x)=\begin{cases}-1 &(x\notin K_m)\\ 1 &(x\in K_m)\end{cases}\text{ s.t. }1+\sum_{k\in K_m}2^{k-1}=m\right)\\
    &=1+\sum_{k=1}^N\dfrac{\mu_m (k)+1}{2}\cdot 2^{k-1}\\
    &=
    1
    +
    \underbrace{
        \sum_{k\in K_m}\dfrac{\mu_m (k)+1}{2}\cdot 2^{k-1}
    }_{=
        \dsp\sum_{k\in K_m}2^{k-1}
    }
    +
    \underbrace{\sum_{k\in\{1,...,N\}\setminus K_m}\dfrac{\mu_m (k)+1}{2}\cdot 2^{k-1}}_{=0}\\
    &=m\\
    &\hspace{10pt}\text{ (Kの定義より)}\\    
    \end{align*}
    $$
    よって、互いに逆写像なので、全単射。

##
- $A=(a_{i,j})_{i=1,...,M_A,\ j=1,...,N_A},\ B=(b_{i,j})_{i=1,...,M_B,\ j=1,...,N_B}$に対し、Kronecker積
    $$
    \begin{align*}
    A\otimes B:=\begin{pmatrix}
    a_{11}B & \cdots& a_{1N_A}B\\
    \vdots &  &\vdots\\
    a_{M_A1}B&\dots&a_{M_AN_A}B
    \end{pmatrix}
    \end{align*}
    $$
    と定義する。
    つまり、$A\otimes B$の((i-1)M_B+k,(j-1)N_B+l)成分は$a_{i,j}b_{k,l}$である。
##
命題2. $A\otimes (B\otimes C)=(A\otimes B)\otimes C$
##
(proof)定義に沿って計算。
##
命題3. A_1,...,A_nについて、どの順にKrocker積をとっても同じ行列がえられる。
##
（proof）半群についての結合則についての帰納法。付け加えるのが最初か中間か最後かで場合分け。
##
命題4. $A\otimes B\cdot C\otimes D=AC\otimes BD$
##
(proof)定義に沿って計算。
##
命題5. $A_1\otimes\cdots\otimes A_n\cdot B_1\otimes\cdots\otimes B_n=(A_1\cdot B_1)\otimes\cdots\otimes(A_n\cdot B_n)$
##
(proof)$A_1(\otimes A_2(\otimes\cdots\otimes A_n)...)$と席の順をさだめて計算。
#
$I_2:=\begin{pmatrix}1&0\\0&1\end{pmatrix}, \sigma_x:=\begin{pmatrix}0&1\\1&0\end{pmatrix},\ \sigma_y:=\begin{pmatrix}0&-\sqrt{-1}\\\sqrt{-1}&0\end{pmatrix},\ \sigma_z:=\begin{pmatrix}1&0\\0&-1\end{pmatrix}$とすると、
$\sigma_s^{(j)}:=I_2\otimes\cdots\otimes I_2\otimes\underbrace{\sigma_s}_{j番目}\otimes I_2\otimes\cdots\otimes I_2\  (s=x,y,z)$
さらに $\sigma_s^{(N+1)}:=\sigma_s^{(1)}$ とする
$V_1:=\exp\left(J\sum_{j=1}^N\sigma_z^{(j)}\sigma_z^{(j+1)} \right)$
##
**命題6.** 
- $\mu,\mu'\in\bM$に対し、$V_1$の$(m,n)$-成分$V_{1\ \Psi(\mu),\Psi(\mu')}$は
    $$
    \begin{align*}
    V_{1\ \Psi(\mu),\Psi(\mu')}=\begin{cases} \dsp\prod_{j=1}^N\exp(J\mu(j)\mu(j+1)) & (\mu=\mu')\\ 0 & (\text{otherwise})\end{cases}
    \end{align*}
    $$
##
- (proof) 
    **命題6.1**
    $A$と$B$が可換 $\Rightarrow$ $\exp(A+B)=\exp(A)\exp(B)$
    **命題6.2**
    $A_1,...,A_N$ : $2\times 2$-matrixについて
    $$
    (A_1\otimes\cdots\otimes A_N)_{\ \Phi(\mu),\Phi(\mu')}=\prod_{j=1}^N(A_j)_{\ \frac{\mu(N-j+1)+1}{2},\frac{\mu'(N-j+1)+1}{2}}
    $$
    - (proof)
        $$
        \begin{align*}
        &(左辺)＝(A_1\otimes\cdots\otimes A_N)_{\ 1+\sum_{k=1}^N\frac{\mu(k)+1}{2}\cdot 2^{k-1},1+\sum_{k=1}^N\frac{\mu'(k)+1}{2}\cdot 2^{k-1}}\\
        &\hspace{10pt}(\text{$\Phi$の定義})\\
        &=\left(A_1\otimes (A_2\otimes\cdots\otimes A_N)\right)_{\ 1+\sum_{k=1}^N\frac{\mu(k)+1}{2}\cdot 2^{k-1},1+\sum_{k=1}^N\frac{\mu'(k)+1}{2}\cdot 2^{k-1}}\\
        &\hspace{10pt}(\text{命題3})\\
        &=A_{1\ \frac{\mu(N)+1}{2},1\ \frac{\mu'(N)+1}{2}}\cdot (A_2\otimes\cdots\otimes A_N)_{\ 1+\sum_{k=1}^{N-1}\frac{\mu(k)+1}{2}\cdot 2^{k-1},1+\sum_{k=1}^{N-1}\frac{\mu'(k)+1}{2}\cdot 2^{k-1}}\\
        &\hspace{10pt}(\text{Kronecker積のdef})\\
        &=(右辺)\\
        &\hspace{10pt}(\text{繰り返す})
        \end{align*}
        $$
    **命題6.3**
        $D$ : n-matrixについて $D=:diag(d_1,...,d_n)$とすると
        $$
        \exp D=diag(\exp(d_1),...,\exp(d_n))
        $$
        - (proof)
            $$
            \begin{align*}
            \exp D&=\sum_{k=0}^\infty\dfrac{D^k}{k!}\\
            &=\sum_{k=0}^\infty\dfrac{diag(d_1^k,...,d_n^k)}{k!}\\
            &=diag\left(\sum_{k=0}^\infty\dfrac{d_1^k}{k!},...,\sum_{k=0}^\infty\dfrac{d_n^k}{k!}\right)\\
            &=diag(\exp(d_1),...,\exp(d_n))
            \end{align*}
            $$
    
    $$
    \begin{align*}
        &V_{1\ \Psi(\mu),\Psi(\mu')}=\left(\exp\left(J\sum_{j=1}^N\sigma_z^{(j)}\sigma_z^{(j+1)} \right)\right)_{\Psi(\mu),\Psi(\mu')}\\
        &=\left(\prod_{j=1}^N\left(\exp\left(\underbrace{J\sigma_z^{(j)}\sigma_z^{(j+1)} }\right)_{}\right)\right)_{\mu(j),\mu'(j)}・・・①\\
        &\hspace{10pt}(\text{命題6.1})\\
        &(\underbrace{J\sigma_z^{(j)}\sigma_z^{(j+1)} })_{\Phi(\mu),\Phi(\mu')}\\
        &=
        J\cdot I_{\frac{\mu(N)+1}{2},\frac{\mu'(N)+1}{2}}\cdot I_{\frac{\mu(N-1)+1}{2},\frac{\mu'(N-1)+1}{2}}\cdot\cdots\cdot I_{\frac{\mu(N-j+2)+1}{2},\frac{\mu'(N-j+2)+1}{2}}\cdot \sigma_{z\ \frac{\mu(N-j+1)+1}{2},\frac{\mu'(N-j+1)+1}{2}}\\
        &\cdot \sigma_{z\ \frac{\mu(N-j)+1}{2},\frac{\mu'(N-j)+1}{2}}\cdot I_{\frac{\mu(N-j-1)+1}{2},\frac{\mu'(N-j-1)+1}{2}}\cdot \cdots\cdot I_{\frac{\mu(1)+1}{2},\frac{\mu'(1)+1}{2}}\\
        &=
        J\cdot\delta_{\mu(N),\mu'(N)}\cdot\delta_{\mu(N-1),\mu'(N-1)}\cdot\cdots\cdot\delta_{\mu(N-j+2),\mu'(N-j+2)}\\
        &\cdot(\delta_{\mu(N-j+1),\mu'(N-j+1)}\cdot (-\mu(N-j+1)))\cdot(\delta_{\mu(N-j),\mu'(N-j)}\cdot (-\mu(N-j)))\\
        &\cdot\delta_{\mu(N-j-1),\mu'(N-j-1)}\cdot\cdots\cdot\delta_{\mu(1),\mu'(1)}\\
        &=J\cdot\delta_{\mu(1),\mu'(1)}\cdot\cdots\cdot\delta_{\mu(N),\mu'(N)}\cdot\mu(N-j+1)\cdot\mu(N-j)\\
    \end{align*}
    $$
    よって$\underbrace{J\sigma_z^{(j)}\sigma_z^{(j+1)}}$はdiagonal matrixなので命題6.3より
    $$
    \begin{align*}
    &\exp\left(J\sigma_z^{(j)}\sigma_z^{(j+1)} \right)_{\Psi(\mu),\Psi(\mu')}=\begin{cases} \exp(J\cdot\mu(N-j+1)\cdot\mu(N-j)) & (\mu=\mu')\\ 0 & (\text{otherwise})\end{cases}\\
    \end{align*}
    $$
    よって
    $$
    \begin{align*}
    ①=\begin{cases} \prod_{j=1}^N\exp(J\mu(j)\mu(j+1)) & (\mu=\mu')\\ 0 & (\text{otherwise})\end{cases}
    \end{align*}
    $$
##
$$
\begin{align*}
V_2&:=(2\sinh 2J')^\frac{N}{2}\exp\left(-\frac{1}{2}\log(\tanh J')\sum_{j=1}^N\sigma_x^{(j)} \right)とおく\\
\end{align*}
$$
##
命題7. 
$$
\begin{align*}
&V_{2\ \Psi(\mu),\Psi(\mu')}=\prod_{j=1}^N \exp(J'\mu(j)\mu'(j))\\
\end{align*}
$$
##
- (proof) 
    $$
    \begin{align*}
    &V_{2\ \Psi(\mu),\Psi(\mu')}=\left((2\sinh 2J')^\frac{N}{2}\exp\left(-\frac{1}{2}\log(\tanh J')\sum_{j=1}^N\sigma_x^{(j)} \right)\right)_{\Psi(\mu),\Psi(\mu')}\\
    &=\left(\prod^{N}_{j=1}(2\sinh 2J')^\frac{1}{2}\exp\left(-\frac{1}{2}\log(\tanh J')\sigma_x^{(j)} \right)\right)_{\Psi(\mu),\Psi(\mu')}・・・①\\
    &\hspace{10pt}(\text{命題6.1})\\
    \end{align*}
    $$
    命題7.1
    $$
    \begin{align*}
    \exp(I_2\otimes\cdots\otimes I_2\otimes A\otimes I_2\otimes\cdots\otimes I_2)_{\ \Phi(\mu),\Phi(\mu')}=I_2\otimes\cdots\otimes I_2\otimes \exp(A)\otimes I_2\otimes\cdots\otimes I_2\\
    \end{align*}
    $$
    - (proof)
        $$
        \begin{align*}
        &(左辺)=\sum_{k=0}^\infty\dfrac{(I_2\otimes\cdots\otimes I_2\otimes A\otimes I_2\otimes\cdots\otimes I_2)^k}{k!}\\
        &=\sum_{k=0}^\infty\dfrac{1}{k!}I_2\otimes\cdots\otimes I_2\otimes A^k\otimes I_2\otimes\cdots\otimes I_2\\
        &=I_2\otimes\cdots\otimes I_2\otimes \left(\sum_{k=0}^\infty\dfrac{1}{k!}A^k\right)\otimes I_2\otimes\cdots\otimes I_2\\
        &（部分列について等しいと示し、どちらも収束すると示せば収束先は等しい）\\
        &=I_2\otimes\cdots\otimes I_2\otimes \exp(A)\otimes I_2\otimes\cdots\otimes I_2\\
        \end{align*}
        $$
    よって
    $$
    \begin{align*}
    &①=\left(\prod_{j=1}^N(2\sinh 2J')^\frac{1}{2}I_2\otimes\cdots\otimes I_2\otimes \exp\left(-\frac{1}{2}\log(\tanh J')\right) \otimes I_2\otimes\cdots\otimes I_2 \right)_{\Psi(\mu),\Psi(\mu')}\\
    &=\left((2\sinh 2J')^\frac{N}{2} \exp\left(-\frac{1}{2}\log(\tanh J')\right)\otimes\cdots\otimes  \exp\left(-\frac{1}{2}\log(\tanh J')\right)\right)_{\Psi(\mu),\Psi(\mu')}\\
    \end{align*}
    $$
    ここで
    $$
    \begin{align*}
    &\exp\left(-\frac{1}{2}\log(\tanh J')\sigma_x\right)=\sum_{k=0}^\infty\dfrac{\left(-\frac{1}{2}\log(\tanh J')\begin{pmatrix}0&1\\1&0\end{pmatrix}\right)^k}{k!}\\
    &=
    \begin{pmatrix}
        \sum_{k=0}^\infty\dfrac{(-\frac{1}{2}\log(\tanh J'))^{2k}}{(2k)!} & \sum_{k=0}^\infty\dfrac{(-\frac{1}{2}\log(\tanh J'))^{2k+1}}{(2k+1)!}\\
        \sum_{k=0}^\infty\dfrac{(-\frac{1}{2}\log(\tanh J'))^{2k+1}}{(2k+1)!} &\sum_{k=0}^\infty\dfrac{(-\frac{1}{2}\log(\tanh J'))^{2k}}{(2k)!}
    \end{pmatrix}\\
    &=
    \begin{pmatrix}
        \cosh(-\frac{1}{2}\log(\tanh J')) & \sinh(-\frac{1}{2}\log(\tanh J'))\\
        \sinh(-\frac{1}{2}\log(\tanh J')) & \cosh(-\frac{1}{2}\log(\tanh J'))
    \end{pmatrix}\\
    \end{align*}
    $$
    ここで
    $$
    \begin{align*}
        &\cosh\left(-\frac{1}{2}\log (\tanh J'')\right)=\frac{\frac{1}{(\tanh J'')^\frac{1}{2}}+(\tanh J'')^\frac{1}{2}}{2}
    \end{align*}
    $$
    より
    $$
    \begin{align*}
    &\left(\cosh\left(-\frac{1}{2}\log (\tanh J'')\right)\right)^2\\
    &=
    \frac{1}{4}\left(\frac{1}{\tanh J''}+2+\tanh J''\right)\\
    &=
    \frac{1}{4}\cdot\frac{1}{e^{2J''}-e^{-2J''}}\cdot((e^{J''}+e^{-J''})^2+2(e^{2J''}-e^{-2J''})+(e^{J''}-e^{-J'})^2)\\
    &=
    \frac{e^{2J'}}{e^{2J'}-e^{-2J'}}
    \end{align*}
    $$
    となるので
    $$
    \begin{align*}
    &\left(\cosh\left(-\frac{1}{2}\log (\tanh J')\right)\right)^2\cdot(2\sinh 2J')\\
    &=
    \frac{e^{2J'}}{e^{2J'}-e^{-2J'}}\cdot(e^{2J'}-e^{-2J'})\\
    &=
    e^{2J'}
    \end{align*}
    $$
    よって
    $$
    \begin{align*}
    &\left(\cosh\left(-\frac{1}{2}\log (\tanh J')\right)\right)\cdot(2\sinh 2J')^\frac{1}{2}=e^{J}
    \end{align*}
    $$
    同じく
    $$
    \begin{align*}
    &\left(\sinh\left(-\frac{1}{2}\log (\tanh J')\right)\right)\cdot(2\sinh 2J')^\frac{1}{2}=e^{-J'}
    \end{align*}
    $$
    よって
    $$
    \begin{align*}
    &①=\left(\begin{pmatrix}e^{J'}&e^{-J'}\\ e^{-J'}&e^{J'}\end{pmatrix}\otimes\cdots\otimes\begin{pmatrix}e^{J'}&e^{-J'}\\ e^{-J'}&e^{J'}\end{pmatrix}  \right)_{\Psi(\mu),\Psi(\mu')}\\
    &=\begin{pmatrix}e^{J'}&e^{-J'}\\ e^{-J'}&e^{J'}\end{pmatrix}_{\frac{\mu(N)+1}{2},\frac{\mu'(N)+1}{2}}\cdot\cdots\cdot\begin{pmatrix}e^{J'}&e^{-J'}\\ e^{-J'}&e^{J'}\end{pmatrix}_{\frac{\mu(1)+1}{2},\frac{\mu'(1)+1}{2}}\\
    &（命題6.2）\\
    &=\prod_{j=1}^N\exp(J'\mu(j)\mu'(j))
    \end{align*}
    $$
#
命題8 
$$
\begin{align*}
Z(J,J')=tr ((V_1V_2)^M)
\end{align*}
$$
- (Proof)    
    命題8.1 $X,Y$:有限集合, $\phi:X\rightarrow Y,$ bijection, $f:X\rightarrow\bR$, $g:Y\rightarrow\bR$, $f=g\circ\phi$について
    $$
    \begin{align*}
    \sum_{x\in X}f(x)=\sum_{y\in Y}g(y)
    \end{align*}
    $$
    - (proof)
        $X=\{x_1,...,x_n\}$とおき、$\phi(x_i)=y_i$とすると\phiは全単射より、$Y=\{y_1,...,y_n\}$となり
        $$
        \begin{align*}
        &\sum_{x\in X}f(x)=\sum_{x\in X}g(\phi(x))=g(\phi(x_1))+...+g(\phi(x_n))\\
        &=g(y_1)+...+g(y_n)=\sum_{y\in Y}g(y)
        \end{align*}
        $$
    $S:=\{(s_{i,j})_{i=1,...,M+1,j=1,...N+1}\mid s_{i,j}\in\{\pm1\},s_{i,N+1}=s_{i,1}\ (\forall i),s_{M+1,j}=s_{1,j}\ (\forall j))\},\\
     M:=\{(\mu_1,...,\mu_{N+1})\mid \mu_j\in\Mone\ (\forall j),\ \mu_{N+1}=\mu_{1}\}$,
    $$
    \begin{align*} 
        \phi:S&\rightarrow M,\\
        s_{i,j}&\mapsto (\mu_1,...,\mu_{N+1})\text{ s.t. }\mu_{j}(i)=s_{i,j}\\
        s_{i,j}\text{ s.t. }s_{i,j}=\mu_{j}(i)&\mapsto (\mu_1,...,\mu_{N+1})
    \end{align*}
    $$
    より、全単射ができ、
    $$
    \begin{align*}
    f:&(s_{i,j})_{i=1,...,M+1,j=1,...N+1}\mapsto\left(\prod_{i=1}^M\left(\left(\prod_{j_1=1}^N \exp \left(J \cdot s_{i, j_1} \cdot s_{i, j_1+1}\right)\right) \cdot\left(\prod_{j_2=1}^N \exp \left(J \cdot s_{i, j_2} \cdot s_{i+1, j_2}\right)\right)\right)\right)\\
    g:&(\mu_1,...,\mu_{N+1})\mapsto \left(\prod_{i=1}^M\left(\left(\prod_{j_1=1}^N \exp(J \mu_i\left(j_1\right) \mu_i\left(j_1+1\right))\right) \cdot\left(\prod^N_{j_2=1} \exp(J^{\prime} \mu_i\left(j_2\right)) \mu_{i+1}\left(j_2+1\right)\right)\right)\right)\\
    g\circ\phi:&(s_{i,j})_{i=1,...,M+1,j=1,...N+1}\\
    &\mapsto\left(\prod_{i=1}^M\left(\left(\prod_{j_1=1}^N \exp(J s_{i,j_1} s_{i,j_1+1})\right) \cdot\left(\prod^N_{j_2=1} \exp(J^{\prime} s_{i,j_2}s_{i+1,j_2})\right)\right)\right)
    \end{align*}
    $$
    となるので命題8.1より
    $$
    \begin{align*}
    &Z\left(J, J^{\prime}\right)=\sum_{s_{i,j}\in S}\left(\prod_{i=1}^M\left(\left(\prod_{j_1=1}^N \exp \left(J \cdot s_{i, j_1} \cdot s_{i, j_1+1}\right)\right) \cdot\left(\prod_{j_2=1}^N \exp \left(J \cdot s_{i, j_2} \cdot s_{i+1, j_2}\right)\right)\right)\right)\\
    &=\sum_{\left(\mu_1, \cdots, \mu_{N+1}\right) \in M} \left(\prod_{i=1}^M\left(\left(\prod_{j_1=1}^N \exp(J \mu_i\left(j_1\right) \mu_i\left(j_1+1\right))\right) \cdot\left(\prod^N_{j_2=1} \exp(J^{\prime} \mu_i\left(j_2\right)) \mu_{i+1}\left(j_2+1\right)\right)\right)\right)
    \end{align*}
    $$
    また
    $$
    \begin{align*}
    &(V_1V_2)_{{\Psi(\mu),\Psi(\mu')}}=\sum_{\mu_1\in\Mone}\left(V_1\right)_{\Psi(\mu),\Psi(\mu_1)}\left(V_2\right)_{\Psi(\mu_1),\Psi(\mu')}\\
    &=\sum_{\mu_1\in\Mone}\left(\delta_{\mu(1),\mu_1(1)}\cdot\cdots\cdot\delta_{\mu(N),\mu_1(N)}\cdot\left(\prod^N_{j_1=1}\exp(J\mu(j_1)\mu_1(j_1+1))\right)\cdot\left(\prod^N_{j_2=1}\exp(J\mu_1(j_2)\mu'(j_2))\right)\right)\\
    &=\left(\prod^N_{j_1=1}\exp(J\mu(j_1)\mu(j_1+1))\right)\cdot\left(\prod^N_{j_2=1}\exp(J\mu(j_2)\mu'(j_2))\right)\\
    &=\left(\prod^N_{j_1=1}\exp(J\mu(j_1)\mu(j_1+1))\right)\cdot\left(\prod^N_{j_2=1}\exp(J\mu(j_2)\mu'(j_2))\right)\\
    \end{align*}
    $$
    よって
    $$
    \begin{align*}
    &((V_1V_2)^M)_{\Phi(\mu),\Phi(\mu')}=\sum_{(\mu_2,...\mu_N)\in\Mone}\left(\prod^N_{j_1=1}\exp(J\mu(j_1)\mu(j_1+1))\right)\cdot\left(\prod^N_{j_2=1}\exp(J\mu(j_2)\mu_2(j_2))\right)\\
    &\cdot\cdots\cdot\left(\prod^N_{j_1=1}\exp(J\mu_{M}(j_1)\mu_M(j_1+1))\right)\cdot\left(\prod^N_{j_2=1}\exp(J\mu_M(j_2)\mu'(j_2))\right)\\
    &=\sum_{\begin{align*}(\mu_2,...\mu_N)\in\Mone\\\mu_1=\mu,\ \mu_{N+1}=\mu'\end{align*}}\prod_{i=1}^M\left(\left(\prod^N_{j_1=1}\exp(J\mu_i(j_1)\mu_i(j_1+1))\right)\cdot\left(\prod^N_{j_2=1}\exp(J\mu_{i}(j_2)\mu_{i+1}(j_2))\right)\right)
    \end{align*}
    $$
    ゆえにtraceは、$\mu=\mu'$について和をとるので
    $$
    \begin{align*}
    &tr((V_1V_2)^M)=\\
    &\sum_{\begin{align*}(\mu_1,...\mu_{N+1})&\in\Mone\\\mu_1=\mu_{N+1}\end{align*}}\prod_{i=1}^M\left(\left(\prod^N_{j_1=1}\exp(J\mu_i(j_1)\mu_i(j_1+1))\right)\cdot\left(\prod^N_{j_2=1}\exp(J\mu_{i}(j_2)\mu_{i+1}(j_2))\right)\right)
    \end{align*}
    $$
    ゆえに
    $$
        Z(J,J')=tr((V_1V_2)^M)
    $$

