#!/bin/bash
#SBATCH -N 1
#SBATCH -t 59:00
#SBATCH -p normal

# mail alert at start, end and abortion of execution
#SBATCH --mail-type=ALL

# send mail to this address
#SBATCH --mail-user=edwinkost@gmail.com

python_script_file_used="0_main_analyze_discharge_flexible_06min.py"


#~ edwinhs@tcn674.bullx:/scratch-shared/edwinhs/pcrglobwb_aqueduct_2021_develop/test_with_bristow_campbell$ ls -lah *
#~ -r--r--r-- 1 edwinhs edwinhs 4.2G Apr  3 16:33 discharge_monthAvg_output.nc

pcrglobwb_output_folder="/scratch-shared/edwinhs/pcrglobwb_aqueduct_2021_develop/test_with_bristow_campbell/"

global_analysis_out_dir=${pcrglobwb_output_folder}"/monthly_discharge_evaluation/"

discharge_file_name="discharge_monthAvg_output.nc"

str_date=2001-01-31
end_date=2010-12-31

#~ str_date=1986-01-31
#~ end_date=1999-12-31

#~ str_date=1981-01-31
#~ end_date=1998-12-31


globalclone="/projects/0/dfguu/data/hydroworld/pcrglobwb2_input_release/version_2019_11_beta_extended/pcrglobwb2_input/global_05min/routing/ldd_and_cell_area/lddsound_05min.map"
lddmap_file="/projects/0/dfguu/data/hydroworld/pcrglobwb2_input_release/version_2019_11_beta_extended/pcrglobwb2_input/global_05min/routing/ldd_and_cell_area/lddsound_05min.map"
cellarea_m2="/projects/0/dfguu/data/hydroworld/pcrglobwb2_input_release/version_2019_11_beta_extended/pcrglobwb2_input/global_05min/routing/ldd_and_cell_area/cellsize05min.correct.map"

#~ edwinhs@int1.bullx:/projects/0/dfguu/data/hydroworld/pcrglobwb2_input_release/version_2019_11_beta_extended/pcrglobwb2_input/global_05min/routing/ldd_and_cell_area$ ls -lah *
#~ -rwxr-xr-x 1 hydrowld dfguu  36M Dec  5  2019 cellsize05min.correct.map
#~ -rw-r--r-- 1 hydrowld dfguu  36M Dec  5  2019 cellsize05min.correct.nc
#~ -rw-r--r-- 1 hydrowld dfguu  36M Dec  5  2019 cellsize05min_correct.nc
#~ -rw-r--r-- 1 hydrowld dfguu  129 Dec  5  2019 hydroworld_source.txt
#~ -rwxr-xr-x 1 hydrowld dfguu 8.9M Dec  5  2019 lddsound_05min.map
#~ -rw-r--r-- 1 hydrowld dfguu  36M Dec  5  2019 lddsound_05min.nc
#~ -rw-r--r-- 1 hydrowld dfguu  36M Dec  5  2019 lddsound_05min_unmask.nc

python $python_script_file_used $pcrglobwb_output_folder $global_analysis_out_dir selected_for_uly $str_date $end_date $discharge_file_name discharge ${globalclone} ${lddmap_file} ${cellarea_m2} 

