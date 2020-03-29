---
title: Three-phase Inverters
layout: "post"
categories: [Electrical Machines Control, Inverters]
---

Three-phase inverters are used in high-power applications, as power
can be more easily transferred by three cables than by two. They can
be used with delta or wye (star) connected loads. For this article we
drew upon [Rashid (1995)](#bib-rashid-1999).


# Three-phase full bridge inverter

As we can see in the figure below, the three-phase full bridge
inverter consists of three H bridges operating together. This type of
inverter is used in applications where three-phase loads can be
connected independently. This implies that 6 cables are required to
connect to the three-phase load. To connect a three-phase motor to
this inverter, we must take those 6 cables from the inverter to the
motor. This involves more expenses than simply taking 3 cables.

![Figure: Three-phase full bridge](http://ghsalazar.github.io/electrical-machines-control/images/three-phase-full-bridge-inverter.svg)

An inverter can be connected by means of a transformer to the load,
which allows reducing the number of cables used in power transmission
and reducing harmonics. In this case, the primaries can be connected
independently, in delta or in star. On the other hand, the secondary
ones can be connected in delta or star. If the secondary is wye (star)
connected, multiples of 3 harmonics are reduced.

However, a transformer limits the type of application of the inverter,
because it cannot be used in position control of synchronous motors,
since it is not possible to have torque at zero frequency. A
transformer needs a changing magnetic field to work.

In conclusion, in the case of an AC electric motor, it must be close
to the inverter, to reduce electrical installation costs, or a
transformer is put in between, which limits using the inverter only in
speed control applications. As for the waveforms obtained, they will
be like a single-phase inverter.

# Three-phase bridge inverter

One of the disadvantages of the three-phase full-bridge inverter is
the number of components, since a total of 12 switches and 12 diodes
are required. The problem with this number of components is cost and
reduced
[reliability](http://reliawiki.org/index.php/RBDs_and_Analytical_System_Reliability).

As an alternative we have the three-phase bridge inverter. It
consists of only 3 half-bridges, and only requires three cables to
transfer power to the load. However, load waveforms are influenced by
the connection type.

In the next figure, we show the three-phase bridge inverter with a
load connected in delta. In this section, we will analyze the bridge
waveforms. In the next section we will see the effect on the load.


![Figure: Three-phase bridge inverter in delta connection](http://ghsalazar.github.io/electrical-machines-control/images/three-phase-bridge-inverter-delta.svg)

In the following figure, it is shown the waveforms on the switches. As
we can see, these waveforms consider that the switches operate with a
180° conduction. It is important to consider the nomenclature in the
switch sequence. The sequence shown in the waveforms considers this
nomenclature. It simplifies the implementation of inverter
control. Compare this sequence with switching position in the
preceding figure.

![Figure: Waveforms of the outputs of three-phase bridge inverter](http://ghsalazar.github.io/electrical-machines-control/images/waveforms-three-phase-bridge-inverter-180-plot.svg)

## Delta connection

A delta-three-phase resistive load will be assumed to simplify the
analysis. The following figure shows the equivalent circuit of the
three-phase bridge inverter, during the 0 to
$\frac{1}{3\omega}\pi$ interval.


![Figure: Circuit analysis of the loads in delta connection with a three-phase bridge inverter](http://ghsalazar.github.io/electrical-machines-control/images/delta-analysis.svg)

As we can see, for that interval, we have three voltage sources
connected in star. About $Rab$ we have the algebraic sum of voltages
of $Va+Vb$, which gives $V_s$. The same goes for $Rbc$, where we have
the sum $Vb+Vc$, but in this case the voltage is measured in the
reverse direction, which gives us $-V_s$.  Finally, on $Rca$ there’s
no voltage drop because it is connected to two equal voltages, so the
potential difference is zero. The full analysis is shown in the
following figure.


![Figure: Waveforms of the loads in delta connection with a three-phase full bridge](http://ghsalazar.github.io/electrical-machines-control/images/waveforms-three-phase-bridge-inverter-delta.svg)


## Wye Connection

As we can see in the next figure, we have a three-phase bridge
inverter, with the [wye (star)
connected](https://www.allaboutcircuits.com/textbook/alternating-current/chpt-10/three-phase-y-delta-configurations/)
load.

![Figure: Three-phase bridge inverter in WYE connection](http://ghsalazar.github.io/electrical-machines-control/images/three-phase-bridge-inverter-wye.svg)

For the analysis, the 0 to $\frac{1}{3\omega}\pi$ interval will be
considered again and a three-phase balanced resistive load, but this
time the load will be wye-connected. As we can see in the following
figure, we have three voltage sources connected in wye (star), but
two of them in parallel. This will be done to streamline the analysis.

![Figure: Circuit analysis of the loads in wye connection with a three-phase bridge inverter](http://ghsalazar.github.io/electrical-machines-control/images/wye-analysis.svg)

To determine the voltage, drop on the resistor $Ra$, $Van$, the
voltage divider computing needs to be done

$$Van = \frac{\frac{Ra Rc}{Ra+Rc}}{\frac{Ra Rc}{Ra+Rc}+Rb} (Va+Vb).$$

Because the load is balanced, we've got that

$$Ra=Rb=Rc$$

and, on the other hand, we’got

$$Va=Vb.$$

Then we finally obtain

$$Van = \frac{1}{3} Vs.$$ 

For $Vbn$ and $Vcn$, we can have similar computations and obtain

$$Vbn = -\frac{2}{3} Vs$$

and

$$Vcn = \frac{1}{3} Vs.$$ 

If we follow the same analysis throughout the entire interval, we may
get signals appearing on the next figure.

![Figure: Waveforms of the loads in delta connection with a three-phase full bridge](http://ghsalazar.github.io/electrical-machines-control/images/waveforms-three-phase-bridge-inverter-wye.svg)

As we can see, the waveforms obtained are a better approach to a sine
wave than just a square wave, but they differ from those in the delta
connection.

## References

<p id="#bib-rashid-1999">Rashid, M. H. (1995). Electrónica de potencia: circuitos, dispositivos
y aplicaciones (2a. Edición). México: Prentice-Hall Hispanoamérica.</p>

