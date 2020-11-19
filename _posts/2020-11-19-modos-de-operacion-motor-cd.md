---
title:  Modos de operación de un motor de corriente directa
author: Gastón Salazar Silva
layout: post
...

----
> **En resumen**
>
> Para que un motor de CD **produzca par** (avance) se debe tener que $V_a > E_g$.
>
> Para que un motor de CD **consuma par** (frene) se debe tener que $V_a < E_g$.

En el control de velocidad en lazo abierto de un motor de velocidad se pueden
considerar cuatro modos de operación. Para entender estos modos de operación es
conveniente empezar por revisar el circuito de la armadura de un motor de
corriente directa (CD).

![Circuito de la armadura de un motor de CD](/assets/images/circuito-armadura.png)

Como se puede ver en la imagen anterior, existen dos fuentes de voltaje en la
armadura. La primera es la fuente del voltaje de armadura, $V_a$. La segunda
fuente de voltaje se debe a la fuerza contraelectromotriz del propio motor,
$E_g$. Es importante notar que solo podemos manipular directamente $V_a$.

Dependiendo como manipulemos $V_a$ con respecto a $E_g$, es posible operar el
motor para que produzca par o consuma par.

![Modo motor](/assets/images/circuito-armadura-modo-motor.png)

En el **modo motor**, tenemos que que el votaje de armadura, $V_a$, debe ser
mayor a la fuerza contraelectromotriz, $E_g$. Usando el circuito de la imagen de
arriba, la corriente en la malla va en el sentido horario. Este es el modo
normal de operación del motor. En este modo el motor produce par.

![Modo de frenado regenerativo](/assets/images/circuito-armadura-frenado-regenerativo.png)

Después, tenemos el **modo de frenado regenerativo**, donde el voltaje de
armadura del motor es menor que la fuerza contraelectromotriz de éste. En este
momento, la dirección de la corriente de armadura es en el sentido contrario al
modo motor. En este caso, el motor consume par y produce corriente. Esto produce
el frenado del motor. Es importante notar que para que funcione este modo, la
fuente de alimentación debe ser capaz de absorber la corriente generada por el
motor.

![Modo de frenado dinámico](/assets/images/circuito-armadura-frenado-dinamico.png)

Luego tenemos el **modo frenado dinámico**. En este caso se desonecta la
alimmentación de la armadura y en su lugar se conecta un resistor. La caida de
tensión en la resistencia de frenado es menor que la fuerza contraelectromotriz.
De nuevo, el sentido de la corriente es en el sentido inverso del modo motor.

![Modo de frenado por inversión de rotación](/assets/images/circuito-armadura-frenado-inversion.png)

Finalmente, tenemos el **modo de frenado por inversión de la rotación** En este
caso, la polaridad de voltaje de armadura se invierte, con lo que tenemos que el
voltaje de armadura es menor que la fuerza contraelectromotriz. Nuevamente, se
invierte el sentido de la corriente y el motor frena.
