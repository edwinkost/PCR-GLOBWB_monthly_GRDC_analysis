
python_script_file_used="0_main_analyze_discharge_flexible_30min.py" 
pcrglobwb_output_folder="/scratch-shared/edwinhs/runs_2017_finalizing_4LCs/30min/4LCs_accutraveltime_cru-forcing_latest_version/non-natural/begin_from_1958/netcdf/"
global_analysis_out_dir="/scratch-shared/edwinhs/runs_2017_finalizing_4LCs/30min/4LCs_accutraveltime_cru-forcing_latest_version/non-natural/analysis/monthly_discharge_analysis_1985-2015/"
# Note that the GRDC observation data are not available until 2015 (requested by Edwin on 23 April 2014)                              
str_date=1958-01-31
end_date=2015-12-31

python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 01 $str_date $end_date &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 02 $str_date $end_date &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 03 $str_date $end_date &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 04 $str_date $end_date &
wait
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 05 $str_date $end_date &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 06 $str_date $end_date &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 07 $str_date $end_date &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 08 $str_date $end_date &
wait
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 09 $str_date $end_date &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 10 $str_date $end_date &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 11 $str_date $end_date &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 12 $str_date $end_date &
wait
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 13 $str_date $end_date &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 14 $str_date $end_date &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 15 $str_date $end_date &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 16 $str_date $end_date &
wait
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 17 $str_date $end_date &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 18 $str_date $end_date &
wait
