
python_script_file_used="0_main_analyze_discharge_flexible_06min.py"

pcrglobwb_output_folder="/scratch-shared/edwinhs/discharge_evaluation_ulysses_2020-11-25/hamon-et0_uly-lcv/merged_1981-2019/"

#~ edwinhs@tcn758.bullx:/scratch-shared/edwinhs/discharge_evaluation_ulysses_2020-11-25$ ls -lah */*/*.nc
#~ -r--r--r-- 1 edwinhs edwinhs 8.9G Nov 25 06:35  hamon-et0_gmd-lcv/merged_1981-2019/discharge_monthAvg_output_1981-01-31_to_2019-12-31.nc
#~ -r--r--r-- 1 edwinhs edwinhs 8.9G Nov 25 09:54  hamon-et0_uly-lcv/merged_1981-2019/discharge_monthAvg_output_1981-01-31_to_2019-12-31.nc
#~ -r--r--r-- 1 edwinhs edwinhs 8.9G Nov 25 06:07 ulysse-et0_gmd-lcv/merged_1981-2019/discharge_monthAvg_output_1981-01-31_to_2019-12-31.nc
#~ -r--r--r-- 1 edwinhs edwinhs 8.9G Nov 25 10:41 ulysse-et0_uly-lcv/merged_1981-2019/discharge_monthAvg_output_1981-01-31_to_2019-12-31.nc

global_analysis_out_dir=${pcrglobwb_output_folder}"/edwin_monthly_discharge_evaluation/"

str_date=1981-01-31
end_date=2019-12-31

# Note that the GRDC observation data are not available until 2015 (requested by Edwin on 23 April 2014)                              
discharge_file_name="discharge_monthAvg_output_1981-01-31_to_2019-12-31.nc"

#~ globalclone="/scratch/shared/edwin/uly_6min_results/clone.map" 
#~ lddmap_file="/scratch/shared/edwin/uly_6min_results/lddsound_06min_version_202007XX_for_ulysses.map" 
#~ cellarea_m2="/scratch/shared/edwin/uly_6min_results/cdo_griddarea.map" 

globalclone="/scratch-shared/edwinhs/discharge_evaluation_ulysses_2020-11-25/maps/maps_1400_rows/land_mask_only.map" 
lddmap_file="/scratch-shared/edwinhs/discharge_evaluation_ulysses_2020-11-25/maps/maps_1400_rows/lddsound_06min_version_202007XX_for_ulysses.map" 
cellarea_m2="/scratch-shared/edwinhs/discharge_evaluation_ulysses_2020-11-25/maps/maps_1400_rows/cellarea_1400rows.map" 

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
