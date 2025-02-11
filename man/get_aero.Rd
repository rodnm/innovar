% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_aero.R
\name{get_aero}
\alias{get_aero}
\title{Extract Aerosol index (UVAI) data of Sentinel5}
\usage{
get_aero(from, to, band, region, fun = "count", scale = 1000)
}
\arguments{
\item{to, from}{it's a string object,starting and final date.}

\item{band}{name of band.}

\item{region}{is a feature or feature collection.}

\item{fun}{function for extract statistic zonal (count, kurtosis, max, mean, median, min, mode, percentile, std, sum, variance, first).}

\item{scale}{A nominal scale in meters of the projection to work in.}
}
\value{
a sf object with the new variables.
}
\description{
A function that extract a time series of Aerosol index variables.
}
\details{
Name of some bands.
\itemize{
\item \bold{absorbing_aerosol_index (mol/m²):} A measure of the prevalence of aerosols in the atmosphere, calculated by this \href{https://sentinel.esa.int/web/sentinel/technical-guides/sentinel-5p/level-2/aerosol-index}{equation} using the 354/388 wavelength pair.
\item \bold{sensor_altitude (mol/m²):} Altitude of the satellite with respect to the geodetic sub-satellite point (WGS84).
\item \bold{sensor_azimuth_angle (degrees):} Azimuth angle of the satellite at the ground pixel location (WGS84); angle measured East-of-North.
\item \bold{sensor_zenith_angle (degrees):} Zenith angle of the satellite at the ground pixel location (WGS84); angle measured away from the vertical.
\item \bold{sensor_zenith_angle (degrees):} Azimuth angle of the Sun at the ground pixel location (WGS84); angle measured East-of-North.
\item \bold{solar_zenith_angle (degrees):}Zenith angle of the satellite at the ground pixel location (WGS84); angle measured away from the vertical.
}
}
\examples{
\dontrun{

library(tidyverse)
library(rgee)
library(innovar)
library(sf)
ee_Initialize()

# 1. Reading a sf object
data("Peru")
region <- Peru
region_ee <- pol_as_ee(region , id = 'distr' , simplify = 1000)
# 2. Extracting climate information
data <- region_ee \%>\% get_aero(
  from = "2019-02-01", to = "2019-12-31",
  band = "absorbing_aerosol_index", fun = "max")
}
}
