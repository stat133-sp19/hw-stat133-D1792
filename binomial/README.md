---
output:
  github_document:
    html_preview: false
---

<!-- README.md is generated from README.Rmd. Please edit that file -->

```{r, echo = FALSE}
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "README-"
)
```


## Overview

`"binomial"` is a  package that implements functions for
calculating probabilities of a Binomial random variable, and related calculations such as the
probability distribution, the expected value, variance, etc. 


## Motivation

This package has been developed to illustrate some of the concepts
behind the creation of an R package.


## Installation

Install the development version from GitHub via the package `"devtools"`:

```r
# development version from GitHub:
#install.packages("devtools") 
# install "binomial" (without vignettes)
devtools::install_github("stat133-sp19/hw-stat133-D1792/bonomial")
# install "cointoss" (with vignettes)
devtools::install_github("stat133-sp19/hw-stat133-D1792", build_vignettes = TRUE)
```


## Usage

```{r}
library(binomial)

# choose 2 from 5 
bin_choose(n = 5, k = 2)

# probability of getting 2 successes in 5 trials
bin_probability(success = 2, trials = 5, prob = 0.5)

# binomial probability distribution
bin_distribution(trials = 5, prob = 0.5)

# plotting binomial probability distribution
dis1 <- bin_distribution(trials = 5, prob = 0.5)
plot(dis1)

# printing summary of binomial distribution
bin1 <- bin_variable(trials = 10, p = 0.3)
binsum1 <- summary(bin1)
binsum1

# mean of binomial distirbution with 10 trilas and 0.3 probability
bin_mean(10, 0.3)
```
