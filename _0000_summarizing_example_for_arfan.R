
# Note: To execute this script, please activae your R modules, e.g. ". /home/edwin/load_R.sh"
# - then you have to go to the folder where this script is located, e.g. /home/edwindql/github/edwinkost/PCR-GLOBWB_monthly_GRDC_analysis)
# - then you have to run it using R terminal/prompt

source("summarize_functions.R")

#~ # get kge values (input: folder with grdc analysis, number of sub folders)
#~ cdf_example = cdf_kge("/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation_final/2lcs_sqrt/validation_1981-2019/", "30")

# load cdf from various runs
cdf_kge_2lcs_orig = cdf_kge("/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation_final/2lcs_orig/validation_1981-2019/", 30)
cdf_kge_2lcs_sqrt = cdf_kge("/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation_final/2lcs_sqrt/validation_1981-2019/", 30)
cdf_kge_4lcs_orig = cdf_kge("/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation_final/4lcs_orig/validation_1981-2019/", 30)
cdf_kge_4lcs_sqrt = cdf_kge("/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation_final/4lcs_sqrt/validation_1981-2019/", 30)
cdf_kge_mhm       = cdf_kge("/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation_final/mhm/validation_1981-2019/", 30)

# plot all cdfs
plot(cdf_kge_mhm, xlim = c(-1.0,1.0), ylim = c(0,1.0), col = "black", main = "", xlab = "KGE", ylab = "cdf")
lines(cdf_kge_4lcs_orig, col = "red",  lwd = 0.25, lty = 2)
lines(cdf_kge_2lcs_orig, col = "blue", lwd = 0.25, lty = 2)
lines(cdf_kge_4lcs_sqrt, col = "red",  lwd = 3.0)
lines(cdf_kge_2lcs_sqrt, col = "blue", lwd = 3.0)
