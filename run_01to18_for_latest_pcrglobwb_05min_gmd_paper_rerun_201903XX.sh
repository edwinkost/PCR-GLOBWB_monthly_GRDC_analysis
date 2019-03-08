
python_script_file_used="0_main_analyze_discharge_flexible_05min.py" 
pcrglobwb_output_folder="/scratch-shared/edwin/pcrglobwb2_output_gmd_paper_rerun_201903XX_using_consistent_pcraster/05min/natural/merged_1958_to_2015/"
global_analysis_out_dir="/scratch-shared/edwin/pcrglobwb2_output_gmd_paper_rerun_201903XX_using_consistent_pcraster/05min/natural/analysis/edwin_discharge_analysis_1958-2015/"
str_date=1958-01-31
end_date=2015-12-31
# Note that the GRDC observation data are not available until 2015 (requested by Edwin on 23 April 2014)                              
discharge_file_name="discharge_monthAvg_output_1958-01-31_to_2015-12-31.nc"

python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 08 $str_date $end_date $discharge_file_name &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 09 $str_date $end_date $discharge_file_name &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 10 $str_date $end_date $discharge_file_name &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 11 $str_date $end_date $discharge_file_name &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 12 $str_date $end_date $discharge_file_name &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 13 $str_date $end_date $discharge_file_name &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 14 $str_date $end_date $discharge_file_name &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 15 $str_date $end_date $discharge_file_name &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 16 $str_date $end_date $discharge_file_name &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 17 $str_date $end_date $discharge_file_name &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 18 $str_date $end_date $discharge_file_name &
wait
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 01 $str_date $end_date $discharge_file_name &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 02 $str_date $end_date $discharge_file_name &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 03 $str_date $end_date $discharge_file_name &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 04 $str_date $end_date $discharge_file_name &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 05 $str_date $end_date $discharge_file_name &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 06 $str_date $end_date $discharge_file_name &
python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 07 $str_date $end_date $discharge_file_name &
wait
