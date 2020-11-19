---
title: Controladores por conmutación para motores de corriente directa
author: Gastón Salazar Silva
layout: post
...

----
> **En resumen**
>
> Con el **medio puente H**, podemos controlar en lazo abierto la velocidad de un
> motor de CD, por medio de los modos motor y de frenado regenerativo.
>
> Con el **puente H** podemos controlar en lazo abierto la velocidad de un motor
> de CD, por medio de los modos motor, de frenado regenerativo, de frenado
> dinámico y de frenado inversión de rotación.

Los controladores por conmutación para motores de corriente directa son unos de
los controladores más utilizados para el control de velocidad de estos en lazo
abierto y lazo cerrado. Además, también son componentes básicos para el control
de posición de motores de CD en lazo cerrado. También los podemos utilizar en
otros tipos de cargas.

Se recomienda primero leer la publicación [Modos de operación de un motor de
corriente directa]({% post_url 2020-11-19-modos-de-operacion-motor-cd %}) para
poder comprender mejor lo que sigue.

## Controlador para modo motor

![Control para modo motor](/assets/images/circuito-modo-motor.png)

En la imagen anterior se muestra el circuito de conmutación que se utiliza para
la operación de modo motor. El circuito opera de la siguiente forma:

1. El transistor $Q_1$ está inicialmente en modo de corte y no circula corriente
   por la malla de la armadura del motor.
2. Al pasar el transistor $Q_1$ al modo de saturación, casi toda la tensión de la
   fuente $Vs$ cae sobre el motor. Entre otras cosas, gracias a la corriente
   $i_a$, el inductor $L_a$ se carga magnéticamente.
3. Al pasar nuevamente el transistor $Q_1$ al modo de corte, la inductor $L_a$
   se descarga produciendo una corriente en el mismo sentido de la corriente con
   la que se cargó. Se inducirá una tensión en el inductor en el sentido opuesto
   a $E_g$, y por un instante será superior a $E_g$.
4. Esto causará que el diodo $D_1$ se polariza directamente y conduce. Esto
   produce dos efectos: primero descarga el inductor $L_a$ y, en segundo lugar,
   se mantiene la corriente sobre el motor, manteniendo el par que produce el
   motor.
5. El ciclo se repite.
   
Este tipo de circuito opera de forma similar a un [convertidor
reductor](https://es.wikipedia.org/wiki/Convertidor_reductor). En el siguiente
video, se explican cómo funcionan estos convertidores. Para compararlo con
nuestro circuito, sustituimos el capacitor y la resistencia de carga por el motor
de CD.

<iframe width="560" height="315" src="https://www.youtube.com/embed/rfChSvb8FX0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Controlador para modo de frenado regenerativo

![Control para modo frenado](/assets/images/circuito-modo-frenado.png)

En la imagen anterior se muestra el circuito de conmutación que se utiliza para
la operación del motor en modo de frenado regenerativo. Es importante notar que
la fuente de poder debe ser capaz de absorber la potencia recuperada del motor.
El circuito opera de la siguiente forma:

1. El transistor $Q_2$ está inicialmente en modo de corte y el diodo $D_2$ está
   polarizado inversamente, por lo que no circula corriente por la malla de la
   armadura del motor. Además, el motor debe tener una velocidad inicial, por lo
   que tenemos una fuerza contraelectromotriz mayor a cero.
2. Al pasar el transistor $Q_2$ al modo de saturación, empieza a circular una
   corriente en la malla de armadura, gracias a la fuerza
   contraelectromotriz.Entre otras cosas, gracias a la corriente $i_a$, el
   inductor $L_a$ se carga magnéticamente. Además, el motor opera como
   generador, consumiendo par.
3. Al pasar nuevamente el transistor $Q_2$ al modo de corte, la inductor $L_a$
   se descarga produciendo una corriente en el mismo sentido de la corriente con
   la que se cargó. Se inducirá una tensión en el inductor en el mismo sentido
   que $E_g$.
4. Esto causará que el diodo $D_2$ se polariza directamente y conduce, ya que
   la suma de las tensiones en el inductor y $E_g$ es mayor al voltaje de la
   fuente. Esto produce tres efectos: primero descarga el inductor $L_a$, en
   segundo lugar se transfiere esa corriente a la fuente de poder, y en tercer
   lugar se va frenando el motor.
5. El ciclo se repite.

Este tipo de circuito opera de forma similar a un [convertidor
elevador](https://es.wikipedia.org/wiki/Convertidor_elevador). En el siguiente
video, se explican cómo funcionan estos convertidores. Para compararlo con
nuestro circuito, sustituimos la fuente de alimentación por el motor.

<iframe width="560" height="315" src="https://www.youtube.com/embed/9QM55r5fnUk" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Controlador combinado o medio puente H

En la siguiente imagen se muestra el circuito de un controlador de medio puente
H.

![Medio puente](/assets/images/circuito-medio-puente.png)

Con este circuito, podemos controlar en lazo abierto la velocidad de un motor de
CD. Esto es gracias a que puede controlar al motor en modo motor y en modo de
frenado regenerativo.

En realidad, el medio puente H combina en uno solo los circuitos del
[controlador para modo motor](#controlador-para-modo-motor) y el [controlador
para modo de frenado
regenerativo](#controlador-para-modo-de-frenado-regenerativo). Por lo mismo,
hemos mantenido la nomenclatura de los circuitos anteriores.

Para operar en modo motor, se utilizan el transistor $Q_1$ y el diodo $D_1$ y se
sigue el mismo procedimiento planteado del [controlador para modo
motor](#controlador-para-modo-motor).

Para operar en modo de frenado regenerativo, se utilizan el transistor $Q_2$ y el diodo $D_2$ y se
sigue el mismo procedimiento planteado del [controlador para modo de frenado
regenerativo](#controlador-para-modo-de-frenado-regenerativo).

## Puente H

En la siguiente imagen, se puede ver el circuito de un controlador de puente H.

![Puente H](/assets/images/circuito-puente-h.png)

Con este circuito, podemos controlar en lazo abierto la velocidad de un motor de
CD en dos sentidos diferentes, tanto en modo motor y en modo de frenado
regenerativo. El circuito es en realidad dos medios puentes H conectados al
motor de CD.

Lamentablemente, la mayoría de las referencias en el Internet no utilizan de la
mejor manera este circuito, ya que consideran motores pequeños. Por eso fue
importante revisar previamente los controladores para los modos
[motor](#controlador-para-modo-motor), [de frenado
regenerativo](#controlador-para-modo-de-frenado-regenerativo) y el [controlador
medio puente H](#controlador-combinado-o-medio-puente-H).

Para el medio puente H de la izquierda se preservó la nomenclatura utilizada en
[controlador combinado o medio puente
H](#controlador-combinado-o-medio-puente-H). Por conveniencia, supondremos que
este medio puente H se considerará para el sentido de giro directo.

Para operar en modo motor en sentido directo, se utilizan el transistor $Q_1$ y
el diodo $D_1$ y se sigue el mismo procedimiento planteado del [controlador para
modo motor](#controlador-para-modo-motor). La única diferencia es que también se
utiliza el transistor $Q_4$; este transistor se mantendrá siempre en saturación,
es decir no estará conmutando. Esto permite que la corriente en el motor se
mantenga. El transistor $Q_3$ estará siempre en corte.

El siguiente video muestra este tipo de operación, aunque se dice explícitamente
que $Q_4$ se mantiene encendido mientras $Q_1$ conmuta, lo hace de una manera
muy rápida.

<iframe width="560" height="315" src="https://www.youtube.com/embed/wRpaLi_G_wc" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Para operar en modo de frenado regenerativo en sentido directo, se utilizan el
transistor $Q_2$ y el diodo $D_2$ y se sigue el mismo procedimiento planteado
del [controlador para modo de frenado
regenerativo](#controlador-para-modo-de-frenado-regenerativo). Los transistores
$Q_3$ y $Q_4$ siempre estarán en corte.

Para operar en modo motor en sentido inverso, se utilizan el transistor $Q_3$ y
el diodo $D_3$ y otra vez se utiliza lo planteado en el [controlador para modo
motor](#controlador-para-modo-motor), haciendo los ajustes adecuados a la
nomenclatura. Además se mantendrá el transistor $Q_2$ siempre en saturación y el
transistor $Q_1$ estará siempre en corte.

Finalmente, para operar en modo de frenado regenerativo en sentido inverso, se
utilizan el transistor $Q_4$ y el diodo $D_4$ y se vuelve a utilizar el
procedimiento del [controlador para modo de frenado
regenerativo](#controlador-para-modo-de-frenado-regenerativo). Otra vez hay que
considerar los ajustes necesarios en la nomenclatura.

El puente H también puede operar el motor en los modos de freno dinámico y por
inversión de giro. En el siguiente video se muestra eso precisamente.

<iframe width="560" height="315" src="https://www.youtube.com/embed/fVgnUWIWzZ8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
