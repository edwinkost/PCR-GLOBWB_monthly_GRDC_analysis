#!/bin/bash
#SBATCH -N 1
#SBATCH -t 119:59:00
#SBATCH -p thin
#SBATCH -n 32
## this is the number of cores, you can set this to 32, 64, 96 or 128 (use 128 if you want the node reserved for you only)

# mail alert at start, end and abortion of execution
#SBATCH --mail-type=ALL

# send mail to this address
#SBATCH --mail-user=edwinkost@gmail.com

#SBATCH -J grdc_gmd_val_1979-2015
## this is the job name

module load 2021
module load R/4.1.0-foss-2021a

. /home/edwin/load_all_default.sh


python_script_file_used="0_main_analyze_discharge_flexible_aqueduct-2021.py"

pcrglobwb_output_folder="/scratch-shared/edwin/discharge_gmd_paper/"

global_analysis_out_dir=${pcrglobwb_output_folder}"/validation_1979-2015_gmd_v20230518/"

discharge_file_name="discharge_monthAvg_output_1958-01-31_to_2015-12-31_zip.nc"

str_date=1979-01-31
end_date=2015-12-31

#~ str_date=1986-01-31
#~ end_date=1999-12-31

#~ str_date=1981-01-31
#~ end_date=1998-12-31

#~ /projects/0/dfguu/data/hydroworld/pcrglobwb2_input_release/version_2019_11_beta_extended/pcrglobwb2_input/global_05min/routing/ldd_and_cell_area
#~ edwin@tcn310.local.snellius.surf.nl:/projects/0/dfguu/data/hydroworld/pcrglobwb2_input_release/version_2019_11_beta_extended/pcrglobwb2_input/global_05min/routing/ldd_and_cell_area$ ls -lah *
#~ -rwxr-xr-x 1 hydrowld dfguu  36M Dec  5  2019 cellsize05min.correct.map
#~ -rw-r--r-- 1 hydrowld dfguu  36M Dec  5  2019 cellsize05min.correct.nc
#~ -rw-r--r-- 1 hydrowld dfguu  36M Dec  5  2019 cellsize05min_correct.nc
#~ -rw-r--r-- 1 hydrowld dfguu  129 Dec  5  2019 hydroworld_source.txt
#~ -rwxr-xr-x 1 hydrowld dfguu 8.9M Dec  5  2019 lddsound_05min.map
#~ -rw-r--r-- 1 hydrowld dfguu  36M Dec  5  2019 lddsound_05min.nc
#~ -rw-r--r-- 1 hydrowld dfguu  36M Dec  5  2019 lddsound_05min_unmask.nc

lddmap_file="/projects/0/dfguu/data/hydroworld/pcrglobwb2_input_release/version_2019_11_beta_extended/pcrglobwb2_input/global_05min/routing/ldd_and_cell_area/lddsound_05min.map"
globalclone="/projects/0/dfguu/data/hydroworld/pcrglobwb2_input_release/version_2019_11_beta_extended/pcrglobwb2_input/global_05min/routing/ldd_and_cell_area/lddsound_05min.map"
cellarea_m2="/projects/0/dfguu/data/hydroworld/pcrglobwb2_input_release/version_2019_11_beta_extended/pcrglobwb2_input/global_05min/routing/ldd_and_cell_area/cellsize05min.correct.map"

python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 01 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 02 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 03 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 04 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 05 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 06 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 07 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 08 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 09 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 10 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 11 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 12 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 13 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 14 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 15 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 16 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 17 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 18 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 19 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 20 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 21 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 22 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 23 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 24 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 25 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 26 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 27 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 28 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 29 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &
python3 $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir 30 $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} &

wait
