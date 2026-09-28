
source("summarize_per_run.R")

grdc_wmo_file <- "/home/edwin/gits/github/edwinkost/PCR-GLOBWB_monthly_GRDC_analysis/grdc_station_catal/grdc_stations/grdc_wmo_regions.csv"
grdc_wmo = read.table(grdc_wmo_file, header = T, sep =",")


emearth   <- get_performance_table("/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_rerun_on_202609/emearth/emearth_pgb_uly_rerun_two_lcs_sqrt/analysis/grdc_analysis_1981-2019/", 30)
era5land  <- get_performance_table("/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_rerun_on_202609/era5land/era5land_pgb_uly_rerun_two_lcs_sqrt/analysis/grdc_analysis_1981-2019/", 30)
mswep     <- get_performance_table("/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_rerun_on_202609/mswep/mswep_pgb_uly_rerun_two_lcs_sqrt/analysis/grdc_analysis_1981-2019_DONE/", 30)
w5e5      <- get_performance_table("/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_rerun_on_202609/w5e5/w5e5_pgb_uly_rerun_two_lcs_sqrt/analysis/grdc_analysis_1981-2019/", 30)


ehsan_tb_file <- "/home/edwin/gits/github/edwinkost/PCR-GLOBWB_monthly_GRDC_analysis/ulysses_stations/gauge_info_selected_1445.csv"
ehsan_tb = read.table(ehsan_tb_file, header = T, sep =",")

emearth_sel = emearth[which(emearth$id_from_grdc %in% ehsan_tb$grdc_id), ]
plot(ecdf(emearth_sel$kge_2009), xlim = c(-1.0,1.0))

era5land_sel = era5land[which(era5land$id_from_grdc %in% ehsan_tb$grdc_id), ]
plot(ecdf(era5land_sel$kge_2009), xlim = c(-1.0,1.0))

mswep_sel = mswep[which(mswep$id_from_grdc %in% ehsan_tb$grdc_id), ]
plot(ecdf(mswep_sel$kge_2009), xlim = c(-1.0,1.0))

w5e5_sel = w5e5[which(w5e5$id_from_grdc %in% ehsan_tb$grdc_id), ]
plot(ecdf(w5e5_sel$kge_2009), xlim = c(-1.0,1.0))


# write table: grdc_id, kge_emearth, kge_era5land, kge_mswep, kge_w5e5, wmo_region
kge_table_from_all_runs = emearth_sel
names(kge_table_from_all_runs)[2] <- "kge_emearth"
kge_table_from_all_runs = merge(kge_table_from_all_runs, era5land_sel, by = "id_from_grdc")
names(kge_table_from_all_runs)[3] <- "kge_era5land"
kge_table_from_all_runs = merge(kge_table_from_all_runs, mswep_sel, by = "id_from_grdc")
names(kge_table_from_all_runs)[4] <- "kge_mswep"
kge_table_from_all_runs = merge(kge_table_from_all_runs, w5e5_sel, by = "id_from_grdc")
names(kge_table_from_all_runs)[5] <- "kge_w5e5"
# - wmo region
wmo_region = grdc_wmo
names(wmo_region)[1] <- "id_from_grdc"
kge_table_from_all_runs = merge(kge_table_from_all_runs, wmo_region, by = "id_from_grdc")
# - write to a file
write.table(kge_table_from_all_runs, file = "kge_pcrglobwb_ulysses_202312_rerun_on_202609_two_lcs_sqrt.csv", sep = ";", row.names = FALSE, quote = "")


# test plot
table = read.table("kge_pcrglobwb_ulysses_202312_rerun_on_202609_two_lcs_sqrt.csv", sep = ";", header = TRUE)
wmo_chosen = 4
length(table$wmo_reg[which(table$wmo_reg == wmo_chosen)])
plot(ecdf(table$kge_emearth[which(table$wmo_reg == wmo_chosen)]), xlim = c(-0.4,1.0), ylim = c(0,1), col = "black")
median(table$kge_emearth[which(table$wmo_reg == wmo_chosen)], na.rm = TRUE)
lines(ecdf(table$kge_era5land[which(table$wmo_reg == wmo_chosen)]), col = "red")
median(table$kge_era5land[which(table$wmo_reg == wmo_chosen)], na.rm = TRUE)
lines(ecdf(table$kge_mswep[which(table$wmo_reg == wmo_chosen)]), col = "green")
median(table$kge_mswep[which(table$wmo_reg == wmo_chosen)], na.rm = TRUE)
lines(ecdf(table$kge_w5e5[which(table$wmo_reg == wmo_chosen)]), col = "blue")
median(table$kge_w5e5[which(table$wmo_reg == wmo_chosen)], na.rm = TRUE)


#~ # australia
#~ grdc_wmo_australia = grdc_wmo[which(grdc_wmo$wmo_reg == 5), ]

#~ # - era5land
#~ era5land_sel_australia = era5land_sel[which(era5land_sel$id_from_grdc %in% grdc_wmo_australia$grdc_no), ]
#~ plot(ecdf(era5land_sel_australia$kge_2009), xlim = c(-1.0,1.0))
#~ plot(ecdf(era5land_sel_australia$kge_2009), xlim = c(-0.4,1.0))
#~ median(era5land_sel_australia$kge_2009, na.rm = TRUE)

#~ # - emearth
#~ emearth_sel_australia = emearth_sel[which(emearth_sel$id_from_grdc %in% grdc_wmo_australia$grdc_no), ]
#~ plot(ecdf(emearth_sel_australia$kge_2009), xlim = c(-1.0,1.0))
#~ plot(ecdf(emearth_sel_australia$kge_2009), xlim = c(-0.4,1.0))
#~ median(emearth_sel_australia$kge_2009, na.rm = TRUE)

#~ # - mswep
#~ mswep_sel_australia = mswep_sel[which(mswep_sel$id_from_grdc %in% grdc_wmo_australia$grdc_no), ]
#~ plot(ecdf(mswep_sel_australia$kge_2009), xlim = c(-1.0,1.0))
#~ plot(ecdf(mswep_sel_australia$kge_2009), xlim = c(-0.4,1.0))
#~ median(mswep_sel_australia$kge_2009, na.rm = TRUE)

#~ # - w5e5
#~ w5e5_sel_australia = w5e5_sel[which(w5e5_sel$id_from_grdc %in% grdc_wmo_australia$grdc_no), ]
#~ plot(ecdf(w5e5_sel_australia$kge_2009), xlim = c(-1.0,1.0))
#~ plot(ecdf(w5e5_sel_australia$kge_2009), xlim = c(-0.4,1.0))
#~ median(w5e5_sel_australia$kge_2009, na.rm = TRUE)


#~ # europe
#~ grdc_wmo_europe = gdrc_wmo[which(grdc_wmo$wmo_reg == 6), ]
#~ mswep_sel_europe = mswep_sel[which(mswep_sel$id_from_grdc %in% grdc_wmo_europe$grdc_no), ]
#~ plot(ecdf(mswep_sel_europe$kge_2009), xlim = c(-1.0,1.0))
#~ median(mswep_sel_europe$kge_2009, na.rm = TRUE)

#~ # africa
#~ grdc_wmo_africa = gdrc_wmo[which(grdc_wmo$wmo_reg == 1), ]
#~ mswep_sel_africa = mswep_sel[which(mswep_sel$id_from_grdc %in% grdc_wmo_africa$grdc_no), ]
#~ plot(ecdf(mswep_sel_africa$kge_2009), xlim = c(-1.0,1.0))
#~ median(mswep_sel_africa$kge_2009, na.rm = TRUE)

#~ # asia
#~ grdc_wmo_asia = gdrc_wmo[which(grdc_wmo$wmo_reg == 2), ]
#~ mswep_sel_asia = mswep_sel[which(mswep_sel$id_from_grdc %in% grdc_wmo_asia$grdc_no), ]
#~ plot(ecdf(mswep_sel_asia$kge_2009), xlim = c(-1.0,1.0))
#~ median(mswep_sel_asia$kge_2009, na.rm = TRUE)

#~ # south_america
#~ grdc_wmo_south_america = gdrc_wmo[which(grdc_wmo$wmo_reg == 3), ]
#~ mswep_sel_south_america = mswep_sel[which(mswep_sel$id_from_grdc %in% grdc_wmo_south_america$grdc_no), ]
#~ plot(ecdf(mswep_sel_south_america$kge_2009), xlim = c(-1.0,1.0))
#~ median(mswep_sel_south_america$kge_2009, na.rm = TRUE)

#~ # australia - mswep
#~ grdc_wmo_australia = gdrc_wmo[which(grdc_wmo$wmo_reg == 5), ]
#~ mswep_sel_australia = mswep_sel[which(mswep_sel$id_from_grdc %in% grdc_wmo_australia$grdc_no), ]
#~ plot(ecdf(mswep_sel_australia$kge_2009), xlim = c(-1.0,1.0))
#~ median(mswep_sel_australia$kge_2009, na.rm = TRUE)

#~ # australia - emearth
#~ grdc_wmo_australia = gdrc_wmo[which(grdc_wmo$wmo_reg == 5), ]
#~ emearth_sel_australia = emearth_sel[which(emearth_sel$id_from_grdc %in% grdc_wmo_australia$grdc_no), ]
#~ plot(ecdf(emearth_sel_australia$kge_2009), xlim = c(-1.0,1.0))
#~ median(emearth_sel_australia$kge_2009, na.rm = TRUE)

#~ # other
#~ grdc_wmo_other = gdrc_wmo[which(grdc_wmo$wmo_reg == 1), ]
#~ mswep_sel_other = mswep_sel[which(mswep_sel$id_from_grdc %in% grdc_wmo_other$grdc_no), ]
#~ plot(ecdf(mswep_sel_other$kge_2009), xlim = c(-1.0,1.0))
