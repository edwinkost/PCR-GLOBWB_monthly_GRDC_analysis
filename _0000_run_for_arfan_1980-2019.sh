#!/bin/bash
#SBATCH -N 1
#SBATCH -n 32

#SBATCH -t 119:59:59

#SBATCH -p genoa

#~ # mail alert at start, end and abortion of execution
#~ #SBATCH --mail-type=ALL

#~ # send mail to this address
#~ #SBATCH --mail-user=XXX@XXX.com

#SBATCH -J grdc_val
## this is the job name

#~ # exporting some variables
#~ #SBATCH --export DISCHARGE_OUTPUT_FOLDER=${DISCHARGE_OUTPUT_FOLDER},DISCHARGE_FILENAME=${DISCHARGE_FILENAME},ANALYSIS_OUTPUT_FOLDER=${ANALYSIS_OUTPUT_FOLDER}


# -- snellius genoa
module load 2022
module load R/4.2.1-foss-2022a
module load Miniconda3/4.12.0
unset PYTHONPATH
source activate /home/hydrowld/.conda/envs/pcrglobwb_python3_2023-10-31



python_script_file_used="_0000_main_analyze_discharge_flexible.py"

# folder that contains PCR-GLOBWB merged discharge (monthly resolution)
#~ discharge_output_folder="/scratch/depfg/sutan101/pcrglobwb_ulysses_2023-12-XX_validation/mhm/"
#~ discharge_output_folder=${DISCHARGE_OUTPUT_FOLDER}
discharge_output_folder="/scratch-shared/edwindql/test_discharge_demo_for_arfan/"

# PCR-GLOBWB monthly discharge file
#~ discharge_file_name="discharge_monthAvg_output_mhm_1981-1995.nc"
#~ discharge_file_name=${DISCHARGE_FILENAME}
discharge_file_name="discharge_monthAvg_output_1980-2019.nc"

# analysis output folder
#~ global_analysis_out_dir=${ANALYSIS_OUTPUT_FOLDER}
global_analysis_out_dir="/scratch-shared/edwindql/test_discharge_demo_for_arfan/gdrc_validation_1980-2019/"


#~ str_date=1981-01-31
#~ end_date=1995-12-31
str_date=1980-01-31
end_date=2019-12-31

# clone, ldd and cellarea files
# - on snellius
globalclone="/projects/0/dfguu/users/edwin/data/pcrglobwb_input_aqueduct/version_2021-09-16/general/lddsound_05min_version_20210330.map"
lddmap_file="/projects/0/dfguu/users/edwin/data/pcrglobwb_input_aqueduct/version_2021-09-16/general/lddsound_05min_version_20210330.map"
cellarea_m2="/projects/0/dfguu/users/edwin/data/pcrglobwb_input_aqueduct/version_2021-09-16/general/cdo_gridarea_clone_global_05min_correct_lats.nc.map"



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
