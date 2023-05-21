
# packages needed and clear all available existing objects:
require('ggplot2');require('RColorBrewer');require(scales)
rm(list=ls()); # ls()

# read data
performance_table = read.table("/scratch-shared/edwin/discharge_aqueduct_2021/validation_1979-2019_final_v20230518/summary_all.txt", header = T, sep = ";")
# - complete/original table 
performance_table_complete = performance_table 

# using only some stations
performance_table = performance_table_complete

# - only the data with reasonable number of pairs 
performance_table = performance_table[which(performance_table$num_of_month_pairs >= 60), ]
# - only grdc catchment area > 10 km2
performance_table = performance_table[which(performance_table$grdc_catchment_area_in_km2  >= 10),]
#~ # - only model catchment area > 10 km2
#~ performance_table = performance_table[which(performance_table$model_catchment_area_in_km2 >= 10),]
# - only if ratio between the model and grdc catchment areas < 1.25
ratio                          =  performance_table$model_catchment_area_in_km2/performance_table$grdc_catchment_area_in_km2
ratio[which(ratio < ratio^-1)] = (ratio[which(ratio < ratio^-1)])^-1
performance_table = performance_table[which(ratio < 1.25), ]
length(performance_table$kge_2009)

# - only if average discharge > 0.0
performance_table = performance_table[which(performance_table$average_observation > 0.0), ]
#~ performance_table = performance_table[which(performance_table$average_model > 0.0), ]
#~ # - only if ratio discharge is reasonable
#~ ratio                          =  performance_table$average_model/performance_table$average_observation
#~ ratio[which(ratio < ratio^-1)] = (ratio[which(ratio < ratio^-1)])^-1
#~ length(performance_table$kge_2009)
#~ performance_table = performance_table[which(ratio < 10.0), ]
#~ length(performance_table$kge_2009)

# - calculate runoff
grdc_runoff_in_mm_per_year = performance_table$average_observation * 10^3 * 365.25 / (performance_table$model_catchment_area_in_km2 * 10^6 * (1/(24.*3600.)))

# 
performance_table  = cbind(performance_table, grdc_runoff_in_mm_per_year) 

# sort data
#~ performance_table = performance_table[order(-performance_table$grdc_catchment_area_in_km2, performance_table$kge_2009), ]
#~ performance_table = performance_table[order(performance_table$kge_2009, -performance_table$grdc_catchment_area_in_km2)]
#~ performance_table = performance_table[order(performance_table$kge_2009), ]
#~ performance_table = performance_table[order(-performance_table$kge_2009, -performance_table$grdc_catchment_area_in_km2)]

#~ performance_table = performance_table[order(-performance_table$grdc_catchment_area_in_km2, performance_table$kge_2009), ]

performance_table    = performance_table[order(-performance_table$grdc_catchment_area_in_km2, -performance_table$grdc_runoff_in_mm_per_year, performance_table$kge_2009), ]


#~ myPalette <- colorRampPalette((brewer.pal(9, "RdYlBu")))
#~ sc <- scale_fill_gradientn(colours = myPalette(100), limits=c(0,100), 
#~                            breaks=c(0,50,100), name='Available data (%)')

#~ myPalette <- colorRampPalette((brewer.pal(9, "RdYlBu")))
#~ sc <- scale_fill_gradientn(colours = myPalette(100), limits=c(-1,1), breaks = seq(-1.0,1.0,0.1), name='KGE')

#~ sc_fill   <- scale_fill_gradientn(colours=brewer.pal(11, "RdBu")  , limits=c(-1.8,1), breaks = seq(-1.8,1.0,0.4), name='KGE')

#~ sc_colour <- scale_colour_gradientn(colours=brewer.pal(11, "RdBu"), limits=c(-1.8,1), breaks = seq(-1.8,1.0,0.4), name='KGE')

#~ performance_used  = performance_table$correlation
#~ performance_table  = cbind(performance_table, performance_used) 
#~ performance_label = "correlation"

performance_used  = performance_table$kge_2009
performance_table  = cbind(performance_table, performance_used) 
performance_label = "KGE"

#~ sc_fill <- scale_fill_gradient2(
#~   low = muted("red"),
#~   mid = "white",
#~   high = muted("blue"),
#~   midpoint = -0.41,
#~   space = "Lab",
#~   na.value = "grey50",
#~   guide = "colourbar",
#~   aesthetics = "fill",
#~   limits = c(-2.0,1),
#~   name=performance_label,
#~ )

sc_fill <- scale_fill_gradient2(
  low = "red",
  mid = "white",
  high = "blue",
  midpoint = -0.41,
#~   midpoint = 0.0,
  space = "Lab",
  na.value = "grey50",
  guide = "colourbar",
  aesthetics = "fill",
  limits = c(-2.0,1),
#~   limits = c(-0.5,1),
  name=performance_label,
)

sc_colour <- scale_colour_gradient2(
  low = "red",
  mid = "white",
  high = "blue",
  midpoint = -0.41,
#~   midpoint = 0.0,
  space = "Lab",
  na.value = "grey50",
  guide = "colourbar",
  aesthetics = "colour",
  limits = c(-2.0,1),
#~   limits = c(-0.5,1),
  name=performance_label
)


wg <- map_data("world")



table_for_world_map <- performance_table
table_for_world_map$performance_used[which(table_for_world_map$performance_used < -1.8)] = -1.8



#~ theme_map <- theme(
#~     panel.background = element_rect(fill='transparent'), #transparent panel bg
#~     plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
#~     panel.grid.major = element_blank(), #remove major gridlines
#~     panel.grid.minor = element_blank(), #remove minor gridlines
#~     legend.background = element_rect(fill='transparent'), #transparent legend bg
#~     legend.box.background = element_rect(fill='transparent') #transparent legend panel
#~   )
.


world_map <- ggplot() +
  geom_map(
    data = wg, map = wg,
    aes(long, lat, map_id = region),
    color = "grey50", fill= "grey"
  ) +
#~   theme_map()+

#~   theme(
#~     panel.background = element_rect(fill='transparent'), #transparent panel bg
#~     plot.background = element_rect(fill='transparent', color=NA), #transparent plot bg
#~     panel.grid.major = element_blank(), #remove major gridlines
#~     panel.grid.minor = element_blank(), #remove minor gridlines
#~     legend.background = element_rect(fill='transparent'), #transparent legend bg
#~     legend.box.background = element_rect(fill='transparent') #transparent legend panel
#~   ) +

  xlim(-180,180)+
  ylim(-55,75)+

#~   geom_point(table_for_world_map, mapping = aes(x = grdc_longitude_in_arc_degree, y = grdc_latitude_in_arc_degree,  fill = kge_2009, colour = kge_2009, size = grdc_catchment_area_in_km2), pch = 21) +
#~   geom_point(table_for_world_map, mapping = aes(x = grdc_longitude_in_arc_degree, y = grdc_latitude_in_arc_degree,  fill = kge_2009, colour = kge_2009, size = grdc_runoff_in_mm_per_year), pch = 21) +

  geom_point(table_for_world_map, mapping = aes(x = grdc_longitude_in_arc_degree, y = grdc_latitude_in_arc_degree,  fill = performance_used, colour = performance_used, size = grdc_runoff_in_mm_per_year), pch = 21) +

  sc_fill + sc_colour +

#~   geom_point(table_for_world_map, mapping = aes(x = grdc_longitude_in_arc_degree, y = grdc_latitude_in_arc_degree, fill = kge_2009, size = grdc_catchment_area_in_km2), pch = 21) +
#~   sc_fill +

  theme(legend.title = element_text(size=20),
        legend.text = element_text(size = 16),
        legend.direction = 'horizontal',
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        aspect.ratio = (75+55)/360)+
#~   scale_size(trans = "log10", breaks=c(1e3,1e4,1e5), range=c(0,3)) +
#~   scale_size_binned(trans = "log10", breaks=c(1e3,1e4,1e5), range=c(0,3)) +
#~   scale_size_binned(trans = "log10", range=c(0,4)) +
#~   scale_size_binned(breaks=c(10^2,5*10^2,10^3,5*10^3,20000)) +
#~   scale_size_binned(breaks=c(50,500,1000,2000,5000,100000)) +
#~   scale_size_binned_area(breaks=c(50,500,1000,2500, 5000), limits = c(0,10000), name = "runoff (mm.year-1)") +
#~      scale_size_area(breaks=c(50,250,500,1000,2500, 5000), limits = c(0,10000), name = "runoff (mm.year-1)") +
     scale_size_binned_area(breaks=c(25,250,500,1000,2500,5000), limits = c(0,10000), name = "runoff (mm.year-1)", max_size = 7) +
#~   scale_size_area(trans = "log10", breaks=c(100,1000,10000), limits = c(0.01,10000000000000000000)) +
#~   scale_size_binned(trans = "log10", range=c(0,3)) +
#~   scale_size_binned(trans = "log10", breaks=c(0,5*10^1,5*10^2,5*10^3,10^4,Inf), range=c(0,4)) +

#~   scale_size(name=expression(paste("Upstream area ", "(km"^"2",")")),
#~              breaks=c(10000,100000,500000,1000000,4680000),
#~              labels=c('asd','10 000 < A < 100 000',
#~                       '100 000 < A < 500 000', '500 000 < A < 1 000 000 ',
#~                       'A > 1 000 000'),
#~              range=c(2,8))+

#~   scale_size(name=expression(paste("Upstream area ", "(km"^"2",")")),
#~              breaks=c(50,100,1000,10000,100000,500000,1000000,4680000),
#~              labels=c('asd','10 000 < A < 100 000',
#~                       '100 000 < A < 500 000', '500 000 < A < 1 000 000 ',
#~                       'A > 1 000 000'),
#~              range=c(2,8)
#~              )+

  geom_map(
    data = wg, map = wg,
    aes(long, lat, map_id = region),
    color = "grey50", fill= "grey", alpha = 0.0
  ) +

  guides(size=guide_legend(direction='vertical'))
#~   guides(size=guide_legend(direction='horizontal'))
  
length(performance_table$performance_used)

#~ world_map

#~ ggsave('kge_aqueduct_1979-2019.png', world_map, height=7, width=14, units='in', dpi=600, bg='white')

