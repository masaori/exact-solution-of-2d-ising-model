$$ \\
\begin{align*}
はい、e^{-2K}=tanh{K'} と sinh{K}sinh{K'} = 1 が同値であることを以下のように示します。 \\
 \\
まず、双曲線関数の定義から以下の関係式が成り立ちます。 \\
 \\
1. sinh{x} = \frac{e^x - e^{-x}}{2} \\
2. cosh{x} = \frac{e^x + e^{-x}}{2} \\
3. tanh{x} = \frac{sinh{x}}{cosh{x}} = \frac{e^x - e^{-x}}{e^x + e^{-x}} \\
 \\
sinh{K}sinh{K'} = 1 から始めます。 \\
 \\
sinh{K}sinh{K'} = 1 \\
\Leftrightarrow \frac{e^K - e^{-K}}{2} \cdot \frac{e^{K'} - e^{-K'}}{2} = 1 \\
\Leftrightarrow (e^K - e^{-K})(e^{K'} - e^{-K'}) = 4 \\
\Leftrightarrow e^{K+K'} - e^{K-K'} - e^{-K+K'} + e^{-K-K'} = 4 \\
 \\
ここで、K+K'=a, K-K'=b と置きます。すると、 \\
 \\
e^a - e^b - e^{-b} + e^{-a} = 4 \\
\Leftrightarrow e^a + e^{-a} = e^b + e^{-b} + 4 \\
\Leftrightarrow cosh{a} = cosh{b} + 2 \\
\Leftrightarrow cosh{(K+K')} = cosh{(K-K')} + 2 \\
 \\
双曲線関数の加法定理より、 \\
 \\
cosh{(K+K')} = cosh{K}cosh{K'} + sinh{K}sinh{K'} \\
cosh{(K-K')} = cosh{K}cosh{K'} - sinh{K}sinh{K'} \\
 \\
これらを代入すると、 \\
 \\
cosh{K}cosh{K'} + sinh{K}sinh{K'} = cosh{K}cosh{K'} - sinh{K}sinh{K'} + 2 \\
\Leftrightarrow 2sinh{K}sinh{K'} = 2 \\
\Leftrightarrow sinh{K}sinh{K'} = 1 (最初の式) \\
 \\
次に、tanh{K'} = e^{-2K} を示します。 \\
 \\
sinh{K}sinh{K'} = 1 \\
\Leftrightarrow \frac{e^K - e^{-K}}{2} \cdot \frac{e^{K'} - e^{-K'}}{2} = 1 \\
\Leftrightarrow (e^K - e^{-K})(e^{K'} - e^{-K'}) = 4 \\
\Leftrightarrow e^{K+K'} - e^{K-K'} - e^{-K+K'} + e^{-K-K'} = 4 \\
\Leftrightarrow e^{K+K'} + e^{-K-K'} = e^{K-K'} + e^{-K+K'} + 4 \\
\Leftrightarrow cosh{(K+K')} = cosh{(K-K')} + 2 \\
\Leftrightarrow \frac{e^{K+K'} + e^{-K-K'}}{2} = \frac{e^{K-K'} + e^{-K+K'}}{2} + 1 \\
\Leftrightarrow e^{K+K'} + e^{-K-K'} = e^{K-K'} + e^{-K+K'} + 2 \\
\Leftrightarrow e^{2K} + e^{-2K} = e^{2K'}+ e^{-2K'} + 2 \\
\Leftrightarrow cosh{2K} = cosh{2K'} + 1 \\
\Leftrightarrow \frac{e^{2K} + e^{-2K}}{2} = \frac{e^{2K'} + e^{-2K'}}{2} + 1 \\
\Leftrightarrow e^{2K} + e^{-2K} = e^{2K'} + e^{-2K'} + 2 \\
\Leftrightarrow e^{2K} - e^{2K'} = e^{-2K'} - e^{-2K} + 2 \\
\Leftrightarrow e^{2K} - e^{2K'} = (e^{-2K'} + 1) - (e^{-2K} - 1) \\
\Leftrightarrow e^{2K} - e^{2K'} = \frac{e^{2K'} - e^{-2K'}}{e^{2K'} + e^{-2K'}} - \frac{e^{2K} - e^{-2K}}{e^{2K} + e^{-2K}} \\
\Leftrightarrow e^{2K} - e^{2K'} = tanh{K'} - tanh{K} \\
\Leftrightarrow e^{2K} = e^{2K'} + tanh{K'} - tanh{K} \\
\Leftrightarrow e^{-2K} = \frac{1}{e^{2K}} = \frac{1}{e^{2K'} + tanh{K'} - tanh{K}} \\
 \\
ここで、sinh{K}sinh{K'} = 1 より、tanh{K} = \frac{1}{sinh{K'}} であることに注意します。 \\
 \\
\Leftrightarrow e^{-2K} = \frac{1}{e^{2K'} + tanh{K'} - \frac{1}{sinh{K'}}} \\
\Leftrightarrow e^{-2K} = \frac{sinh{K'}}{e^{2K'}sinh{K'} + sinh{K'}tanh{K'} - 1} \\
\Leftrightarrow e^{-2K} = \frac{sinh{K'}}{(e^{2K'} + 1)sinh{K'} - 1} \\
\Leftrightarrow e^{-2K} = \frac{sinh{K'}}{(e^{2K'} + 1)(e^{K'} - e^{-K'}) - 2} \\
\Leftrightarrow e^{-2K} = \frac{e^{K'} - e^{-K'}}{(e^{2K'} + 1)(e^{K'} - e^{-K'}) - 2(e^{K'} - e^{-K'})} \\
\Leftrightarrow e^{-2K} = \frac{e^{K'} - e^{-K'}}{e^{3K'} - e^{K'} - e^{K'} + e^{-K'}} \\
\Leftrightarrow e^{-2K} = \frac{e^{K'} - e^{-K'}}{e^{3K'} - 2e^{K'} + e^{-K'}} \\
\Leftrightarrow e^{-2K} = \frac{e^{K'} - e^{-K'}}{(e^{K'} - e^{-K'})(e^{2K'} + 1)} \\
\Leftrightarrow e^{-2K} = \frac{1}{e^{2K'} + 1} \\
\Leftrightarrow e^{-2K} = \frac{e^{K'} - e^{-K'}}{e^{2K'} - 1} \cdot \frac{e^{K'} + e^{-K'}}{e^{K'} + e^{-K'}} \\
\Leftrightarrow e^{-2K} = \frac{e^{K'} - e^{-K'}}{e^{K'} + e^{-K'}} = tanh{K'} \\
 \\
以上より、e^{-2K}=tanh{K'} と sinh{K}sinh{K'} = 1 が同値であることが示されました。 \\
\end{align*}
$$