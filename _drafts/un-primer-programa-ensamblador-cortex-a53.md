---
title: Un primer programa en ensamblador para el ARM Cortex-A53
author: Gastón H. Salazar-Silva
layout: post
categories: dsp, embedded systems
...

El programar en lenguaje ensamblador es una competencia muy importante para
programar sistemas embebidos, sobre todo en aplicaciones de procesamiento de
señales.

Una ventaja de la tarjeta Raspberry Pi es que incluye todo un entorno de
desarrollo en el sistema operativo. Además, permite el interfaz entre el
lenguaje C y el ensamblador de una manera muy natural.

Implementaremos un programa extremadamente sencillo en ensamblador de tarjeta
una configuración *head-less*.


## Material, equipo y software

### Material

* Cable Ethernet cruzado.
* Cable USB micro-B (USB para teléfono)
* Adaptador para celular con USB.
* Tarjeta de memoria micro SD de al menos 16 GB. 
* Adaptador para tarjeta micro SD (para conectar a la PC).

### Equipo

* Computadora PC
* Tarjeta Raspberry Pi 3B+.
En caso de no disponer una tarjeta Raspberry Pi, se puede usar una clon, o usar simuladores (Ver abajo).

### Software

* Raspberry Pi OS Imager.
* Cliente para SSH, por ejemplo PuTTY.
* Bonjour Print Services for Windows

# Instrucciones

Esta actividad construye sobre la actividad desarrollada en [How to Set Up a
Headless Raspberry Pi, Without Ever Attaching a
Monitor](https://www.tomshardware.com/reviews/raspberry-pi-headless-setup-how-to,6028.html).
Al finalizar la actividad desarrollada en el enlace anterior, tendremos
    * El sistema operativo Raspbian Pi OS instalado en la tarjeta micro SD.
    * El software Bonjour installado en la PC.
    * El software PuTTY installado en la PC.
    * La tarjeta Raspberry Pi operando y conectada a la PC vía cable Ethernet cruzado.
    * Conexión vía SSH entre el software PuTTY y la tarjeta Raspberry Pi.
    * Capacidad de iniciar sesión (*log in*) con la tarjeta.

2. Inserte la tarjeta micro SD en la tarjeta de Raspberry Pi y encienda la tarjeta Raspberry Pi.
3. Conecte vía SSH el software PuTTY y la tarjeta Raspberry Pi.
4. Inicie sesión (log in) en la Raspberry Pi.
5. Para iniciar el editor nano, en la línea de comando de la Raspberry inserte el siguiente comando:

~~~
pi@raspberrypi:~ $ nano programa1.s                                                                           
~~~

Deberá aparecer el editor nano en la terminal PuTTY: 

6. Inserte el programa en el editor 

    * La directiva .global permite declarar símbolos globales.
    * El símbolo main se declara como global.
    * Posteriormente, el símbolo main se define como etiqueta al colocarle dos puntos después del símbolo.
    * La instrucción mov permite asignarle un valor a un registro.
    * El símbolo r0 está predefinido como el registro r1.
    * El símbolo #42 representa a la constante con valor decimal de 42.
    * La instrucción bx permite saltar a una dirección que este almacenada en un registro.
    * El símbolo lr representa al registro r15, que se utiliza para almacenar la
      dirección de retorno cuando se llama a una subrutina. 

7. Presione el conjunto de teclas ctrl-O (Write Out) 
8. Presione la tecla Enter.
9. Para salir del editor nano, presione las teclas ctrl-X.
10. Ejecute el compilador de C insertando la siguiente línea de comando

~~~
pi@raspberrypi:~ $ gcc programa1.s                                                                           
~~~

    * El compilador de C tiene la capacidad de ensamblar programas si tienen la extensión .s. El resultado será el programa a.out.

11. Ejecute en la línea de comando la siguiente instrucción. El resultado deberá
    ser como en la pantalla siguiente 

12. Ejecute el programa que se ensambló utilizan la instrucción 

~~~
pi@raspberrypi:~ $ ./a.out
~~~

Es importante colocar el el punto y la diagonal al principio. No deberá verse
respuesta, ya que el programa como tal no tiene capacidad de imprimir el
resultado. Para visualizar el resultado, teclee la siguiente instrucción 

~~~
pi@raspberrypi:~ $ echo $?
~~~

Deberá imprimirse el número 42.

## Discusión

La razón de usar el símbolo global main es que el compilador de C espera una
función main() en C, y por lo tanto marcará un error si no encuentra dicho
símbolo. 

## Recursos

* [How to Set Up a Headless Raspberry Pi, Without Ever Attaching a
  Monitor](https://www.tomshardware.com/reviews/raspberry-pi-headless-setup-how-to,6028.html).
* [Setting up a Raspberry Pi for a robot – Headless by Default
  [Tutorial]](https://hub.packtpub.com/setting-up-a-raspberry-pi-for-a-robot-headless-by-default-tutorial/).
* [How to emulate a Raspbian OS in QEMU on Windows
  10](https://dominoc925.blogspot.com/2019/09/how-to-emulate-raspbian-os-in-qemu-on.html).
* [Raspberry Pi Emulator for Windows 10](https://www.instructables.com/Raspberry-Pi-Emulator-for-Windows-10/).
* [Learn Linux with Raspberry Pi](https://learn.adafruit.com/series/learn-linux-with-raspberry-pi).
* [ARM assembler in Raspberry Pi](https://thinkingeek.com/arm-assembler-raspberry-pi/).

## Evidencia

Se deberá elaborar un reporte con los resultados obtenidos. Se deberá incluir
capturas de pantalla de los resultados. El documento se elaborará con el estilo
MLA. El contenido se organizará conforme a estructura IMRAD:

* Introducción
* Métodos
    * Equipo utilizado.
        * Tarjeta de procesamiento.
        * Computadora
        * Software utilizado
        * Sistema operativo y versión
        * Compilador y versión.
    * Investigación sobre las instrucciones de lenguaje ensamblador mov, add y bx.
    * Procedimiento seguido.
* Resultados
    * Código de las actividades autónomas.
    * Captura de pantalla.
    * Texto describiendo la captura de pantalla.
    * Dificultades encontradas.
* Conclusiones
    * Discusión de los resultados y su impacto.
*Referencias.

## Forma de entrega

El reporte se deberá entregar en formato PDF en el espacio asignado.

Criterios para su evaluación y descripción del tipo de instrumento
Los criterios a evaluar serán

* Reporte:
    * Apego al procedimiento.
    * Apego al estilo MLA
    * Apego a la estructura IMRAD
* Validez de los resultados obtenidos.
* Coevaluación
    * Apego al procedimiento dado.
Calidad de la retroalimentación.
