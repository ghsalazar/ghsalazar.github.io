input boxes;

prologues := 3;
outputformat := "svg";
outputtemplate := "%j-%c.%o";

beginfig(1);

%% Limiter picture

picture picLimiter;

picLimiter := nullpicture;

addto picLimiter doublepath (0,0)--(2mm,0)--(4mm,4mm)--(6mm,4mm) withpen pencircle scaled 1bp;

%% Feedforward

pair reference;
circleit.suma1(btex $+$ etex);
boxit.control("Controlador");
boxit.limitador(picLimiter);
circleit.suma2(btex $+$ etex);
boxit.driver("VFD");
boxit.motor("Motor");
pair nodeff[];
pair output;

suma1.w - reference = (7mm,0);
control.w - suma1.e = (7mm,0);
limitador.w - control.e = (7mm,0);
suma2.w - limitador.e = (7mm,0);
driver.w - suma2.e = (7mm,0);
motor.w - driver.e = (7mm,0);
nodeff1 - motor.e = (7mm,0);
output - nodeff1 = (7mm,0);

drawboxed(suma1,control,limitador,suma2,driver,motor);
label.lft(btex $\omega^r$ etex, reference);
label.rt(btex $\omega$ etex, output);
label.bot("Limitador", limitador.s);

drawarrow reference--suma1.w;
drawarrow suma1.e--control.w;
drawarrow control.e--limitador.w;
drawarrow limitador.e--suma2.w;
drawarrow suma2.e--driver.w;
drawarrow driver.e--motor.w;
drawarrow motor.e--nodeff1--output;

%% Feedback

boxit.sensor("Sensor");
boxit.negativo(btex -1 etex);
pair nodefb[];

nodeff1 - nodefb1 = (0,10mm);
driver.c - sensor.c = (0,10mm);
suma2.c - nodefb2 = (0,10mm);
control.c - negativo.c = (0,10mm);
suma1.c - nodefb3 = (0,10mm);

drawboxed(sensor,negativo);

drawarrow nodeff1--nodefb1--sensor.e;
drawarrow sensor.w--nodefb2--suma2.s;
drawarrow nodefb2--negativo.e;
drawarrow negativo.w--nodefb3--suma1.s;

endfig;

end

