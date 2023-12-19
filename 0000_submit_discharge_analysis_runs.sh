
#~ sutan101@node032.cluster:/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation$ ls -lah */*1995*.nc
#~ -rw-r--r-- 1 sutan101 depfg 3.4G Dec 19 12:29 check_orig_2lcs/discharge_monthAvg_output_pgb-orig-2lcs_1981-1995.nc
#~ -rw-r--r-- 1 sutan101 depfg 3.4G Dec 19 12:29 check_sqrt_2lcs/discharge_monthAvg_output_pgb-sqrt-2lcs_1981-1995.nc
#~ -rw-r--r-- 1 sutan101 depfg 3.4G Dec 19 12:28 mhm/discharge_monthAvg_output_mhm_1981-1995.nc

SLURM_JOB_FILE="0000_run_for_ulysses-2023_1981-1995.sh"

JOB_NAME="mhm_discharge_validation"
DISCHARGE_OUTPUT_FOLDER="/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation/mhm/"
DISCHARGE_FILENAME="discharge_monthAvg_output_mhm_1981-1995.nc"
ANALYSIS_OUTPUT_FOLDER=${DISCHARGE_OUTPUT_FOLDER}"/validation_1981-1995/"
sbatch -J ${JOB_NAME} --export DISCHARGE_OUTPUT_FOLDER=${DISCHARGE_OUTPUT_FOLDER},DISCHARGE_FILENAME=${DISCHARGE_FILENAME},ANALYSIS_OUTPUT_FOLDER=${ANALYSIS_OUTPUT_FOLDER} ${SLURM_JOB_FILE}

JOB_NAME="orig_2lcs_discharge_validation"
DISCHARGE_OUTPUT_FOLDER="/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation/check_orig_2lcs/"
DISCHARGE_FILENAME="discharge_monthAvg_output_orig_2lcs_1981-1995.nc"
ANALYSIS_OUTPUT_FOLDER=${DISCHARGE_OUTPUT_FOLDER}"/validation_1981-1995/"
sbatch -J ${JOB_NAME} --export DISCHARGE_OUTPUT_FOLDER=${DISCHARGE_OUTPUT_FOLDER},DISCHARGE_FILENAME=${DISCHARGE_FILENAME},ANALYSIS_OUTPUT_FOLDER=${ANALYSIS_OUTPUT_FOLDER} ${SLURM_JOB_FILE}

JOB_NAME="sqrt_2lcs_discharge_validation"
DISCHARGE_OUTPUT_FOLDER="/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation/check_sqrt_2lcs/"
DISCHARGE_FILENAME="discharge_monthAvg_output_sqrt_2lcs_1981-1995.nc"
ANALYSIS_OUTPUT_FOLDER=${DISCHARGE_OUTPUT_FOLDER}"/validation_1981-1995/"
sbatch -J ${JOB_NAME} --export DISCHARGE_OUTPUT_FOLDER=${DISCHARGE_OUTPUT_FOLDER},DISCHARGE_FILENAME=${DISCHARGE_FILENAME},ANALYSIS_OUTPUT_FOLDER=${ANALYSIS_OUTPUT_FOLDER} ${SLURM_JOB_FILE}
