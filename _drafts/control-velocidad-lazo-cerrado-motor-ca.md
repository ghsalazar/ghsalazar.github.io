---
title: Control de velocidad en lazo cerrado para un motor de CA
author: Gastón Salazar
date:   2021-06-09
tags:   motor-ca, control-velocidad
layout: post
lang:   es
...

## Sistema de control

| <img src="http:/assets/figures/control-velocidad-lazo-cerrado-motor-ca-1.svg" width="100%"> |
|:---:|
| **Figura**. Sistema de control de velocidad en lazo cerrado para un motor de CA. La variable $\omega$ es la velocidad en el rotor y $\omega^r$ es la referencia que se debe seguir. |

En la **figura** podemos un sistema de control de velocidad en lazo cerrado para un motor de CA, donde la variable $\omega$ es la velocidad en el rotor, $\omega^r$ es la referencia que se debe seguir, el error $e$ se define por medio de la ecuación

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

Finalmente, esta cambio en la velocidad angular no se puede aplicar directamente
al inversor, sino que debemos sumarle la velocidad angular del motor. Esto nos
dará el valor de frecuencia requerida por  

<iframe width="560" height="315" src="https://www.youtube.com/embed/DJWWWUmJ4pQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

