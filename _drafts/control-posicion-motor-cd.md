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

El par de un motor de CD está dado por la relación

$$T_d (s)= K_{t}^{*} I_a(s)$$

[![Control de
par](/assets/images/cd-motor-position-torque-control-block-diagram.svg)](/assets/images/cd-motor-position-torque-control-block-diagram.svg)

(*Para ver ampliada la imagen, haga
[clic](https://www.fundeu.es/recomendacion/hacer-clic-clicar-y-cliquear-formas-validas-en-espanol/)
en ésta.*)


### Controlador PID de posición


cd-motor-position-block-diagram


[![Control de
par](/assets/images/cd-motor-position-control-block-diagram.svg)](/assets/images/cd-motor-position-control-block-diagram.svg)

(*Para ver ampliada la imagen, haga
[clic](https://www.fundeu.es/recomendacion/hacer-clic-clicar-y-cliquear-formas-validas-en-espanol/)
en ésta.*)


<iframe width="560" height="315" src="https://www.youtube.com/embed/LdVyC8BOBjA" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Referencias
