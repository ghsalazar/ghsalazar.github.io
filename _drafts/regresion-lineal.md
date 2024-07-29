# Regresión lineal

## Problema

Supongamos que tenemos una función $f$ desconocida que depende de los
parámetros $x_1,x_2,\ldots,x_n$

$$ y = f(x_1, x_2,\ldots, x_n) \tag{1}$$

y deseamos encontrar una función que sea lo suficientemente buena para
aproximar (1). Una primara posibilidad sería aproximar (1) a una función de
la forma

$$ \hat{y} = c_0 + c_1 x_1 + c_2 x_2 + \cdots + c_n x_n $$

donde $\hat{y}$ es la aproximación de $y$ para los valores de
$x_1,x_2,\ldots,x_n$. El problema consiste en encontrar las constantes
$c_0,c_1,\ldots,c_n$.

## Mínimos cuadrados


$$ \varepsilon = y - \hat{y} $$

$$ y = c_0 + c_1 x_1 + c_2 x_2 + \cdots + c_n x_n + \varepsilon $$

\begin{align}
y_1 &= c_0 + c_1 x_{11} + c_2 x_{21} + \cdots + c_n x_{n1} + \varepsilon_1\\
y_2 &= c_0 + c_1 x_{12} + c_2 x_{22} + \cdots + c_n x_{n2} + \varepsilon_2\\
    &\vdots\\
y_m &= c_0 + c_1 x_{1m} + c_2 x_{2m} + \cdots + c_n x_{nm} + \varepsilon_m
\end{align}

$$
\mathbf{y}
=
\begin{bmatrix}
	y_1& y_2& \cdots& y_m
\end{bmatrix}^T
$$

$$\mathbf{c} =
\begin{bmatrix}
	c_0& c_1& c_2& \cdots& c_n
\end{bmatrix}^T
$$

$$
\mathbf{X} =
\begin{bmatrix}
	1& x_{11}& x_{21}& \cdots& x_{n1}\\
	1& x_{12}& x_{22}& \cdots& x_{n2}\\
	\vdots & \vdots & \vdots & \ddots & \vdots \\
	1& x_{1m}& x_{2m}& \cdots& x_{nm}
\end{bmatrix}
$$

$$
\mathbf{y} = \mathbf{Xc} + \mathbf{e}
$$

$$ \mathrm{mse}(\hat{y}, y) = \frac{1}{n} \sum_{i=1}^{n} (y - \hat{y})^2 $$

$$ \mathrm{mse}(\hat{\mathbf{y}},\mathbf{y};\mathbf{c}) =
	(\mathbf{y} - \mathbf{Xc})^T (\mathbf{y} - \mathbf{Xc})$$

$$
\mathrm{mse}(\hat{\mathbf{y}},\mathbf{y};\mathbf{c}) = \frac{1}{n}\left(
	\mathbf{y}^T\mathbf{y}
	- \mathbf{y}^T \mathbf{Xc}
	- \mathbf{c}^T\mathbf{X}^T\mathbf{y}
	+ \mathbf{c}^T\mathbf{X}^T\mathbf{Xc}
\right)
$$

$$
\mathrm{mse}(\hat{\mathbf{y}},\mathbf{y};\mathbf{c}) = \frac{1}{n}\left(
	\mathbf{y}^T\mathbf{y}
	- 2 \mathbf{y}^T\mathbf{Xc}
	+ \mathbf{c}^T\mathbf{X}^T\mathbf{Xc}
\right)
$$

$$
\arg\min_\mathbf{c}
\mathrm{mse}(\hat{\mathbf{y}},\mathbf{y};\mathbf{c})
$$

$$
\frac{\partial}{\partial \mathbf{c}}
\mathrm{mse}(\hat{\mathbf{y}},\mathbf{y};\mathbf{c}) = \frac{1}{n}\left(
	- 2 \mathbf{y}^T\mathbf{X}
	+ \mathbf{c}^T\mathbf{X}^T\mathbf{X}
	+ \mathbf{c}^T\mathbf{X}^T\mathbf{X}
\right)
$$

$$
\frac{\partial}{\partial \mathbf{c}}
\mathrm{mse}(\hat{\mathbf{y}},\mathbf{y};\mathbf{c}) = \frac{2}{n}\left(
	- \mathbf{y}^T\mathbf{X}
	+ \mathbf{c}^T\mathbf{X}^T\mathbf{X}
\right)
$$

$$
\frac{2}{n}\left(
	- \mathbf{y}^T\mathbf{X}
	+ \mathbf{c}^T\mathbf{X}^T\mathbf{X}
\right) = \mathbf{0}
$$

$$
- \mathbf{X}^T\mathbf{y}
+ \mathbf{X}^T\mathbf{X}\mathbf{c}
= \mathbf{0}
$$

$$
\mathbf{X}^T\mathbf{X}\mathbf{c}
=
\mathbf{X}^T\mathbf{y}
$$

$$
\mathbf{c}
=
(\mathbf{X}^T\mathbf{X})^{-1} \mathbf{X}^T\mathbf{y}
$$
