#!/bin/bash
#SBATCH -N 1
#SBATCH -t 119:59:00
#SBATCH -p normal

# mail alert at start, end and abortion of execution
#SBATCH --mail-type=ALL

# send mail to this address
#SBATCH --mail-user=edwinkost@gmail.com

python_script_file_used="0_main_analyze_discharge_flexible_06min.py"

pcrglobwb_output_folder="/scratch-shared/edwinhs/discharge_evaluation_ulysses_2020-12-01/new-jgw_uly-et0_uly-lcv/merged_1981-1998/"

global_analysis_out_dir=${pcrglobwb_output_folder}"/edwin_monthly_discharge_evaluation_with_job/"

#~ str_date=1981-01-31
#~ end_date=2019-12-31

#~ str_date=1986-01-31
#~ end_date=1999-12-31

str_date=1981-01-31
end_date=1998-12-31

# Note that the GRDC observation data are not available until 2015 (requested by Edwin on 23 April 2014)                              
discharge_file_name="discharge_monthAvg_output_1981-01-31_to_2019-12-31.nc"
discharge_file_name="discharge_monthAvg_output_1986-1999.nc"
discharge_file_name="discharge_monthAvg_output_1981-1998_new-jgw_uly-et0_uly-lcv.nc"

#~ globalclone="/scratch/shared/edwin/uly_6min_results/clone.map" 
#~ lddmap_file="/scratch/shared/edwin/uly_6min_results/lddsound_06min_version_202007XX_for_ulysses.map" 
#~ cellarea_m2="/scratch/shared/edwin/uly_6min_results/cdo_griddarea.map" 

globalclone="/scratch-shared/edwinhs/discharge_evaluation_ulysses_2020-12-01/maps/maps_1400_rows/land_mask_only.map" 
lddmap_file="/scratch-shared/edwinhs/discharge_evaluation_ulysses_2020-12-01/maps/maps_1400_rows/lddsound_06min_version_202007XX_for_ulysses.map" 
cellarea_m2="/scratch-shared/edwinhs/discharge_evaluation_ulysses_2020-12-01/maps/maps_1400_rows/cellarea_1400rows.map" 

#~ edwinhs@tcn758.bullx:/scratch-shared/edwinhs/discharge_evaluation_ulysses_2020-11-25/maps/maps_1400_rows$ ls -lah *.map
#~ -rw-r--r-- 1 edwinhs edwinhs  20M Nov 25 11:32 cellarea_1400rows.map
#~ -rw-r----- 1 edwinhs edwinhs 4.9M Nov 25 11:32 land_mask_only.map
#~ -rw-r--r-- 1 edwinhs edwinhs 4.9M Nov 25 11:32 lddsound_06min_version_202007XX_for_ulysses.map

python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 01 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 02 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 03 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 04 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 05 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 06 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 07 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 08 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &

python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 09 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &

wait

python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 10 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 11 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 12 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 13 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 14 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 15 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 16 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 17 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 18 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &

wait
