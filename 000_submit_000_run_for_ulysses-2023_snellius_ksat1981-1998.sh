
sbatch -J grdc_0.50 --export DISCHARGE_FILENAME="discharge_monthAvg_output_1981-1998_ksat0.50.nc",SUB_OUT_FOLDER="validation_ksat0.50" 000_run_for_ulysses-2023_snellius_ksat1981-1998.sh 
sbatch -J grdc_0.75 --export DISCHARGE_FILENAME="discharge_monthAvg_output_1981-1998_ksat0.75.nc",SUB_OUT_FOLDER="validation_ksat0.75" 000_run_for_ulysses-2023_snellius_ksat1981-1998.sh 
sbatch -J grdc_1.00 --export DISCHARGE_FILENAME="discharge_monthAvg_output_1981-1998_ksat1.00.nc",SUB_OUT_FOLDER="validation_ksat1.00" 000_run_for_ulysses-2023_snellius_ksat1981-1998.sh 

