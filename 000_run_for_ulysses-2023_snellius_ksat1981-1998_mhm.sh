#!/bin/bash
#SBATCH -N 1
#SBATCH -n 32

#SBATCH -t 119:59:59

#~ # eejit
#~ #SBATCH -p defq

#SBATCH -p genoa

#~ #SBATCH --exclusive

# mail alert at start, end and abortion of execution
#SBATCH --mail-type=ALL

# send mail to this address
#SBATCH --mail-user=edwinkost@gmail.com

#SBATCH -J grdc_val
## this is the job name

#~ # exporting some variables
#~ #SBATCH --export DISCHARGE_FILENAME=${DISCHARGE_FILENAME},SUB_OUT_FOLDER=${SUB_OUT_FOLDER}

#~ # -- eejit (Note: You may have problems while plotting hydrographs with ggplot2) 
#~ # load pcraster etc
#~ . /eejit/home/sutan101/load_my_miniconda_and_my_default_env.sh
#~ # load R
#~ . /eejit/home/sutan101/load_R.sh


# -- snellius genoa
module load 2022
module load R/4.2.1-foss-2022a
module load Miniconda3/4.12.0
unset PYTHONPATH
source activate /home/hydrowld/.conda/envs/pcrglobwb_python3_2023-10-31



python_script_file_used="000_main_analyze_discharge_flexible_ulysses-2023_snellius_mhm.py"

pcrglobwb_output_folder="/scratch-shared/edwin/pcrglobwb_ulysses_ksat_2023-11-17_only_1981-1998/"

#~ (pcrglobwb_python3_2023-10-31) edwin@tcn1118.local.snellius.surf.nl:/scratch-shared/edwin/pcrglobwb_ulysses_ksat_2023-11-17_only_1981-1998$ ls -lah
#~ total 13G
#~ drwxr-x--x 2 edwin edwin 4.0K Nov 19 11:38 .
#~ drwxr-xr-x 6 edwin edwin 4.0K Nov 19 11:31 ..
#~ -r--r----- 1 edwin edwin 4.2G Nov 19 11:37 discharge_monthAvg_output_1981-1998_ksat0.50.nc
#~ -r--r----- 1 edwin edwin 4.2G Nov 19 11:38 discharge_monthAvg_output_1981-1998_ksat0.75.nc
#~ -r--r----- 1 edwin edwin 4.2G Nov 19 11:40 discharge_monthAvg_output_1981-1998_ksat1.00.nc

#~ discharge_file_name="discharge_monthAvg_output_1981-2019.nc"
#~ discharge_file_name=${DISCHARGE_FILENAME}
discharge_file_name="monthly_average_q_mhm_mrm_era5land_1981-2019_fix-time_fix-var-name.nc"

#~ global_analysis_out_dir=${pcrglobwb_output_folder}"/validation_1981-2019/"
#~ global_analysis_out_dir=${pcrglobwb_output_folder}"/"${SUB_OUT_FOLDER}"/"
global_analysis_out_dir=${pcrglobwb_output_folder}"/validation_mhm/"

#~ str_date=1981-01-31
#~ end_date=2019-12-31
str_date=1981-01-31
end_date=1998-12-31

# 6 arcmin ulysses
lddmap_file="/projects/0/dfguu/users/edwin/data/pcrglobwb_input_ulysses/pcrglobwb_ulysses_input_files_v2021-01-03/lddsound_06min_version_202007XX_for_ulysses.map"
globalclone="/projects/0/dfguu/users/edwin/data/pcrglobwb_input_ulysses/pcrglobwb_ulysses_input_files_v2021-01-03/lddsound_06min_version_202007XX_for_ulysses.map"
cellarea_m2="/projects/0/dfguu/users/edwin/data/pcrglobwb_input_ulysses/pcrglobwb_ulysses_input_files_v2021-01-03/cellarea.map"


python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 01 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 02 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 03 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 04 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 05 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 06 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 07 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 08 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 09 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 10 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 11 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 12 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 13 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 14 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 15 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 16 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 17 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 18 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 19 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 20 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 21 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 22 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 23 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 24 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 25 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 26 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 27 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 28 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 29 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 30 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &

wait
