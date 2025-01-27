################################################################################
# title
################################################################################
#
# Juan Carlos Villaseñor-Derbez
# juancvd@stanford.edu
# date
#
# Global R options and other relevant materials
#
################################################################################

## DEFAULT PLOT THEME ##########################################################
ggplot2::theme_set(
  ggplot2::theme_linedraw(base_size = 14) +
    ggplot2::theme(line = ggplot2::element_line(color = "black",
                                                linewidth = 1),
                   axis.title = ggplot2::element_text(hjust = 1,
                                                     vjust = 1))
)

## DEFAULT GEOM OPTIONS ########################################################
ggplot2::update_geom_defaults(geom = "line",
                              new = list(linewidth = 1,
                                         color = "black"))

ggplot2::update_geom_defaults(geom = "point",
                              new = list(size = 4,
                                         color = "black"))

ggplot2::update_geom_defaults(geom = "smooth",
                              new = list(linewidth = 1,
                                         color = "black"))

ggplot2::update_geom_defaults(geom = "sf",
                              new = list(linewidth = 0.5,
                                         color = "black",
                                         fill = "gray50"))

## COLOR PALETTES ##############################################################
options(ggplot2.discrete.fill = function(){scale_fill_viridis_d(option = "mako")})
options(ggplot2.discrete.colour = function(){scale_colour_viridis_d(option = "mako")})

