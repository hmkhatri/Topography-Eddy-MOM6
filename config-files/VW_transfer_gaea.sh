#!/bin/bash

module load gcp

path_dir="gaea:/lustre/f2/dev/Hemant.Khatri/MOM6_simulations/Topography_SWM/Barotropic_Baroclinic/2L_Var_Width"

declare -a List=("Tau_001" "Tau_003" "Tau_005" "Tau_01" "Tau_03" "Tau_05" "Tau_1") 

for entry in "${List[@]}"
   do
     mkdir -p $entry
     echo "Directory created: $entry"

     file="ocean.stats.nc"
     gcp $path_dir/$entry/$file ./$entry/
     echo "File Transfer Complete: $file"
    
     file="prog.nc"
     gcp $path_dir/$entry/$file ./$entry/
     echo "File Transfer Complete: $file"
   done


