---
title: Arquitectura de un procesador digital de señales
author: Gastón H. Salazar-Silva
layout: post
...

(*Procesamiento de señales en sistemas embebidos*)

Un procesador digital de señales (DSP, por sus siglas en inglés) es un procesador diseñado especialmente para transformar señales discretas.

Una aplicación típica de un DSP es la implementación del filtro de respuesta finita al impulso (FIR, por sus siglas en inglés). Éste se analizará más adelante en el curso, pero se revisará como repercute dicho filtro en el diseño del DSP.

Un filtro de FIR se define a partir de la ecuación


$$y[n] = \sum_{k=0}^N b_i x[n-i]$$

donde las variables $x[n]$ e $y[n]$ representan las señales de entrada y salida al filtro, respectivamente, en el tiempo $n$. Las constantes $b_0, b_1, \ldots, b_N$ son los coeficientes del filtro.

Un filtro de FIR impone ciertas consideraciones en la arquitectura de un DSP:

* Ejecutar ciclos lo más rápidamente posible,
* Ejecutar de la manera más rápida la operación y ← y + b × x,
* Manejar fracciones de forma eficiente, y
* Acceder a la memoria lo más rápidamente posible para leer las entradas y coeficientes.

El siguiente video muestra la importancia del procesamiento de señales en el mundo moderno.

<iframe width="560" height="315" src="https://www.youtube.com/embed/EErkgr1MWw0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Ejecución eficiente de ciclos

Otra forma en que se puede expresar el filtro de FIR, es utilizar la forma recursiva



\begin{align*} s_0 &= 0,\\ s_1 &= s_0 + b_0 x[n],\\ s_2 &= s_1 + b_1 x[n-1],\\ s_3 &= s_2 + b_2 x[n-2],\\ &\vdots\\ s_{N+1} &= s_N + b_N x[n-N]. \end{align*}

Finalmente, el resultado final \(y[n]\) está dado por la expresión.

$$y[n] = s_{N+1}.$$

La recursión anterior se puede implementar forma iterativa, como se puede apreciar en el siguiente programa de C.

~~~{C}
int main()
{
    const unsigned int N = 3;
    const float b[] = {.25, .25, .25, .25};
    float x[] = {.4, .3, .2, .1};

    double y = 0.0;
    for (int k = N; k >= 0; k--)
    {
        y = y + b[k] * x[k];
    }
}
~~~

Un DSP de alto rendimiento permite realizar las operaciones en el ciclo for en un sólo paso. Para ello, se desarrolla un nivel muy alto de paralelismo en su arquitectura. Por ejemplo, disponen en hardware todo lo requerido para realizar en paralelo todas operaciones requeridas por dicho ciclo for. Esto se conoce como **ciclos con cero sobrecostos**.