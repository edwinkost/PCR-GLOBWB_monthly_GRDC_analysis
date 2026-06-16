#!/bin/bash
#SBATCH -N 1
#SBATCH -n 48
#~ #SBATCH -n 96

#SBATCH -t 119:59:59

#~ #SBATCH -t 0:59:59

# eejit
#SBATCH -p defq
#~ #SBATCH --exclusive

#~ # mail alert at start, end and abortion of execution
#~ #SBATCH --mail-type=ALL

#~ # send mail to this address
#~ #SBATCH --mail-user=edwinkost@gmail.com

#SBATCH -J grdc_val
## this is the job name


# exporting some variables
#SBATCH --export PCRGLOBWB_OUTPUT_FOLDER=${PCRGLOBWB_OUTPUT_FOLDER},DISCHARGE_FILENAME=${DISCHARGE_FILENAME},ANALYSIS_OUTPUT_FOLDER=${ANALYSIS_OUTPUT_FOLDER},STR_DATE=${STR_DATE},END_DATE=${END_DATE},LDD_FILE=${LDD_FILE},GLOBALCLONE=${GLOBALCLONE},CELLAREA_M2=${CELLAREA_M2},GRDC_MAIN_FOLDER=${GRDC_MAIN_FOLDER}


# load software
. /eejit/home/sutan101/load_R_on_eejit.sh 
. /eejit/home/sutan101/load_default.sh

python_script_file_used="_main_analyze_discharge.py"

#~ pcrglobwb_output_folder="/scratch-shared/edwin/pcrglobwb_wmo_run/v20250417/global/netcdf/merged/"
pcrglobwb_output_folder=${PCRGLOBWB_OUTPUT_FOLDER}"/"


#~ discharge_file_name="discharge_monthAvg_output_1981-2024.nc"
discharge_file_name=${DISCHARGE_FILENAME}

#~ global_analysis_out_dir="/scratch-shared/edwindan/pcrglobwb_wmo_run_validation/wmo_run/validation_1981-2019/"
global_analysis_out_dir=${ANALYSIS_OUTPUT_FOLDER}"/"

#~ str_date=1981-01-31
#~ end_date=2019-12-31
str_date=${STR_DATE}
end_date=${END_DATE}

# ldd, clone, etc
#~ lddmap_file="/projects/0/dfguu/users/edwin/data/pcrglobwb_input_aqueduct/version_2021-09-16/general/lddsound_05min_version_20210330.map"
#~ globalclone="/projects/0/dfguu/users/edwin/data/pcrglobwb_input_aqueduct/version_2021-09-16/general/lddsound_05min_version_20210330.map"
#~ cellarea_m2="/projects/0/dfguu/users/edwin/data/pcrglobwb_input_aqueduct/version_2021-09-16/general/cdo_gridarea_clone_global_05min_correct_lats.nc.map"
lddmap_file=${LDD_FILE}
globalclone=${GLOBALCLONE}
cellarea_m2=${CELLAREA_M2}

# grdc folder, e.g. "/scratch/depfg/sutan101/data/grdc_data_monthly_requested_on_2023013/txt_splitted/"
grdc_main_folder=${GRDC_MAIN_FOLDER}

# for testing
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir test $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &

#~ # actual runs
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 01 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 02 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 03 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 04 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 05 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 06 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 07 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 08 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 09 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 10 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 11 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 12 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 13 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 14 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 15 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 16 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 17 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 18 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 19 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 20 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 21 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 22 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 23 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 24 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 25 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 26 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 27 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 28 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 29 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &
#~ python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 30 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} ${grdc_main_folder} &

wait
