% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/template.R
\name{get_template_file}
\alias{get_template_file}
\title{Show the cloud-config template files}
\usage{
get_template_file(template)
}
\arguments{
\item{template}{This returns the file location of template files for use in \link{gce_vm_template}}
}
\value{
file location
}
\description{
Show the cloud-config template files
}
\details{
Templates available are:

\itemize{
  \item rstudio An RStudio server docker image
  \item rstudio-hadleyverse RStudio with the tidyverse installed
  \item shiny A Shiny docker image
  \item opencpu An OpenCPU docker image
  \item r_base Latest version of R stable
  \item example A non-R test container running busybox
  \item dynamic Supply your own docker image to download such as \code{rocker/verse}
  \item builder A VM that can build a supplied Dockerfile
 }
}

