---
title: Transformación bilineal o Transformación de Tustin
author: Gastón Hugo Salazar Silva
layout: post
lang: es
...

A continuación obtendremos funciones de transferencia discretas a partir de
funciones de transferencia continuas por medio de la transformación bilineal y
aplicaremos la transformación bilineal a funciones de transferencia de primer,
segundo y tercer orden.

## Transformación bilineal

Utilizamos la transformación bilineal para obtener funciones de transferencia
discretas. Para ello partimos de la [regla del
trapecio](https://es.wikipedia.org/wiki/Regla_del_trapecio).

Observe la siguiente figura, donde se muestra una curva que representa la
derivada de la función $f$, donde $t$ representa un instante de tiempo, $h$
representa un incremento en el tiempo y $f'$ representa la derivada de $f$ con
respecto al tiempo.

| ![Área de una función sobre un intervalo](/assets/images/tustin-1.svg) |
|:----:|
| Figura: Área de una función sobre un intervalo |

El problema consiste en encontrar el área bajo la curva $f'$ sobre el intervalo
$[t,t+h]$. Para ello, partimos del [segundo teorema fundamental del
cálculo](https://es.wikipedia.org/wiki/Teorema_fundamental_del_c%C3%A1lculo#Segundo_Teorema_Fundamental_del_C%C3%A1lculo),
que se muestra a continuación

$$\int_{t}^{t+h} f'(\tau) \mathrm{d}\tau = f(t+h) - f(t) \tag{1}$$

Una forma de aproximar este resultado es utilizando la regla del trapecio, como
se puede apreciar en la siguiente figura.

| ![Aplicación de la regla del trapecio](/assets/images/tustin-2.svg) |
|:------:|
| Figura: Aplicación de la regla del trapecio |

Como se puede apreciar, el area bajo la curva está aproximada por un trapezoide,
cuya área esta coloreada de azul. La regla del trapecio se puede escribir para
nuestro caso de la siguiente forma

$$\int_{t}^{t+h} f'(\tau) \mathrm{d}\tau \approx \frac{f'(t) + f'(t+h)}{2} h. \tag{2}$$

Sustituimos el lado derecho de la ecuación (2) en el lado izquierdo de la
ecuación (2), y obtenemos la siguiente expresión.

$$\frac{f'(t) + f'(t+h)}{2} h \approx f(t+h) - f(t). \tag{3}$$
 
A la ecuación (3) le aplicaremos la transformada de Laplace, asumiendo
condiciones iniciales 0, 

$$\mathcal{L} \left\{\frac{f'(t) + f'(t+h)}{2} h \right\} \approx \mathcal{L} \left\{f(t+h) - f(t)\right\}, \tag{4}$$

y el resultado que obtenemos es

$$\frac{sF(s) + e^{hs} sF(s)}{2} h \approx e^{hs} F(s) - F(S). \tag{5}$$

$$z = e^{hs}$$

$$\frac{sF(s) + z sF(s)}{2} h \approx z F(s) - F(S)$$

$$\frac{h}{2} s (1+z) F(s) \approx (z-1) F(s)$$

$$\frac{h}{2} s (1+z) \approx (z-1)$$

$$s \approx \frac{2}{h} \frac{z-1}{z+1}$$

## Elección de del periodo de muestreo $h$

El periodo de muestreo, $h$, está dado por la frecuencia de muestreo del sistema
de control discreto
$$h = \frac{1}{f_s}$$
donde $f_s$ es la frecuencia de muestreo del sistema de control discreto.

Para elegir la frecuencia de muestreo, $f_s$, aplicaremos el
[Teorema de muestreo de
Nyquist-Shannon](https://es.wikipedia.org/wiki/Teorema_de_muestreo_de_Nyquist-Shannon),
el cual dice que 
$$f_s > 2f_B$$
donde $f_B$ es la frecuencia del ancho de banda en lazo cerrado del sistema de
control.

Como es dificil conocer de antemano el ancho de banda del sistema de control en
lazo cerrado, asumiremos que el ancho de banda estará acotado por arriba por el
polo o el cero de mayor frecuencia, $f_{max}$.

El siguiente video presenta algunas problemáticas que hay que considerar a la
hora de seleccionar $h$.

<iframe width="560" height="315" src="https://www.youtube.com/embed/AdlCPZ5bY9M" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Ejemplo

Basado en el modelo [DC Motor Speed: System Modeling](https://ctms.engin.umich.edu/CTMS/index.php?example=MotorSpeed&section=SystemModeling)

$$H(s) = \frac{2}{s^2 + 12 s + 20}$$

$$H(s) = \frac{2}{(s+10) (s+2)}$$

$$s+\omega_{max} = s+10$$

$$\omega_{max}= 10$$

$$f_{max} = \frac{\omega_{max}}{2\pi} = \frac{10}{2\pi} = 1.59\;\mathrm{Hz}$$

$$f_s > 2 (1.59\;\mathrm{Hz})$$

$$f_s = 4\;\mathrm{Hz}$$

$$h = 0.25\;\mathrm{s}$$



## Ejemplos

### Primer orden

$$H(s) = \frac{1}{s+1}$$

$$H_d(z) = \left.\frac{1}{s+1}\right|_{z=\frac{2}{h}\frac{z-1}{z+1}}$$

$$H_d(z) = \frac{1}{\frac{2}{h}\frac{z-1}{z+1}+1}$$

$$H_d(z) = \frac{1}{\frac{2}{h}\frac{z-1}{z+1}+1} \; \frac{z+1}{z+1} \;\frac{h}{h}$$

$$H_d(z) = \frac{h (z+1)}{2 (z-1) + h (z+1)}$$

$$H_d(z) = \frac{hz+h}{(2+h)z - (2-h)}$$

$$H_d(z) = \frac{hz+h}{(2+h)z - (2-h)} \; \frac{\frac{1}{2+h}}{\frac{1}{2+h}}$$

$$H_d(z) = \frac{\frac{h}{2+h}z+\frac{h}{2+h}}{z - \frac{2-h}{2+h}}$$

$h = 0.4$

$$H_d(z) = \frac{\frac{1}{3}z+\frac{1}{3}}{z - \frac{1}{3}}$$


```
>> s=tf('s')

s =
 
  s
 
Continuous-time transfer function.

>> H = 1/(s+1)

H =
 
    1
  -----
  s + 1
 
Continuous-time transfer function.

>> c2d(H, 0.4, 'tustin')

ans =
 
  0.1667 z + 0.1667
  -----------------
     z - 0.6667
 
Sample time: 0.4 seconds
Discrete-time transfer function.
```

### Segundo orden

$$H(s) = \frac{s+2}{s^2+2s+1}$$

$$H_d(z) = \left.\frac{s+2}{s^2+2s+1}\right|_{z=\frac{2}{h}\frac{z-1}{z+1}}$$

$$H_d(z) = \frac{\frac{2}{h}\frac{z-1}{z+1}+2}{\left(\frac{2}{h}\frac{z-1}{z+1}\right)^2+2(\frac{2}{h}\frac{z-1}{z+1})+1}$$

$$H_d(z) = \frac{\frac{2}{h}\frac{z-1}{z+1}+2}{\left(\frac{2}{h}\frac{z-1}{z+1}\right)^2+2(\frac{2}{h}\frac{z-1}{z+1})+1} \frac{h^2}{h^2} \frac{(z+1)^2}{(z+1)^2}$$

$$H_d(z) = \frac{2h (z-1)(z+1) + 2}{2(z-1)^2 + 4 h (z-1)(z+1) + h^2 (z+1)^2 }$$

$$H_d(z) = \frac{2h z^2 - 2h + 2}{2z^2 - 4z +2 + 4hz^2-4h + h^2z^2 +2h^2z+h^2}$$

$$H_d(z) = \frac{2h z^2 + (2 - 2h)}{(2+4h+h^2)z^2 - (4+2h^2)z + (2-4h+h^2)}$$

$$H_d(z) = \frac{2h z^2 + (2 - 2h)}{(2+4h+h^2)z^2 - (4+2h^2)z + (2-4h+h^2)}
\frac{\frac{1}{2+4h+h^2}}{\frac{1}{2+4h+h^2}}$$

$h = 0.2$

$$H(s) = \frac{0.3871 z - 0.2581}{z - 0.9355}$$

```
>> s=tf('s')

s =
 
  s
 
Continuous-time transfer function.

>> H = (s+2)/(s+2*s+1)

H =
 
   s + 2
  -------
  3 s + 1
 
Continuous-time transfer function.

>> c2d(H, 0.2, 'tustin')

ans =
 
  0.3871 z - 0.2581
  -----------------
     z - 0.9355
 
Sample time: 0.2 seconds
Discrete-time transfer function.
```

## Ejercicio

Se recomienda como ejercicio el caso de tercer orden:

$$H(s) = \frac{2}{s^3+2s^2+s+1}$$

## Para saber más

* Se basan en el [método de Euler de integración](https://es.wikipedia.org/wiki/M%C3%A9todo_de_Euler)

Sobre diferentes aproximaciones que utiliza Matlab

<iframe width="560" height="315" src="https://www.youtube.com/embed/rL_1oWrOplk" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Sobre otro enfoque para obtener la transformación bilineal:

<iframe width="560" height="315" src="https://www.youtube.com/embed/88tWmyBaKIQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>