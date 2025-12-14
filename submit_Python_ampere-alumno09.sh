#!/bin/bash
#
# ================================================================= 
# 3.2. Python HPC: lists y Numpy con Jupyter notebook
# c) Ejecución del notebook con diferentes valores de elementos
# =================================================================
#
#SBATCH -p hpc-bio-ampere
#SBATCH --chdir=/home/alumno09/lab-python
#SBATCH -J python-alumno09
#SBATCH --cpus-per-task=1
#SBATCH --output=python-%j.out
#SBATCH --mail-type=NONE

# Cargar módulo de Anaconda
echo "Cargando módulo anaconda/2025.06..."
module load anaconda/2025.06
echo "Módulo cargado."
echo ""

# Obtener el número de elementos del primer argumento del script SLURM
NUM_ELEMENTS=$1
if [ -z "$NUM_ELEMENTS" ]; then
    echo "ERROR: Debe proporcionar el número de elementos como argumento."
    echo "Uso: sbatch submit_Python_ampere-alumno09.sh <num_elementos>"
    echo "Ejemplo: sbatch submit_Python_ampere-alumno09.sh 10000000"
    exit 1
fi

echo "========================================"
echo "Ejecutando con value = $NUM_ELEMENTS elementos"
echo "========================================"
echo "--- Iniciando ejecución del notebook ---"
date
echo ""

# Ejecutar el notebook usando ipython y pasar el número de elementos como argumento
ipython reduc-operation-alumno09.ipynb $NUM_ELEMENTS

