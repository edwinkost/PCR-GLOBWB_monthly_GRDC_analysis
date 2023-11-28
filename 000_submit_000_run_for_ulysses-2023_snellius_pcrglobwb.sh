
#~ sbatch -J reccf10p0 --export DISCHARGE_FILENAME="discharge_monthAvg_output_1981_2019_reccf10p0.nc",SUB_OUT_FOLDER="validation_reccf10p0" 000_run_for_ulysses-2023_snellius_pcrglobwb.sh
#~ sbatch -J reccf50p0 --export DISCHARGE_FILENAME="discharge_monthAvg_output_1981_2019_reccf50p0.nc",SUB_OUT_FOLDER="validation_reccf50p0" 000_run_for_ulysses-2023_snellius_pcrglobwb.sh
#~ sbatch -J reccf5p00 --export DISCHARGE_FILENAME="discharge_monthAvg_output_1981_2019_reccf5p00.nc",SUB_OUT_FOLDER="validation_reccf5p00" 000_run_for_ulysses-2023_snellius_pcrglobwb.sh
#~ sbatch -J reccfsqrt --export DISCHARGE_FILENAME="discharge_monthAvg_output_1981_2019_reccfsqrt.nc",SUB_OUT_FOLDER="validation_reccfsqrt" 000_run_for_ulysses-2023_snellius_pcrglobwb.sh

sbatch -J reccfsqrt --export DISCHARGE_FILENAME="discharge_monthAvg_output_1981_2019_reccf1p00.nc",SUB_OUT_FOLDER="validation_reccf1p00" 000_run_for_ulysses-2023_snellius_pcrglobwb.sh

#~ edwin@tcn1182.local.snellius.surf.nl:/scratch-shared/edwin/pcrglobwb_ulysses_recessionCoef_2023-11-22$ ls -lah
#~ total 46G
#~ drwxr-x--- 9 edwin edwin  16K Nov 27 18:34 .
#~ drwxr-xr-x 9 edwin edwin 4.0K Nov 27 10:58 ..
#~ -rw-r----- 1 edwin edwin 1.7K Nov 27 18:33 cdo_merging.sh
#~ -r--r----- 1 edwin edwin 9.1G Nov 27 12:43 discharge_monthAvg_output_1981_2019_reccf10p0.nc
#~ -r--r----- 1 edwin edwin 9.1G Nov 27 18:36 discharge_monthAvg_output_1981_2019_reccf1p00.nc
#~ -r--r----- 1 edwin edwin 9.1G Nov 27 12:43 discharge_monthAvg_output_1981_2019_reccf50p0.nc
#~ -r--r----- 1 edwin edwin 9.1G Nov 27 12:43 discharge_monthAvg_output_1981_2019_reccf5p00.nc
#~ -r--r----- 1 edwin edwin 9.1G Nov 27 12:43 discharge_monthAvg_output_1981_2019_reccfsqrt.nc


