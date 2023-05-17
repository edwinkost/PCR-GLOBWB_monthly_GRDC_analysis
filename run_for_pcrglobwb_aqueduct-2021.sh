#!/bin/bash
#SBATCH -N 1
#SBATCH -t 119:59:00
#SBATCH -p normal

# mail alert at start, end and abortion of execution
#SBATCH --mail-type=ALL

# send mail to this address
#SBATCH --mail-user=edwinkost@gmail.com


module load 2021
module load R/4.1.0-foss-2021a

. /home/edwin/load_all_default.sh


python_script_file_used="0_main_analyze_discharge_flexible_aqueduct-2021.py"

pcrglobwb_output_folder="/scratch-shared/edwin/discharge_aqueduct_2021/"

global_analysis_out_dir=${pcrglobwb_output_folder}"/validation/"

discharge_file_name="pcrglobwb_cmip6-isimip3-gswp3-w5e5_image-aqueduct_historical-reference_discharge_global_monthly-average_1960_2019_basetier1.nc"

str_date=1979-01-31
end_date=2019-12-31

#~ str_date=1986-01-31
#~ end_date=1999-12-31

#~ str_date=1981-01-31
#~ end_date=1998-12-31


lddmap_file="/projects/0/dfguu/users/edwin/data/pcrglobwb_input_aqueduct/version_2021-09-16/general/lddsound_05min_version_20210330.map" 
globalclone="/projects/0/dfguu/users/edwin/data/pcrglobwb_input_aqueduct/version_2021-09-16/general/lddsound_05min_version_20210330.map"
cellarea_m2="/projects/0/dfguu/users/edwin/data/pcrglobwb_input_aqueduct/version_2021-09-16/general/cdo_gridarea_clone_global_05min_correct_lats.nc.map" 

python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 30 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2}
