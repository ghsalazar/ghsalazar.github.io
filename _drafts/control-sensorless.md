---
title: Sistema de control "*sensorless"
...

Una tipo específico de sistema de control en lazo cerrado que luego se le dice
"sin sensor" o *sensorless*. En realidad, sí existen sensores, pero no mide
directmente la velocidad.

Este tipo de sistema de control se utiliza sobre todo para motores sin
escobillas o, incluso, para motores a pasos. Por medio de los propios devanados
del motor, se mide el paso de los dientes del rotor. Esto produce una fuerza
contralectromotriz sobre los devanados, la cual dependerá del ángulo del diente
con respecto al devanado y la velocidad con la que cruza el diente.

En resumen, en un sistema *sensorless* medimos indirectamente la velocidad por
medio de las variaciones en la fuerza contraelectromotriz que existen en los
devanados del estator.  

Una ventaja de este sistema de control es que no se requiere más sensores, sino
que se aprovecha la información obtenida del propio motor. Una desventaja es que
requiere de más procesamiento de información. Además, para bajas velocidades no
es muy útil el sistema.

