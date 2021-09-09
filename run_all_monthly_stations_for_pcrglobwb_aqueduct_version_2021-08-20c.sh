#!/bin/bash
#SBATCH -N 1
#SBATCH -t 59:00
#SBATCH -p normal

# mail alert at start, end and abortion of execution
#SBATCH --mail-type=ALL

# send mail to this address
#SBATCH --mail-user=edwinkost@gmail.com

#~ python_script_file_used="0_main_analyze_discharge_flexible_06min.py"
python_script_file_used="0_main_analyze_discharge_flexible_version_20210508.py"

pcrglobwb_output_folder="/projects/0/dfguu/users/edwin/pcrglobwb_aqueduct_2021/version_2021-08-20c_gmd-paper-irrigated-areas/global/netcdf/netcdf_discharge_1979-2019/"

IN PROGRESS

global_analysis_out_dir=${pcrglobwb_output_folder}"/monthly_discharge_evaluation/"

discharge_file_name="discharge_monthAvg_output_1979-2019.nc"

str_date=1979-01-31
end_date=2016-12-31


#~ edwinhs@int1.bullx:/projects/0/dfguu/data/hydroworld/pcrglobwb2_input_release/version_2019_11_beta_extended/pcrglobwb2_input/global_05min/routing/ldd_and_cell_area$ ls -lah *
#~ -rwxr-xr-x 1 hydrowld dfguu  36M Dec  5  2019 cellsize05min.correct.map
#~ -rw-r--r-- 1 hydrowld dfguu  36M Dec  5  2019 cellsize05min.correct.nc
#~ -rw-r--r-- 1 hydrowld dfguu  36M Dec  5  2019 cellsize05min_correct.nc
#~ -rw-r--r-- 1 hydrowld dfguu  129 Dec  5  2019 hydroworld_source.txt
#~ -rwxr-xr-x 1 hydrowld dfguu 8.9M Dec  5  2019 lddsound_05min.map
#~ -rw-r--r-- 1 hydrowld dfguu  36M Dec  5  2019 lddsound_05min.nc
#~ -rw-r--r-- 1 hydrowld dfguu  36M Dec  5  2019 lddsound_05min_unmask.nc

#~ globalclone="/projects/0/dfguu/data/hydroworld/pcrglobwb2_input_release/version_2019_11_beta_extended/pcrglobwb2_input/global_05min/routing/ldd_and_cell_area/lddsound_05min.map"
#~ lddmap_file="/projects/0/dfguu/data/hydroworld/pcrglobwb2_input_release/version_2019_11_beta_extended/pcrglobwb2_input/global_05min/routing/ldd_and_cell_area/lddsound_05min.map"
#~ cellarea_m2="/projects/0/dfguu/data/hydroworld/pcrglobwb2_input_release/version_2019_11_beta_extended/pcrglobwb2_input/global_05min/routing/ldd_and_cell_area/cellsize05min.correct.map"


#~ (pcrglobwb_py3_env_v20200309_with_cdsapi) edwinhs@fcn6.bullx:/scratch-shared/edwinhs/pcrglobwb_aqueduct_2021_develop/version_2021-05-03_updated_gmd_parameters/global/ldd_etc$ ls -lah
#~ total 81M
#~ drwxr-xr-x 2 edwinhs edwinhs 4.0K May  8 00:38 .
#~ drwxr-xr-x 4 edwinhs edwinhs 4.0K May  8 00:34 ..
#~ -rw-r--r-- 1 edwinhs edwinhs  36M May  8 00:38 cdo_gridarea_clone_global_05min_correct_lats.map
#~ -rw-r--r-- 1 edwinhs edwinhs  36M Apr  2 02:29 cdo_gridarea_clone_global_05min_correct_lats.nc
#~ -r--r--r-- 1 edwinhs edwinhs 8.9M Apr  1 11:33 lddsound_05min_version_20210330.map

globalclone="/scratch-shared/edwinhs/pcrglobwb_aqueduct_2021_develop/version_2021-05-03_updated_gmd_parameters/global/ldd_etc/lddsound_05min_version_20210330.map"
lddmap_file="/scratch-shared/edwinhs/pcrglobwb_aqueduct_2021_develop/version_2021-05-03_updated_gmd_parameters/global/ldd_etc/lddsound_05min_version_20210330.map"
cellarea_m2="/scratch-shared/edwinhs/pcrglobwb_aqueduct_2021_develop/version_2021-05-03_updated_gmd_parameters/global/ldd_etc/cdo_gridarea_clone_global_05min_correct_lats.map"


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

wait
