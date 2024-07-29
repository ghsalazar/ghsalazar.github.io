---
title:  Firmata en Arduino UNO R4
author: Gastón Hugo Salazar Silva
date:   2024-07-29
tags:   arduino-uno-r4, firmata
layout: post
lang:   es
...

Recientemente, estaba preparando material para una clase y me enfrenté
al problema de instalar la librería [`Firmata`][1] en una Arduino UNO R4
Minima. Esta librería implementa un protocolo de comunicación que permite
controlar la tarjeta Arduino desde una aplicación en una computadora. Es
decir, la tarjeta Arduino opera como un servido para un cliente en otro
equipo.

Sin embargo, instalar `Firmata` en Arduino UNO R4 no es transparente
para un novato. Se requiere aplicar herramientas que no son
necesariamente conocidas para el usuario.

El problema es que la revisión de Firmata que se puede instalar desde
el gestor de librería es la [2.5.9][2], la cual está fechada el 4 de
diciembre de 2022.  Por otro lado, [la fecha de lanzamiento de Arduino
UNO R4][3] es el 26 de junio de 2023. Es decir, la versión disponible de la
librería es anterior al lanzamiento de la tarjeta. 

Una alternativa es instalar la versión más actual de Firmata vía
[Github][4]; sin embargo, esto presenta algunos problemas. El problema
más importante es que existen conflictos con algunas definiciones del
propio núcleo de Arduino para el Procesador Renesas RA4M1. En cuanto
estos conflictos se resuelvan, sería posible instalar la librería usando
herramientas como [`git`][5]. Sin embargo, estas herramientas requieren
de mayor conocimiento que no necesariamente dispone un usuario novato.

Después de investigar, encontré [una solución en el foro de Arduino][6].
A continuación, presentaré una versión modificada del código desarrollado
en la respuesta del foro.

## Método

El primer paso consiste instalar la librería `Firmata` vía el gestor de
librerías del entorno de desarrollo (*IDE*) de Arduino.  Este instalará
la versión 2.5.9, como ya se había mencionado arriba.

El segundo paso consiste en localizar el directorio o carpeta donde
está localizado el [*sketchbook* del usuario][7]. La localización por
defecto es:

- Windows: `C:\Users\{username}\Documents\Arduino`
- macOS: `/Users/{username}/Documents/Arduino`
- Linux: `/home/{username}/Arduino`

Si no se encuentra el directorio o carpeta en localización por defecto,
puede encontrar su localización en la [ventana de preferencias][8].

Una vez localizado el subdirectorio o carpeta del *sketchbook*, dentro
del subdirectorio `libraries` se encontrará otro subdirectorio, llamado
`Firmata`.  Dentro de este último subdirectorio, se encontrará el
archivo `Boards.h`. Este es el archivo que hay que modificar. Para ello hay
que insertar el siguiente código alrededor de la línea 165.

	#elif defined(ARDUINO_UNOR4_MINIMA) || defined(ARDUINO_UNOR4_WIFI)
	#define TOTAL_ANALOG_PINS	6
	#define TOTAL_PINS		20 // 14 digital + 6 analog
	#define VERSION_BLINK_PIN	13
	#define IS_PIN_DIGITAL(p)	((p) >= 0 && (p) <= 13)
	#define IS_PIN_ANALOG(p) 	((p) >= 14 && (p) <= 19)
	#define IS_PIN_PWM(p)		(((p) == 3) || \
						((p) >= 5 && (p) <= 9) || \
						((p) >= 10 && (p) <= 13))
	#define IS_PIN_SERVO(p)		(((p) == 3) || \
						((p) >= 5 && (p) <= 9) || \
						((p) >= 10 && (p) <= 13))
	#define IS_PIN_I2C(p)		((p) == 18 || (p) == 19)
	#define IS_PIN_SPI(p)		((p) == SS || \
						(p) == MOSI || \
						(p) == MISO || \
						(p) == SCK)
	#define PIN_TO_DIGITAL(p)	(p)
	#define PIN_TO_ANALOG(p)	((p)-14)
	#define PIN_TO_PWM(p)		PIN_TO_DIGITAL(p)
	#define PIN_TO_SERVO(p)		PIN_TO_DIGITAL(p)


[1]: https://docs.arduino.cc/retired/hacking/software/FirmataLibrary/
[2]: https://github.com/firmata/arduino/releases/tag/2.5.9
[3]: https://blog.arduino.cc/2023/06/26/uno-r4-the-new-dimension-of-making/
[4]: https://github.com/firmata/arduino
[5]: https://es.wikipedia.org/wiki/Git
[6]: https://forum.arduino.cc/t/adding-arduino-r4-wifi-to-firmata-board-h-file/1247689/7
[7]: https://support.arduino.cc/hc/en-us/articles/4412950938514-Open-the-Sketchbook-folder
[8]: https://support.arduino.cc/hc/en-us/articles/4412950938514-Open-the-Sketchbook-folder
