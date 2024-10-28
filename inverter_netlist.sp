************************************************************************
* auCdl Netlist:
* 
* Library Name:  HSPICE_Tutorial
* Top Cell Name: myInverter
* View Name:     schematic
* Netlisted on:  Aug 24 15:02:41 2021
************************************************************************

*.BIPOLAR
*.RESI = 2000 
*.RESVAL
*.CAPVAL
*.DIOPERI
*.DIOAREA
*.EQUATION
*.SCALE METER
*.MEGA
.PARAM



************************************************************************
* Library Name: HSPICE_Tutorial
* Cell Name:    myInverter
* View Name:    schematic
************************************************************************

.SUBCKT myInverter GND IN OUT VDD
*.PININFO IN:I GND:B OUT:B VDD:B
MM1 OUT IN GND GND NMOS_VTG W=250n L=50n
MM0 OUT IN VDD VDD PMOS_VTG W=250n L=50n
CC0 OUT GND 1f $[CP]
.ENDS

