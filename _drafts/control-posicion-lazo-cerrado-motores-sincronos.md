---
title: Control digital de posición en lazo cerrado para motores síncronos
...


* En el siguiente documento se revisará el control de posición en lazo cerrado
  para motores síncronos.
* Primeramente se revisará los métodos de control de posición en lazo cerrado
  para motores a pasos.
* Posteriormente se extenderán algunos de estos métodos para operar con motores
  sin escobillas.
* FInalmente, se anexa material extra que se puede utilizar para entender mejor
  el tema.


## Métodos de control de motor a pasos

* Corrección de la posición final (automatización),
* Modo de mantenimiento posición del paso.
* Micropasos en lazo cerrado
* Control sin escobillas bifásico.

<iframe width="560" height="315" src="https://www.youtube.com/embed/lSW7MbSiGGg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


### Preguntas a considerar

* ¿Qué ventajas tiene cada esquema de control mostrados?
* ¿Que desventajas tiene cada esquema de control?
* ¿Cuáles son los diagramas de bloques o de flujo de cada esquema de control?


## Control PID de un motor síncrono

* Existen muchas formas de controlar un motor sin escobillas.
* Existen dos esquemas básicos:
    * Con sensores de posición mecánicos.
    * Con sensores de fuerza contralectromotriz.
        * Este último se le conoce como control sin sensores (mecánicos)
* El siguiente video explica algunas generalidades al respecto.

<iframe width="560" height="315" src="https://www.youtube.com/embed/4ZemeZMgYvM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


#### Preguntas para reflexionar

* ¿Qué tipos de sensores se requieren para determinar la posición?
* ¿Qué es la transformación de Parke?
* ¿Qué es la transformación de Clarke?
* ¿Cómo implementan en el video un modulador de ancho de pulso?


## Control orientado al campo sin sensores

* Cuando se habla un control orientado al campo sin sensores, en realidad no se
  está diciendo que no existen sensores.
    * Lo que se quiere decir que no se tiene un sensor de posición como tal.
    * En su lugar, se mide la fuerza contraelectromotriz generada sobre los
      devanados.
        * Es decir, se usa los propios devanados del motor como sensores.
        * El problema con este método es que el rotor debe estar en movimiento
          para genera la fuerza contralectromotriz.

<iframe width="560" height="315" src="https://www.youtube.com/embed/cdiZUszYLiA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## Preguntas

* ¿Qué se entiende por un control sin sensores?
* ¿Cómo se implementaría un control orientado al campo en un motor a pasos?


## Marcos de referencia y transformaciones

* Al igual que en sistemas mecánicos, también existen marcos de referencia para
  sistemas eléctricos.
* Estos marcos de referencia permiten simplificar el análisis y diseño de
  sistemas de control de máquinas eléctricas de CA.

<iframe width="560" height="315" src="https://www.youtube.com/embed/vdeVVTltr1M" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


### Transformación de Clarke

* Convierte una señal trifásica a una señal bifásica.
* Permite simplificar el análisis de sistemas trifásicos.

### Transformación de Park

* La transformación de Park sirve permite transformar una señal bifásica a una
  señal compleja de corriente directa.
    * Hay que recordar que una señal compleja tiene parte real (d) e imaqinaria
      (q).
* Es similar a la linealización que se realizó en el motor de pasos durante el
  análisis del modelo matemático de éste. 

## Material extra

<iframe width="560" height="315" src="https://www.youtube.com/embed/Nhy6g9wGHow" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/9D79OlyyZAU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
