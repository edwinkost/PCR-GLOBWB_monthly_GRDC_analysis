
SLURM_SCRIPT="_slurm_run_for_snellius_pcrglobwb.sh"

# validating WMO RUN 2024
JOB_NAME="val_wmo"
DISCHARGE_FILENAME="/scratch-shared/edwin/pcrglobwb_wmo_run/v20250417/global/netcdf/merged//discharge_monthAvg_output_1981-2024.nc"
ANALYSIS_OUTPUT_FOLDER="/scratch-shared/edwindan/pcrglobwb_wmo_run_validation/wmo_run/validation_1981-2019/"
sbatch -J ${JOB_NAME} --export DISCHARGE_FILENAME=${DISCHARGE_FILENAME},ANALYSIS_OUTPUT_FOLDER=${ANALYSIS_OUTPUT_FOLDER} ${SLURM_SCRIPT}

# validating AQUEDUCT (as the benchmark)
JOB_NAME="val_aquedut"
DISCHARGE_FILENAME="/projects/0/managed_datasets/hypflowsci6_v1.0/output/gswp3-w5e5/historical-reference/pcrglobwb_cmip6-isimip3-gswp3-w5e5_image-aqueduct_historical-reference_discharge_global_monthly-average_1960_2019_basetier1.nc"
ANALYSIS_OUTPUT_FOLDER="/scratch-shared/edwindan/pcrglobwb_wmo_run_validation/benchmark_pgb_aqueduct/validation_1981-2019/"
sbatch -J ${JOB_NAME} --export DISCHARGE_FILENAME=${DISCHARGE_FILENAME},ANALYSIS_OUTPUT_FOLDER=${ANALYSIS_OUTPUT_FOLDER} ${SLURM_SCRIPT}


