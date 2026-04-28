#!/bin/bash

#SBATCH --partition=staging
#SBATCH --job-name=InstallHyperEnv
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=9
#SBATCH --time=04:00:00
#SBATCH --output=slurm_output_%A.out

module purge
module load 2024
module load Anaconda3/2024.06-1

cd $HOME/Hyperbolic-Flow-Matching/

# PyTorch CUDA 12.1 wheels are not on PyPI — required for torch==2.5.1+cu121
export PIP_EXTRA_INDEX_URL="https://download.pytorch.org/whl/cu121"

conda env create -f hyper_env.yaml
