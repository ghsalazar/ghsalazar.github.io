---
title: Three-phase Inverters
layout: "post"
draft_tag:
 - Control of Electrical Machines
 - Inverters
---

Three-phase inverters are used in high-power applications, as power
can be more easily transfered by three cables than by two. They can be
used with delta or wye (star) connected loads. For the development of this
material I relied on Rashid (1995).

# Three-phase full bridge inverter

As you can see in the figure below, the three phase full bridge
inverter actually consists of three H bridges operating together. This
type of inverter is used in applications where three-phase loads can
be connected independently. This implies that 6 cables are required to
connect to the three-phase load. If with this inverter you are going
to control a motor, you have to take those 6 cables from the inverter
to the motor, with the expense that this entails.

![Figure: Three-phase full bridge](http://ghsalazar.github.io/electrical-machines-control/images/three-phase-full-bridge-inverter.svg)


An inverter can be connected by means of a transformer to the load,
which allows reducing the number of cables used in power transmission,
and reducing harmonics. In this case, the primaries can be connected
independently, in delta or in star. On the other hand, the secondary
ones can be connected in delta or star. If the secondary is wye (star)
connected, harmonics of multiples of 3 are reduced.

However, a transformer limits the type of application of
the inverter, because it cannot be used in position control of synchronous
motors, since it is not possible to have torque at zero frequency.
A transformer requires a changing magnetic field to operate.

In conclusion, in the case of an AC electric motor, it must be close to
the inverter, to reduce electrical installation costs, or a
transformer is put in between, which limits using the inverter only in
speed control applications. As for the waveforms obtained, they will
be similar to the case of a single-phase inverter.

# Three-phase bridge inverter

One of the disadvantages of the three-phase full-bridge inverter is
the number of components, since a total of 12 switches and 12 diodes
are required. The problem with this number of components is cost and
reduced
[reliability](http://reliawiki.org/index.php/RBDs_and_Analytical_System_Reliability).


As an alternative you have the three-phase bridge inverter. It
consists of only 3 half-bridges, and only requires three cables to
transfer power to the load. However, the waveforms in the load are
affected by the connection type.

In the next figure, we show the three-phase bridge inverter with a
load connected in delta. We will analize first the waveforms on the
bridge and then, in the next section, we will determine how are the
waveforms on the load.

![Figure: Three-phase full bridge in delta connection](http://ghsalazar.github.io/electrical-machines-control/images/three-phase-bridge-inverter-delta.svg)


In the following figure, it is shown the waveforms on the switches. As
you can see, these waveforms consider that the switches operate with a
180° conduction. It is important to consider the nomenclature in the
switch sequence. The sequence shown in the waveforms considers this
nomenclature. Simplify the implementation of inverter control. Compare
this sequence with position of the switches in the previous figure.

<div class="auto_out">
  <script type="text/x-sage">
t = var('t')
v_o(t) = 1/4*sgn(sin(t))+.25

tt = [k * pi for k in range(0,4)]
tt_lbl = ['$0$', '$\\pi/\\omega$', '$2\\pi/\\omega$', '$3\\pi/\\omega$']

vt = [k / 2 for k in range(-2, 3)]
vt_lbl = ['$-V_s$', '$-V_s/2$', '$0$', '$V_s/2$', '$V_s$']

q = [(-1)^k*v_o(t-pi*k/3) for k in [0..5]]
g = [plot(q[k],(t,0,3*pi), ticks=[tt, vt], tick_formatter = [tt_lbl, vt_lbl], title='Q%d'%(k+1)) for k in [0..5]]

graphics_array(g, ncols=1)
 </script>
</div>

## Delta connection

In the next figure, We show the waveforms on the load in delta conection.

<div class="auto_out">
  <script type="text/x-sage">
t = var('t')
v_o(t) = 1/4*sgn(sin(t))+.25

tt = [k * pi for k in range(0,4)]
tt_lbl = ['$0$', '$\\pi/\\omega$', '$2\\pi/\\omega$', '$3\\pi/\\omega$']

vt = [k / 2 for k in range(-2, 3)]
vt_lbl = ['$-V_s$', '$-V_s/2$', '$0$', '$V_s/2$', '$V_s$']

q = [(-1)^k*v_o(t-pi*k/3) for k in [0..5]]

Vab = q[0]+q[3]-q[2]-q[5]
Vbc = q[2]+q[5]-q[1]-q[4]
Vca = q[1]+q[4]-q[0]-q[3]

p1 = plot(Vab,(t,0,3*pi), ticks=[tt, vt], tick_formatter = [tt_lbl, vt_lbl])
p2 = plot(Vbc,(t,0,3*pi), ticks=[tt, vt], tick_formatter = [tt_lbl, vt_lbl])
p3 = plot(Vca,(t,0,3*pi), ticks=[tt, vt], tick_formatter = [tt_lbl, vt_lbl])

graphics_array([p1,p2,p3], ncols=1)
</script>
</div>

## Wye Connection

With the [Wye (star) connection](https://www.allaboutcircuits.com/textbook/alternating-current/chpt-10/three-phase-y-delta-configurations/), the signals...

![Figure: Three-phase full bridge in WYE connection](http://ghsalazar.github.io/electrical-machines-control/images/three-phase-bridge-inverter-wye.svg)


## References

Rashid, M. H. (1995). Electrónica de potencia: circuitos, dispositivos
y aplicaciones (2a. Edición). México: Prentice-Hall Hispanoamérica.

