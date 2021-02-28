input boxes;

prologues := 3;
outputformat := "svg";
outputtemplate := "%j-%c.%o";

beginfig(1);

circleit.sum(btex $+$ etex);
boxit.sensor(btex Sensor etex);
boxit.instr(btex Acondicionador etex);
boxit.adc(btex ADC etex);
boxit.dsp(btex Procesador digital etex);
boxit.dac(btex DAC etex);
boxit.potencia(btex Etapa de potencia etex);
boxit.actuador(btex Actuador etex);
boxit.planta(btex Planta etex);
boxit.minus(btex $-1$ etex);

sum.w - z1 = (7mm,0);
adc.w -sum.e = dsp.w - adc.e = dac.w -dsp.e = (7mm,0);
potencia.w - dac.e = actuador.w - potencia.e = (7mm, 0);
planta.w - actuador.e = (7mm,0);

adc.c - minus.c  = (0,10mm);
potencia.c - instr.c = (0, 10mm);
planta.c -z2 = (0,10mm);
sum.c - z3 = (0,10mm);
actuador.c - sensor.c = (0 , 10mm);



drawboxed(sum,sensor,instr,adc,dsp,dac,potencia,actuador,planta,minus);

label.lft("Referencia", z1);

drawarrow z1--sum.w;
drawarrow sum.e -- adc.w;
drawarrow adc.e -- dsp.w;
drawarrow dsp.e -- dac.w;
drawarrow dac.e -- potencia.w;
drawarrow potencia.e -- actuador.w;
drawarrow actuador.e -- planta.w;
drawarrow planta.s -- z2 -- sensor.e;
drawarrow sensor.w -- instr.e;
drawarrow instr.w -- minus.e;
drawarrow minus.w -- z3 -- sum.s;


endfig;

end