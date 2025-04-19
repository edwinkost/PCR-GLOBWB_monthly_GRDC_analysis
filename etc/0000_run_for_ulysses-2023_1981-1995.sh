#!/bin/bash
#SBATCH -N 1
#SBATCH -n 32

#SBATCH -t 119:59:59

#~ #SBATCH -t 0:59:59

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

# exporting some variables
#SBATCH --export DISCHARGE_OUTPUT_FOLDER=${DISCHARGE_OUTPUT_FOLDER},DISCHARGE_FILENAME=${DISCHARGE_FILENAME},ANALYSIS_OUTPUT_FOLDER=${ANALYSIS_OUTPUT_FOLDER}


#~ # -- eejit (Note: You may have problems while plotting hydrographs with ggplot2) 
#~ # load pcraster etc
#~ . /eejit/home/sutan101/load_default.sh
#~ # load R
#~ . /eejit/home/sutan101/load_R.sh


# -- snellius genoa
module load 2022
module load R/4.2.1-foss-2022a
module load Miniconda3/4.12.0
unset PYTHONPATH
source activate /home/hydrowld/.conda/envs/pcrglobwb_python3_2023-10-31



python_script_file_used="0000_main_analyze_discharge_flexible_ulysses-2023.py"

#~ discharge_output_folder="/scratch/depfg/sutan101/pcrglobwb_ulysses_2023-12-XX_validation/mhm/"
discharge_output_folder=${DISCHARGE_OUTPUT_FOLDER}

#~ discharge_file_name="discharge_monthAvg_output_mhm_1981-1995.nc"
discharge_file_name=${DISCHARGE_FILENAME}

# analysis output folder
global_analysis_out_dir=${ANALYSIS_OUTPUT_FOLDER}

str_date=1981-01-31
end_date=1995-12-31
#~ str_date=1981-01-31
#~ end_date=2019-12-31
#~ str_date=1981-01-31
#~ end_date=1998-12-31

# clone, ldd and cellare file used for 6 arcmin ulysses runs
#
#~ # - on eejit
#~ globalclone="/scratch/depfg/sutan101/pcrglobwb_input_ulysses_v202312XX/develop_edwin/lddsound_06min_version_202007XX_for_ulysses.map"
#~ lddmap_file="/scratch/depfg/sutan101/pcrglobwb_input_ulysses_v202312XX/develop_edwin/lddsound_06min_version_202007XX_for_ulysses.map"
#~ cellarea_m2="/scratch/depfg/sutan101/pcrglobwb_input_ulysses_v202312XX/develop_edwin/cellarea.map"
#~ #
# - on snellius
globalclone="/projects/0/dfguu/users/edwin/data/pcrglobwb_input_ulysses/pcrglobwb_ulysses_input_files_v2021-01-03/lddsound_06min_version_202007XX_for_ulysses.map"
lddmap_file="/projects/0/dfguu/users/edwin/data/pcrglobwb_input_ulysses/pcrglobwb_ulysses_input_files_v2021-01-03/lddsound_06min_version_202007XX_for_ulysses.map"
cellarea_m2="/projects/0/dfguu/users/edwin/data/pcrglobwb_input_ulysses/pcrglobwb_ulysses_input_files_v2021-01-03/cellarea.map"


#~ # for testing
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir test $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &

# actual runs
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 01 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 02 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 03 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 04 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 05 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 06 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 07 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 08 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 09 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 10 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 11 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 12 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 13 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 14 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 15 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 16 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 17 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 18 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 19 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 20 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 21 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 22 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 23 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 24 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 25 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 26 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 27 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 28 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 29 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $discharge_output_folder $global_analysis_out_dir 30 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &

wait
