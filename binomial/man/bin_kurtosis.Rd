% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/binomial.R
\name{bin_kurtosis}
\alias{bin_kurtosis}
\title{bin_kurtosis}
\usage{
bin_kurtosis(trials, prob)
}
\arguments{
\item{trials}{number of trials}

\item{prob}{probability of success}
}
\value{
kurtosis of binomial distribution
}
\description{
calculate kurtosis of binomial distribution
}
\examples{
bin_kurtosis(trials = 10, prob = 0.3)
}
