
sbatch -J reccf10p0 --export DISCHARGE_FILENAME="discharge_monthAvg_output_1981_2019_reccf10p0.nc",SUB_OUT_FOLDER="validation_reccf10p0" 000_run_for_ulysses-2023_snellius_pcrglobwb.sh
sbatch -J reccf50p0 --export DISCHARGE_FILENAME="discharge_monthAvg_output_1981_2019_reccf50p0.nc",SUB_OUT_FOLDER="validation_reccf50p0" 000_run_for_ulysses-2023_snellius_pcrglobwb.sh
sbatch -J reccf5p00 --export DISCHARGE_FILENAME="discharge_monthAvg_output_1981_2019_reccf5p00.nc",SUB_OUT_FOLDER="validation_reccf5p00" 000_run_for_ulysses-2023_snellius_pcrglobwb.sh
sbatch -J reccfsqrt --export DISCHARGE_FILENAME="discharge_monthAvg_output_1981_2019_reccfsqrt.nc",SUB_OUT_FOLDER="validation_reccfsqrt" 000_run_for_ulysses-2023_snellius_pcrglobwb.sh

#~ (pcrglobwb_python3_2023-10-31) edwin@int5:/scratch-shared/edwin/pcrglobwb_ulysses_recessionCoef_2023-11-22$ ls -lah *.nc
#~ -rw-r----- 1 edwin edwin 9.1G Nov 27 12:43 discharge_monthAvg_output_1981_2019_reccf10p0.nc
#~ -rw-r----- 1 edwin edwin 9.1G Nov 27 12:43 discharge_monthAvg_output_1981_2019_reccf50p0.nc
#~ -rw-r----- 1 edwin edwin 9.1G Nov 27 12:43 discharge_monthAvg_output_1981_2019_reccf5p00.nc
#~ -rw-r----- 1 edwin edwin 9.1G Nov 27 12:43 discharge_monthAvg_output_1981_2019_reccfsqrt.nc


