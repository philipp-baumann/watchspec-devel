# global reference to python pkgs (will be initialized in .onLoad)
xarray <- watchdog <- zarr <- NULL

.onLoad <- function(libname, pkgname) {
  # use superassignment to update global reference to scipy
  xarray <<- reticulate::import("xarray", delay_load = TRUE)
  watchdog <<- reticulate::import("watchdog", delay_load = TRUE)
  zarr <<- reticulate::import("zarr", delay_load = TRUE)
}