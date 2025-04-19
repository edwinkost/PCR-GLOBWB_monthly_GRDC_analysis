
source("summarize_functions.R")

cdf_kge_2lcs_orig = cdf_kge("/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation_final/2lcs_orig/validation_1981-2019/", 30)
cdf_kge_2lcs_sqrt = cdf_kge("/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation_final/2lcs_sqrt/validation_1981-2019/", 30)
cdf_kge_4lcs_orig = cdf_kge("/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation_final/4lcs_orig/validation_1981-2019/", 30)
cdf_kge_4lcs_sqrt = cdf_kge("/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation_final/4lcs_sqrt/validation_1981-2019/", 30)

cdf_kge_mhm       = cdf_kge("/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation_final/mhm/validation_1981-2019/", 30)

plot(cdf_kge_mhm, xlim = c(-1.0,1.0), ylim = c(0,1.0), col = "black", main = "", xlab = "KGE", ylab = "cdf")
lines(cdf_kge_4lcs_orig, col = "red",  lwd = 0.25, lty = 2)
lines(cdf_kge_2lcs_orig, col = "blue", lwd = 0.25, lty = 2)
lines(cdf_kge_4lcs_sqrt, col = "red",  lwd = 3.0)
lines(cdf_kge_2lcs_sqrt, col = "blue", lwd = 3.0)


