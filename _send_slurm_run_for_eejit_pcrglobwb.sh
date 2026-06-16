
SLURM_SCRIPT="_slurm_run_for_eejit_pcrglobwb.sh"

JOB_NAME="gl6min_1981-2019_watersis_val"
PCRGLOBWB_OUTPUT_FOLDER="/scratch/depfg/sutan101/watersis_runs_may_2026/global_6min_with_watersis_forcing_with_parallel_v20260604/pgb_6min/begin_from_1970/global/netcdf/merged/"
DISCHARGE_FILENAME="discharge_monthAvg_output_1970-2019_global6min_v20260604.nc"
ANALYSIS_OUTPUT_FOLDER=${PCRGLOBWB_OUTPUT_FOLDER}/"analysis_1981-2019/"
STR_DATE="1981-01-01"
END_DATE="2019-12-31"
LDD_FILE="/scratch/depfg/sutan101_new/pcrglobwb_input_watersis/develop/global_6min/lddsound_06min_version_202007XX_for_ulysses.map"
GLOBALCLONE="/scratch/depfg/sutan101_new/pcrglobwb_input_watersis/develop/global_6min/lddsound_06min_version_202007XX_for_ulysses.map"
CELLAREA_M2="/scratch/depfg/sutan101_new/pcrglobwb_input_watersis/develop/global_6min/cellarea.map"
GRDC_MAIN_FOLDER="/scratch/depfg/sutan101/data/grdc_data_monthly_requested_on_2023013/txt_splitted/"
sbatch -J ${JOB_NAME} --export PCRGLOBWB_OUTPUT_FOLDER=${PCRGLOBWB_OUTPUT_FOLDER},DISCHARGE_FILENAME=${DISCHARGE_FILENAME},ANALYSIS_OUTPUT_FOLDER=${ANALYSIS_OUTPUT_FOLDER},STR_DATE=${STR_DATE},END_DATE=${END_DATE},LDD_FILE=${LDD_FILE},GLOBALCLONE=${GLOBALCLONE},CELLAREA_M2=${CELLAREA_M2},GRDC_MAIN_FOLDER=${GRDC_MAIN_FOLDER} ${SLURM_SCRIPT}

JOB_NAME="gl6min_1981-2015_watersis_val"
PCRGLOBWB_OUTPUT_FOLDER="/scratch/depfg/sutan101/watersis_runs_may_2026/global_6min_with_watersis_forcing_with_parallel_v20260604/pgb_6min/begin_from_1970/global/netcdf/merged/"
DISCHARGE_FILENAME="discharge_monthAvg_output_1970-2019_global6min_v20260604.nc"
ANALYSIS_OUTPUT_FOLDER=${PCRGLOBWB_OUTPUT_FOLDER}/"analysis_1981-2015/"
STR_DATE="1981-01-01"
END_DATE="2015-12-31"
LDD_FILE="/scratch/depfg/sutan101_new/pcrglobwb_input_watersis/develop/global_6min/lddsound_06min_version_202007XX_for_ulysses.map"
GLOBALCLONE="/scratch/depfg/sutan101_new/pcrglobwb_input_watersis/develop/global_6min/lddsound_06min_version_202007XX_for_ulysses.map"
CELLAREA_M2="/scratch/depfg/sutan101_new/pcrglobwb_input_watersis/develop/global_6min/cellarea.map"
GRDC_MAIN_FOLDER="/scratch/depfg/sutan101/data/grdc_data_monthly_requested_on_2023013/txt_splitted/"
sbatch -J ${JOB_NAME} --export PCRGLOBWB_OUTPUT_FOLDER=${PCRGLOBWB_OUTPUT_FOLDER},DISCHARGE_FILENAME=${DISCHARGE_FILENAME},ANALYSIS_OUTPUT_FOLDER=${ANALYSIS_OUTPUT_FOLDER},STR_DATE=${STR_DATE},END_DATE=${END_DATE},LDD_FILE=${LDD_FILE},GLOBALCLONE=${GLOBALCLONE},CELLAREA_M2=${CELLAREA_M2},GRDC_MAIN_FOLDER=${GRDC_MAIN_FOLDER} ${SLURM_SCRIPT}

#~ # validating AQUEDUCT (as the benchmark)
#~ JOB_NAME="val_aquedut"
#~ PCRGLOBWB_OUTPUT_FOLDER="/projects/0/managed_datasets/hypflowsci6_v1.0/output/gswp3-w5e5/historical-reference/"
#~ DISCHARGE_FILENAME="pcrglobwb_cmip6-isimip3-gswp3-w5e5_image-aqueduct_historical-reference_discharge_global_monthly-average_1960_2019_basetier1.nc"
#~ ANALYSIS_OUTPUT_FOLDER="/scratch-shared/edwindan/pcrglobwb_wmo_run_validation/benchmark_pgb_aqueduct/validation_1981-2019/"
#~ sbatch -J ${JOB_NAME} --export PCRGLOBWB_OUTPUT_FOLDER=${PCRGLOBWB_OUTPUT_FOLDER},DISCHARGE_FILENAME=${DISCHARGE_FILENAME},ANALYSIS_OUTPUT_FOLDER=${ANALYSIS_OUTPUT_FOLDER} ${SLURM_SCRIPT}


