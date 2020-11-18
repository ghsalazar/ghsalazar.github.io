---
title: Lenguaje ensamblador - instrucciones y directivas
author: Gastón Hugo Salazar Silva
layout: post
lang: es
...

> Una **instrucción** es una operación que se procesa en la ejecución del
> programa.
>
> Una **directiva** es una operación que se procesa en el ensamblado del
> programa, no en su ejecución.

En un programa escrito en lenguaje ensamblador se mezclan en realidad dos
lenguajes diferentes. Uno de esos lenguajes es el que se va a transformar en
lenguaje de máquina. Ese lenguaje está compuesto por las **instrucciones**
definidas por la arquitectura del procesador. Una instrucción tiene una relación
uno a uno con una instrucción en lenguaje de máquina. Las instrucciones tienen
la función de modificar el estado del programa durante su ejecución. A las
instrucciones de lenguaje ensamblador también se les conoce como mnemonicos.

El otro lenguaje se compone de **directivas**. Éstas no se van transformar a
lenguaje de máquina, sino modifican el comportamiento del ensamblador mientras
procesa las instrucciones en lenguaje de máquina.

Los lenguajes de programación también pueden tener directivas. Un caso
específico es C, que tiene dos tipos diferentes de directivas:
  * [Directivas de preprocesador](https://docs.microsoft.com/es-es/cpp/preprocessor/preprocessor-directives?view=msvc-160#:~:text=Las%20directivas%20de%20preprocesador%2C%20como,en%20diferentes%20entornos%20de%20ejecuci%C3%B3n.&text=Las%20directivas%20del%20archivo%20de,preprocesador%20que%20realice%20acciones%20espec%C3%ADficas.),
  * [Pragmas](https://www.tutorialspoint.com/hashpragma-directive-in-c-cplusplus).
En este caso las directivas se procesan antes del compilado o durante la
compilación.



