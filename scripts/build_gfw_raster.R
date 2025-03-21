################################################################################
# title
################################################################################
#
# Juan Carlos Villaseñor-Derbez
# jc_villasenor@miami.edu
# date
#
# Build GFW raster
#
################################################################################

## SET UP ######################################################################

# Load packages ----------------------------------------------------------------
library(here)
library(tidyverse)
library(terra)

# Load data --------------------------------------------------------------------
gfw <- list.files(here("data/fleet-monthly-csvs-10-v3-2024/"), full.names = T) |>
  map_dfr(read_csv)

## PROCESSING ##################################################################

# X ----------------------------------------------------------------------------
gfw_sum <- gfw |>
  group_by(cell_ll_lat, cell_ll_lon) |>
  summarize(fishing_hours = sum(fishing_hours, na.rm = T),
            .groups = "drop") |>
  select(cell_ll_lon, cell_ll_lat, fishing_hours)

gfw_rast <- rasterize(x = as.matrix(gfw_sum[,1:2]),
                      y = rast(resolution = 0.5,
                           crs = "EPSG:4326",
                           val = 0,
                           xmin = -180, xmax = 179.9,
                           ymin = -77.8, ymax = 89),
                      values = gfw_sum$fishing_hours,
                      fun = "sum", na.rm = T)

## VISUALIZE ###################################################################

# X ----------------------------------------------------------------------------
plot(log(gfw_rast))

## EXPORT ######################################################################

# X ----------------------------------------------------------------------------
writeRaster(gfw_rast, filename = here("data", "gfw_fishing_effort_2024.tif"))
