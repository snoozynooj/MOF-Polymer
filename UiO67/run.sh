#!/bin/bash
module load python
folders=" PEO PVA PVC PPL"
 

for folder in $folders;do
    cd  $folder/
    cp ../*.py .
    cp ../*.f90 .
    nohup python3 ABF_integrator1.py
    rm min.txt
    gfortran average.f90
    ./a.out > 1.log
    cd ../
done
