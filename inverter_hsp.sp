
*SPICE FILE for INVERTER SIMULATION


**Include the Netlist***
**Make sure you include the correct paths with suitable heirarchy if infuture you create folders to simulate
.INCLUDE "inverter_netlist.sp"


***Include the tech files.
**Make sure you include the correct paths with suitable heirarchy if infuture you create folders to simulate
.INCLUDE "../Hspice/INC/NMOS_THKOX.inc"
.INCLUDE "../Hspice/INC/NMOS_VTG.inc"
.INCLUDE "../Hspice/INC/NMOS_VTH.inc"
.INCLUDE "../Hspice/INC/NMOS_VTL.inc"
.INCLUDE "../Hspice/INC/PMOS_THKOX.inc"
.INCLUDE "../Hspice/INC/PMOS_VTG.inc"
.INCLUDE "../Hspice/INC/PMOS_VTH.inc"
.INCLUDE "../Hspice/INC/PMOS_VTL.inc"


*Options for the simulation. This decides which optimisation methods etc you want to use
.OPTION
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2

*supply in V
.param supply = 1.0

*temperature in C
.temp 25



**Instantiate the inverter subcircuit
*instance_name <pins with spaces in exact sequence as defined in the subcircuit> subcircuit name
Xinv1 GND IN OUT VDD myInverter

**add power and ground supply

Vvdd VDD 0 supply
*connects supply between VDD and 0
Vgnd GND 0 0
*connects 0 v between GND and 0

Vvin IN 0 PWL(
+100p 0 1n 0
+1.1n 1 2n 1
+2.1n 0 3n 0
)
*connects a piecewise linear signal to the IN and 0


*initial condition for OUT
.ic V(OUT) =0

*measure syntax, here I will measure the current through VDD at 275p
.measure tran I_inv MAX I(Vvdd) from=275p to=275.1p

*transient simulation start end
.tran 100p 5n

*operating point analysis
.op

*dump the trace file for all voltage and current
.probe V(*) I(*)







.end




