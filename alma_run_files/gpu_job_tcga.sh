#!/bin/bash
#SBATCH --job-name=test_gpu
#SBATCH --output=/home/ofourkioti/Projects/SAD_MIL/camelyon_results/tcga_k_10_8K.txt
#SBATCH --error=/home/ofourkioti/Projects/SAD_MIL/camelyon_results/tcga_exp.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --time=72:00:00
#SBATCH --gres=gpu:1
#SBATCH --partition=gpu

module use /opt/software/easybuild/modules/all/
module load Mamba
source ~/.bashrc
conda activate exp_env
cd /home/ofourkioti/Projects/SAD_MIL/

for i in {0..3};
do
python run.py  --experiment_name tcga_k_10_8K  --feature_path /data/scratch/DBI/DUDBI/DYNCESYS/OlgaF/tmi/tcga_lung/feats/h5_files/ --label_file label_files/tcga_data.csv --csv_file tcga_lung_files/splits_${i}.csv  --lambda1 1 --epoch 100 --eta 1 --topk 10 --subtyping;
done
#python run_simclr.py --simclr_path  lipo_SIMCLR_checkpoints --feature_path /data/scratch/DBI/DUDBI/DYNCESYS/OlgaF/multi_magnification_project/SAR_data/simclr_imgs/h5_files/  --csv_file lipo_csv_files/splits_0.csv --simclr_batch_size 1024
#/data/scratch/DBI/DUDBI/DYNCESYS/OlgaF/camelyon17/images/
#/data/scratch/DBI/DUDBI/DYNCESYS/OlgaF/camelyon17/patches/
#/data/scratch/DBI/DUDBI/DYNCESYS/OlgaF/tmi/cam-17/





