
script_folder=/home/edwin/github/edwinkost/PCR-GLOBWB_monthly_GRDC_analysis
cd ${script_folder}

python_script_file_used="0_main_analyze_discharge_flexible_also.py"

#~ edwin@fcn18.bullx:/scratch-shared/edwin/ulysses_results_until_2020-09-01/ulysses_gmd-precipitation$ ls -lah
#~ total 11G
#~ drwxr-xr-x 2 edwin edwin 4.0K Sep  2 11:07 .
#~ drwxr-xr-x 5 edwin edwin 4.0K Sep  2 10:54 ..
#~ -rw-r----- 1 edwin edwin  11G Sep  2 11:07 discharge_monthAvg_output_1981-01-31_to_2015-12-31.nc

pcrglobwb_output_folder="/scratch-shared/edwinvua/pcrglobwb2_output_gmd_paper_rerun_201903XX_05min_using_consistent_pcraster/05min/non-natural/merged_1958_to_2015/"

global_analysis_out_dir="/scratch-shared/edwin/ulysses_results_until_2020-09-01/gmd_paper_sutanudjaja/edwin_monthly_discharge_evaluation/"

str_date=1981-01-31
end_date=2015-12-31

discharge_file_name="discharge_monthAvg_output_1958-01-31_to_2015-12-31.nc"

#~ globalclone="/scratch-shared/edwin/ulysses_results_until_2020-09-01/ulysses_default/lddsound_06min_version_202007XX_for_ulysses.map"
#~ lddmap_file="/scratch-shared/edwin/ulysses_results_until_2020-09-01/ulysses_default/lddsound_06min_version_202007XX_for_ulysses.map" 
#~ cellarea_m2="/scratch-shared/edwin/ulysses_results_until_2020-09-01/ulysses_default/cdo_griddarea.map" 

globalclone="/projects/0/dfguu/data/hydroworld/pcrglobwb2_input_release/version_2019_11_beta_extended/pcrglobwb2_input/global_05min/routing/ldd_and_cell_area/lddsound_05min.map"
lddmap_file="/projects/0/dfguu/data/hydroworld/pcrglobwb2_input_release/version_2019_11_beta_extended/pcrglobwb2_input/global_05min/routing/ldd_and_cell_area/lddsound_05min.map"
cellarea_m2="/projects/0/dfguu/data/hydroworld/pcrglobwb2_input_release/version_2019_11_beta_extended/pcrglobwb2_input/global_05min/routing/ldd_and_cell_area/cellsize05min.correct.map"

#~ edwin@fcn18.bullx:/projects/0/dfguu/data/hydroworld/pcrglobwb2_input_release/version_2019_11_beta_extended/pcrglobwb2_input/global_05min/routing/ldd_and_cell_area$ ls -lah *
#~ -rwxr-xr-x 1 hydrowld dfguu  36M Dec  5  2019 cellsize05min.correct.map
#~ -rw-r--r-- 1 hydrowld dfguu  36M Dec  5  2019 cellsize05min.correct.nc
#~ -rw-r--r-- 1 hydrowld dfguu  36M Dec  5  2019 cellsize05min_correct.nc
#~ -rw-r--r-- 1 hydrowld dfguu  129 Dec  5  2019 hydroworld_source.txt
#~ -rwxr-xr-x 1 hydrowld dfguu 8.9M Dec  5  2019 lddsound_05min.map
#~ -rw-r--r-- 1 hydrowld dfguu  36M Dec  5  2019 lddsound_05min.nc
#~ -rw-r--r-- 1 hydrowld dfguu  36M Dec  5  2019 lddsound_05min_unmask.nc

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
