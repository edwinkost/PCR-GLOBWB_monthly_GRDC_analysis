
script_folder=/home/edwin/github/edwinkost/PCR-GLOBWB_monthly_GRDC_analysis
cd ${script_folder}

python_script_file_used="0_main_analyze_discharge_flexible_06min.py"

#~ edwin@fcn18.bullx:/scratch-shared/edwin/ulysses_results_until_2020-09-01/ulysses_gmd-precipitation$ ls -lah
#~ total 11G
#~ drwxr-xr-x 2 edwin edwin 4.0K Sep  2 11:07 .
#~ drwxr-xr-x 5 edwin edwin 4.0K Sep  2 10:54 ..
#~ -rw-r----- 1 edwin edwin  11G Sep  2 11:07 discharge_monthAvg_output_1981-01-31_to_2015-12-31.nc

pcrglobwb_output_folder="/scratch-shared/edwin/ulysses_results_until_2020-09-01/ulysses_gmd-precipitation/"

global_analysis_out_dir="/scratch-shared/edwin/ulysses_results_until_2020-09-01/ulysses_gmd-precipitation/edwin_monthly_discharge_evaluation/"

str_date=1981-01-31
end_date=2015-12-31

# Note that the GRDC observation data are not available until 2015 (requested by Edwin on 23 April 2014)                              
discharge_file_name="discharge_monthAvg_output_1981-01-31_to_2015-12-31.nc"

globalclone="/scratch-shared/edwin/ulysses_results_until_2020-09-01/ulysses_default/lddsound_06min_version_202007XX_for_ulysses.map"
lddmap_file="/scratch-shared/edwin/ulysses_results_until_2020-09-01/ulysses_default/lddsound_06min_version_202007XX_for_ulysses.map" 
cellarea_m2="/scratch-shared/edwin/ulysses_results_until_2020-09-01/ulysses_default/cdo_griddarea.map" 

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
