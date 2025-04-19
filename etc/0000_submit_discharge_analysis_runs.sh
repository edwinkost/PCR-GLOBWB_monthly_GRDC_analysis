
#~ edwin@srv9.local.snellius.surf.nl:/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation_final_final$ ls -lah */*.nc
#~ -r--r----- 1 edwin edwin 9.1G Dec 31 00:15 2lcs_orig/discharge_monthAvg_output_1981-2019_2lcs_orig.nc
#~ -r--r----- 1 edwin edwin 9.1G Dec 31 00:23 2lcs_sqrt/discharge_monthAvg_output_1981-2019_2lcs_sqrt.nc
#~ -r--r----- 1 edwin edwin 9.1G Dec 30 17:12 4lcs_orig/discharge_monthAvg_output_1981-2019_4lcs_orig.nc
#~ -r--r----- 1 edwin edwin 9.1G Dec 30 17:11 4lcs_sqrt/discharge_monthAvg_output_1981-2019_4lcs_sqrt.nc
#~ lrwxrwxrwx 1 edwin edwin  115 Dec 31 00:23 mhm/monthly_average_q_mhm_mrm_era5land_1981-2019_fix-time_fix-var-name_fix-reftime.nc

SLURM_JOB_FILE="0000_run_for_ulysses-2023_1981-2019.sh"

JOB_NAME="2lcs_orig_discharge_validation"
DISCHARGE_OUTPUT_FOLDER="/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation_final/2lcs_orig/"
DISCHARGE_FILENAME="discharge_monthAvg_output_1981-2019_2lcs_orig.nc"
ANALYSIS_OUTPUT_FOLDER=${DISCHARGE_OUTPUT_FOLDER}"/validation_1981-2019/"
sbatch -J ${JOB_NAME} --export DISCHARGE_OUTPUT_FOLDER=${DISCHARGE_OUTPUT_FOLDER},DISCHARGE_FILENAME=${DISCHARGE_FILENAME},ANALYSIS_OUTPUT_FOLDER=${ANALYSIS_OUTPUT_FOLDER} ${SLURM_JOB_FILE}

JOB_NAME="2lcs_sqrt_discharge_validation"
DISCHARGE_OUTPUT_FOLDER="/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation_final/2lcs_sqrt/"
DISCHARGE_FILENAME="discharge_monthAvg_output_1981-2019_2lcs_sqrt.nc"
ANALYSIS_OUTPUT_FOLDER=${DISCHARGE_OUTPUT_FOLDER}"/validation_1981-2019/"
sbatch -J ${JOB_NAME} --export DISCHARGE_OUTPUT_FOLDER=${DISCHARGE_OUTPUT_FOLDER},DISCHARGE_FILENAME=${DISCHARGE_FILENAME},ANALYSIS_OUTPUT_FOLDER=${ANALYSIS_OUTPUT_FOLDER} ${SLURM_JOB_FILE}

JOB_NAME="4lcs_orig_discharge_validation"
DISCHARGE_OUTPUT_FOLDER="/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation_final/4lcs_orig/"
DISCHARGE_FILENAME="discharge_monthAvg_output_1981-2019_4lcs_orig.nc"
ANALYSIS_OUTPUT_FOLDER=${DISCHARGE_OUTPUT_FOLDER}"/validation_1981-2019/"
sbatch -J ${JOB_NAME} --export DISCHARGE_OUTPUT_FOLDER=${DISCHARGE_OUTPUT_FOLDER},DISCHARGE_FILENAME=${DISCHARGE_FILENAME},ANALYSIS_OUTPUT_FOLDER=${ANALYSIS_OUTPUT_FOLDER} ${SLURM_JOB_FILE}

JOB_NAME="4lcs_sqrt_discharge_validation"
DISCHARGE_OUTPUT_FOLDER="/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation_final/4lcs_sqrt/"
DISCHARGE_FILENAME="discharge_monthAvg_output_1981-2019_4lcs_sqrt.nc"
ANALYSIS_OUTPUT_FOLDER=${DISCHARGE_OUTPUT_FOLDER}"/validation_1981-2019/"
sbatch -J ${JOB_NAME} --export DISCHARGE_OUTPUT_FOLDER=${DISCHARGE_OUTPUT_FOLDER},DISCHARGE_FILENAME=${DISCHARGE_FILENAME},ANALYSIS_OUTPUT_FOLDER=${ANALYSIS_OUTPUT_FOLDER} ${SLURM_JOB_FILE}

JOB_NAME="mhm_discharge_validation"
DISCHARGE_OUTPUT_FOLDER="/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation_final/mhm/"
DISCHARGE_FILENAME="monthly_average_q_mhm_mrm_era5land_1981-2019_fix-time_fix-var-name_fix-reftime.nc"
ANALYSIS_OUTPUT_FOLDER=${DISCHARGE_OUTPUT_FOLDER}"/validation_1981-2019/"
sbatch -J ${JOB_NAME} --export DISCHARGE_OUTPUT_FOLDER=${DISCHARGE_OUTPUT_FOLDER},DISCHARGE_FILENAME=${DISCHARGE_FILENAME},ANALYSIS_OUTPUT_FOLDER=${ANALYSIS_OUTPUT_FOLDER} ${SLURM_JOB_FILE}

