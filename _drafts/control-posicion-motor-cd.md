---
title:  Control digital de posición en lazo cerrado
author: Gastón H. Salazar-Silva
layout: post
categories: [Electrical Machines Control]
...

## Modelo del motor en posición

Para describir el comportamiento del motor de CD se utilizará el diagrama de
bloques que aparece a continuación. 

![Modelo del motor de CD para control de
posición](/assets/images/cd-motor-position-block-diagram.svg)

En el modelo se tienen las siguientes variables, descritas por medio de la
transformada de Laplace: el voltaje de armadura, $V_a(S)$, que es la entrada de
control; la fuerza contraelectromotriz, $E_g(s)$; la corriente de armadura,
$I_a(s)$; el par desarrollado por el motor, $T_d(s)$; la velocidad angular del
rotor, $\Omega(s)$; y la posición angular, $\Theta(s)$.

En cuanto a las constantes, a continuación se enumeran: la inductancia de la
armadura del motor, $L_a$; la resistencia de la armadura del motor, $R_a$; la
constante de par del motor, $K_{t}^{\star}$; el momento de inercia del rotor,
$J$; la fricción viscosa causada por los rodamientos del motor, $B$; y la
constante de la fuerza contraelectromotriz, $K^{\star}_{v}$.

Es importante mencionar que las constantes $K_t^\star$ y $K^\star_v$ tienen el mismo
valor numérico; pero diferente unidad de medida.

Como se puede observar, el modelo del motor de cd de tercer orden, con un polo
en cero, por lo que el sistema se considera críticamente estable. Esto implica
que si se alimenta el motor con un señal escalón, la posición crecerá
linealmente.

## Controlador de posición

Dado que representamos al motor de CD como un sistema de tercer orden, un
controlador PID sería insuficiente para controlar todo el sistema ya que un
controlador PID es un controlador para sistemas de segundo orden. Esto nos deja
con un polo sin controlar; pero este polo es estable, por lo tanto no produce
tanto problema; pero si se desea lograr un mejor desempeño, se tiene que
controlar.

Una solución es colocar un controlador de primer orden anidado con un
controlador de segundo orden. En esto, se puede tener dos opciones

* En el lazo interno se tiene un controlador de segundo orden, para controlar la
  velocidad, mientras se tiene en un lazo externo un controlador de primer orden
  para la posición.
* En el lazo interno se tiene un controlador de primer orden, para controlar
  indirectamente el par del motor, mientras se tiene en un lazo externo un
  controlador de segundo orden para la posición.

En la discusión que a continuación se dará, se considerará la última opción.

### Controlador de par

Como se puede ver en el diagrama de bloques, el par de un motor de CD está dado
por la relación

\begin{equation}
T_d (s)= K_{t}^{*} I_a(s)
\end{equation}

Como la relación anterior es lineal, se puede controlar indirectamente el par
por medio del control de la corriente. Esto simplifica el sistema de control, ya
que es más fácil medir la corriente que el par.

Un sistema de control simple del par del motor aparece en la siguiente figura.

[![Control de
par](/assets/images/cd-motor-position-torque-control-block-diagram.svg)](/assets/images/cd-motor-position-torque-control-block-diagram.svg)
(*Para ver ampliada la imagen, haga
[clic](https://www.fundeu.es/recomendacion/hacer-clic-clicar-y-cliquear-formas-validas-en-espanol/)
en ésta.*)

Como la función de transferencia entre la corriente de armadura, $I_a(S)$, y el
voltaje de armadura, $V_a(s)$, es de primer orden entonces es suficiente
utilizar un controlador proporcional-integral (PI).

Por razones de eficiencia, se utiliza un puente H para alimentar al motor. Por
lo tanto se necesita transformar la señal de salida del PI a una señal adecuada
para la conmutación del puente H. Para ello, utilizamos un modulador de ancho de
pulso (PWM, por sus siglas en inglés).
### Controlador PID de posición



[![Control de
par](/assets/images/cd-motor-position-control-block-diagram.svg)](/assets/images/cd-motor-position-control-block-diagram.svg)
(*Para ver ampliada la imagen, haga
[clic](https://www.fundeu.es/recomendacion/hacer-clic-clicar-y-cliquear-formas-validas-en-espanol/)
en ésta.*)


<iframe width="560" height="315" src="https://www.youtube.com/embed/LdVyC8BOBjA" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Referencias
