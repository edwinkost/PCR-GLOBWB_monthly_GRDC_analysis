
SLURM_SCRIPT="_slurm_run_for_eejit_pcrglobwb.sh"

JOB_NAME="europe_5km_1990-2019_watersis_val"
PCRGLOBWB_OUTPUT_FOLDER="/scratch/depfg/sutan101/watersis_runs_may_2026/europe_5km_v20260528_DONE/netcdf/reproject_to_0.05arcdeg/"
DISCHARGE_FILENAME="discharge_monthAvg_output_remapnn_to_clone_eu_watersis_0p05arcdeg.nc"
ANALYSIS_OUTPUT_FOLDER=${PCRGLOBWB_OUTPUT_FOLDER}/"analysis_1990-2019/"
STR_DATE="1990-01-31"
END_DATE="2019-12-31"
LDD_FILE="None"
GLOBALCLONE="/scratch/depfg/sutan101/watersis_runs_may_2026/europe_5km_v20260528_DONE/netcdf/reproject_to_0.05arcdeg/ldd_catchment_area_KM2_remapnn_to_clone_eu_watersis_0p05arcdeg.map"
CELLAREA_M2="None"
CATCHMENT_AREA_KM2="/scratch/depfg/sutan101/watersis_runs_may_2026/europe_5km_v20260528_DONE/netcdf/reproject_to_0.05arcdeg/ldd_catchment_area_KM2_remapnn_to_clone_eu_watersis_0p05arcdeg.map"
GRDC_MAIN_FOLDER="/scratch/depfg/sutan101/data/grdc_data_monthly_requested_on_2023013/txt_splitted/"
sbatch -J ${JOB_NAME} --export PCRGLOBWB_OUTPUT_FOLDER=${PCRGLOBWB_OUTPUT_FOLDER},DISCHARGE_FILENAME=${DISCHARGE_FILENAME},ANALYSIS_OUTPUT_FOLDER=${ANALYSIS_OUTPUT_FOLDER},STR_DATE=${STR_DATE},END_DATE=${END_DATE},LDD_FILE=${LDD_FILE},GLOBALCLONE=${GLOBALCLONE},CELLAREA_M2=${CELLAREA_M2},GRDC_MAIN_FOLDER=${GRDC_MAIN_FOLDER},CATCHMENT_AREA_KM2=${CATCHMENT_AREA_KM2} ${SLURM_SCRIPT}

