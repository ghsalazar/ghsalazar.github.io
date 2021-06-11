---
title:  Control de velocidad en lazo cerrado para un motor de CA
author: Gastón Hugo Salazar Silva
date:   2021-06-11
tags:   motor-ca, control-velocidad
layout: post
lang:   es
...

Para la mayoría de las aplicaciones, es suficiente el control en lazo abierto de
un motor de corriente alterna. Esto se debe a que el motor de corriente alterna
tienen una muy buena regulación de velocidad por que tienen incorporados una
retroalimentación con respecto a la velocidad.

Sin embargo, en ocasiones requierimos de un mejor control de la velocidad; por
ejemplo, en aplicaciones donde la tensión de una cinta de material se debe
regular. Para esto, requerimos un control en lazo cerrado.

En el siguiente video, podemos ver una aplicación del control de velocidad en
lazo cerrado para motores de corriente alterna.

<iframe width="560" height="315" src="https://www.youtube.com/embed/Cb3n70drPZo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Sistema de control

| <img src="http:/assets/figures/control-velocidad-lazo-cerrado-motor-ca-1.svg" width="100%"> |
|:---:|
| **Figura 1**. Sistema de control de velocidad en lazo cerrado para un motor de CA. La variable $\omega$ es la velocidad en el rotor y $\omega^r$ es la referencia que se debe seguir. |

En la figura 1, podemos un sistema de control de velocidad en lazo cerrado para un motor de CA, donde la variable $\omega$ es la velocidad en el rotor, $\omega^r$ es la referencia que se debe seguir, el error $e$ se define por medio de la ecuación

| (1) | $$e = \omega - \omega^r$$. |

El error es usado para obtener la respuesta de control por medio del
controlador. El controlador puede ser un proporcional--integral

| (2) | $$u(t) = K_p e(t) + K_i \int_0^t e(\tau)\mathrm{d}\tau$$. |

donde las constantes $K_p$ y $K_i$ son las ganancias proporcional e integral. 

Sin embargo, esta respuesta no puede ser usada directamente en la siguiente
etapa del controlador a causa del
[deslizamiento](https://es.wikipedia.org/wiki/Deslizamiento_(m%C3%A1quinas_el%C3%A9ctricas))
del motor de CA. Si la respuesta del controlador es superior al deslizamiento
admisible por el motor, este puede causar fluctuaciones en la corriente que
podrían causar un malfuncionamiento. Para evitar esto, aplicamos un limitador de
velocidad, a la salida de control. El limitador se puede implementar como una saturación

| (3) | $$\Delta\omega =\left\{\begin{matrix} max, &\Delta\omega > max \\ u,   &min \leq \Delta\omega \leq max \\ min, &\Delta\omega < min. \end{matrix}\right.$$ |

Finalmente, este cambio en la velocidad angular no se puede aplicar directamente
al inversor, sino que debemos sumarle la velocidad angular del motor. Esto nos
dará el valor de velocidad angular requerida para que el inversor lo aplique al
motor.

Dependiendo el tipo de motor, normalmente tendremos un inversor bifásico o un [inversor
trifásico](https://ghsalazar.github.io/electrical%20machines%20control/inverters/2020/03/24/three-phase-inverters.html). 


## Conclusiones

Un sistema de control de velocidad en lazo cerrado para motores de CA se utiliza
en aplicaciones que requieren un margen de error muy pequeño; por ejemplo, en
aplicaciones donde la tensión de una cinta de material se debe regular.

Sin embargo, es normalmente suficiente el uso el control en lazo abierto de
un motor de corriente alterna. Esto se debe a que el motor de corriente alterna
tienen una muy buena regulación de velocidad por que tienen incorporados una
retroalimentación con respecto a la velocidad.

## Para saber más

En el siguiente video, podemos ver otra perspectiva sobre el control en lazo
cerrado de motores de CA.

<iframe width="560" height="315" src="https://www.youtube.com/embed/DJWWWUmJ4pQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
