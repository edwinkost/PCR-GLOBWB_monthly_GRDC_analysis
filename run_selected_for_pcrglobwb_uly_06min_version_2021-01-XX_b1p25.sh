#!/bin/bash
#SBATCH -N 1
#SBATCH -t 119:59:00
#SBATCH -p normal

# mail alert at start, end and abortion of execution
#SBATCH --mail-type=ALL

# send mail to this address
#SBATCH --mail-user=edwinkost@gmail.com

python_script_file_used="0_main_analyze_discharge_flexible_06min.py"

#~ edwinhs@tcn1066.bullx:/scratch-shared/edwinhs/discharge_evaluation_ulysses_2021-01-XX/merged_discharge_1981-2019$ ls -lah *
#~ -rw-r--r-- 1 edwinhs edwinhs 8.9G Jan 12 16:24 discharge_monthAvg_output_1981-2019_b1p00.nc
#~ -rw-r--r-- 1 edwinhs edwinhs 8.9G Jan 12 16:24 discharge_monthAvg_output_1981-2019_b1p05.nc
#~ -rw-r--r-- 1 edwinhs edwinhs 8.9G Jan 12 16:24 discharge_monthAvg_output_1981-2019_b1p10.nc
#~ -rw-r--r-- 1 edwinhs edwinhs 8.9G Jan 12 16:24 discharge_monthAvg_output_1981-2019_b1p25.nc
#~ -rw-r--r-- 1 edwinhs edwinhs 8.9G Jan 12 16:24 discharge_monthAvg_output_1981-2019_b1p50.nc
#~ -rw-r--r-- 1 edwinhs edwinhs 1021 Jan 12 16:21 merging_discharge.sh

pcrglobwb_output_folder="/scratch-shared/edwinhs/discharge_evaluation_ulysses_2021-01-XX/merged_discharge_1981-2019/"

global_analysis_out_dir=${pcrglobwb_output_folder}"/monthly_discharge_evaluation/b1p25/"

discharge_file_name="discharge_monthAvg_output_1981-2019_b1p25.nc"

str_date=1981-01-31
end_date=2019-12-31

#~ str_date=1986-01-31
#~ end_date=1999-12-31

#~ str_date=1981-01-31
#~ end_date=1998-12-31


globalclone="/scratch-shared/edwinhs/discharge_evaluation_ulysses_2021-01-XX/maps/maps_1400_rows/land_mask_only.map" 
lddmap_file="/scratch-shared/edwinhs/discharge_evaluation_ulysses_2021-01-XX/maps/maps_1400_rows/lddsound_06min_version_202007XX_for_ulysses.map" 
cellarea_m2="/scratch-shared/edwinhs/discharge_evaluation_ulysses_2021-01-XX/maps/maps_1400_rows/cellarea_1400rows.map" 

#~ edwinhs@tcn758.bullx:/scratch-shared/edwinhs/discharge_evaluation_ulysses_2020-11-25/maps/maps_1400_rows$ ls -lah *.map
#~ -rw-r--r-- 1 edwinhs edwinhs  20M Nov 25 11:32 cellarea_1400rows.map
#~ -rw-r----- 1 edwinhs edwinhs 4.9M Nov 25 11:32 land_mask_only.map
#~ -rw-r--r-- 1 edwinhs edwinhs 4.9M Nov 25 11:32 lddsound_06min_version_202007XX_for_ulysses.map

python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir selected_for_uly $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
