# Raíz de la media cuadrática, error medio cuadrático y relación señal/ruido

(*Tal vez cambiar el enfoque a resolución de problema. El problema es que
los ejemplos usan $arm_snr_f32$ y ya no existe. Nuevo título: "Inexistencia
de la función $arm\_snr\_f32$"i o implementar el ejemplo de la seudo
inversa y explicarlo paso a paso, incluyendo el proble de que no existe snr*)

## Raíz de la media cuadrática

$$ \mathrm{rms}(x) = \sqrt{\frac{1}{n} \sum_{i=1}^{n} x_i^2} $$

Con la librería CMSIS-DSP en un procesador ARM Cortex-M4, la función
$arm\_rms\_f32$ se utiliza para la raíz de la media cuadrática.

## Error medio cuadrático

$$ \mathrm{mse}(\hat{x}, x) =
	\frac{1}{n} \sum_{i=1}^{n} \left(x_i-\hat{x}_i\right)^2 $$

$arm\_mse\_f32$

## Relación señal/ruido

$$ \mathrm{snr}(\hat{x},x) =
	20\log\frac{\mathrm{rms}(x)}{\mathrm{rms}(\hat{x}-x)} $$

En los ejemplos de la librería CMSIS-DSP se utiliza una función
$arm\_snr\_f32$. Sin embargo, esta función no existe en la librería actual.
Una forma de resolver el problema es implementar 
una rutina en C que realice la operación.

~~~
void snr_f32(float32_t const *array1,
	float32_t const *array2, 
	size_t length,
	float32_t *snr) {

	float32_t noise[length];
	arm_sub_f32(array1, array2, noise, length);
	float32_t rms1;
	arm_rms_f32(array2, length, &rms1);
	float32_t rms2;
	arm_rms_f32(noise, length, &rms2);
	float32_t ratio = rms1/rms2;
	float32_t log;
	arm_vlog_f32(&ratio, &log, 1);
	*snr = 20*log;
}
~~~

Otra solución es cambiar a otra función que tenga una funcionalida similar,
por ejemplo $\mathrm{mse}$.
