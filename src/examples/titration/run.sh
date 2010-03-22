#!/bin/bash

#--- Write config file ---
function mkinput() {
echo "
pH         $pH
macrosteps $macrosteps
microsteps $microsteps
boxlen     $boxlen
bjerrum    $bjerrum
LJeps      $LJeps
nion1      $nion1
nion2      $nion2
tion1      $tion1
tion2      $tion2
nprot1     $nprot1
protein   $protein
nprot2     $nprot2
protein2   $protein2
voldp      $voldp
pressure   $pressure
e_r        $e_r
kappa      $kappa
atomfile   $atomfile
polymer    $polymer
" > pka.conf
}

#--- Input parameters ---
polymer="GLU3simp.mol2"
macrosteps=10
microsteps=100
cellradius=90
bjerrum=7.12
LJeps=0.2
pH=7.5
nion1=42
nion2=23
tion1="NA"
tion2="CL"
protein="calbindin.aam"
atomfile="../../../misc/faunatoms.dat"
#
  suffix="name"
  mkinput
  ./pka > out1
  microsteps=100
  mkinput
  ./pka > ${suffix}.out
  mv smeared.aam > ${suffix}.aam
  rm confout.aam 

