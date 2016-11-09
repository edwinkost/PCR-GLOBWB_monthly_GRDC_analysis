#!/bin/bash
#SBATCH -N 1
#SBATCH -t 23:59:00 
#SBATCH -p normal

python 0_main_analyze_discharge_flexible.py /scratch-shared/rens/kinematicwave_nonnatural_spinup_watch/netcdf/ /scratch-shared/edwinhs/rens_monthly_discharge_analysis/ 01 &
python 0_main_analyze_discharge_flexible.py /scratch-shared/rens/kinematicwave_nonnatural_spinup_watch/netcdf/ /scratch-shared/edwinhs/rens_monthly_discharge_analysis/ 02 &
python 0_main_analyze_discharge_flexible.py /scratch-shared/rens/kinematicwave_nonnatural_spinup_watch/netcdf/ /scratch-shared/edwinhs/rens_monthly_discharge_analysis/ 03 &
python 0_main_analyze_discharge_flexible.py /scratch-shared/rens/kinematicwave_nonnatural_spinup_watch/netcdf/ /scratch-shared/edwinhs/rens_monthly_discharge_analysis/ 04 &
python 0_main_analyze_discharge_flexible.py /scratch-shared/rens/kinematicwave_nonnatural_spinup_watch/netcdf/ /scratch-shared/edwinhs/rens_monthly_discharge_analysis/ 05 &
python 0_main_analyze_discharge_flexible.py /scratch-shared/rens/kinematicwave_nonnatural_spinup_watch/netcdf/ /scratch-shared/edwinhs/rens_monthly_discharge_analysis/ 06 &
python 0_main_analyze_discharge_flexible.py /scratch-shared/rens/kinematicwave_nonnatural_spinup_watch/netcdf/ /scratch-shared/edwinhs/rens_monthly_discharge_analysis/ 07 &
python 0_main_analyze_discharge_flexible.py /scratch-shared/rens/kinematicwave_nonnatural_spinup_watch/netcdf/ /scratch-shared/edwinhs/rens_monthly_discharge_analysis/ 08 &
python 0_main_analyze_discharge_flexible.py /scratch-shared/rens/kinematicwave_nonnatural_spinup_watch/netcdf/ /scratch-shared/edwinhs/rens_monthly_discharge_analysis/ 09 &
wait
python 0_main_analyze_discharge_flexible.py /scratch-shared/rens/kinematicwave_nonnatural_spinup_watch/netcdf/ /scratch-shared/edwinhs/rens_monthly_discharge_analysis/ 10 &
python 0_main_analyze_discharge_flexible.py /scratch-shared/rens/kinematicwave_nonnatural_spinup_watch/netcdf/ /scratch-shared/edwinhs/rens_monthly_discharge_analysis/ 11 &
python 0_main_analyze_discharge_flexible.py /scratch-shared/rens/kinematicwave_nonnatural_spinup_watch/netcdf/ /scratch-shared/edwinhs/rens_monthly_discharge_analysis/ 12 &
python 0_main_analyze_discharge_flexible.py /scratch-shared/rens/kinematicwave_nonnatural_spinup_watch/netcdf/ /scratch-shared/edwinhs/rens_monthly_discharge_analysis/ 13 &
python 0_main_analyze_discharge_flexible.py /scratch-shared/rens/kinematicwave_nonnatural_spinup_watch/netcdf/ /scratch-shared/edwinhs/rens_monthly_discharge_analysis/ 14 &
python 0_main_analyze_discharge_flexible.py /scratch-shared/rens/kinematicwave_nonnatural_spinup_watch/netcdf/ /scratch-shared/edwinhs/rens_monthly_discharge_analysis/ 15 &
python 0_main_analyze_discharge_flexible.py /scratch-shared/rens/kinematicwave_nonnatural_spinup_watch/netcdf/ /scratch-shared/edwinhs/rens_monthly_discharge_analysis/ 16 &
python 0_main_analyze_discharge_flexible.py /scratch-shared/rens/kinematicwave_nonnatural_spinup_watch/netcdf/ /scratch-shared/edwinhs/rens_monthly_discharge_analysis/ 17 &
python 0_main_analyze_discharge_flexible.py /scratch-shared/rens/kinematicwave_nonnatural_spinup_watch/netcdf/ /scratch-shared/edwinhs/rens_monthly_discharge_analysis/ 18 &
wait
