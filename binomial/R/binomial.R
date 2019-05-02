#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'




## 1.3) Function bin_choose()

#' @title bin_choose
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param n number of trials
#' @param k number of successes
#' @return the number of combinations in which k successes can occur in n trials
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)
#' @export
bin_choose = function(n,k){
        if(sum(k>n)==TRUE) {
                stop("k cannot be greater than n")
        }
        else{
        factorial(n)/(factorial(k)*factorial(n-k))
        }
}





## 1.4) Function bin_probability()

#' @title bin_probability
#' @description calculates the probability of getting specified successes in specfied trials
#' @param success number of success
#' @param trials number of trials
#' @param prob probability of success
#' @return the probability of getting specified successes in specfied trials
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)
#' @export
bin_probability = function(success,trials,prob){
        check_trials(trials)
        check_prob(prob)
        check_success(success, trials)

        probability = bin_choose(trials, success)*(prob^(success))*((1-prob)^(trials-success))
        return(probability)

}





## 1.5) Function bin_distribution()

#' @title bin_distribution
#' @description make a dataframe that shows probability for each number of success
#' @param trials number of trials
#' @param prob probability of success
#' @return a data frame with the probability distribution
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)
#' @export
bin_distribution = function(trials, prob){
        bindis = data.frame(success=0:trials, probability=0:trials)
        for(i in 1:(trials+1)){
        bindis[i,1] = i-1
        bindis[i,2] = bin_probability(success=i-1, trials=trials, prob=prob)
        }
        class(bindis) = c("bindis","data.frame")
        return(bindis)
}

# Function plot.bindis()
#' @export
plot.bindis = function(x, ...){
        barplot(x$probability,  names.arg = x$success, xlab="successes", ylab="probability")
}




## 1.6) Function bin_cumulative()

#' @title bin_cumulative
#' @description make a dataframe that shows cumulative probability for each number of success
#' @param trials number of trials
#' @param prob probability of success
#' @return a data frame with the cumulative probability distribution
#' @examples
#' bin_cumulative(trials = 5, prob = 0.5)
#' @export
bin_cumulative = function(trials, prob){

        bindis = bin_distribution(trials, prob)
        bincum = bindis
        bincum$cumulative = cumsum(bincum$probability)

        class(bincum) = c("bincum","data.frame")
        return(bincum)
}

# Function plot.bincum()
#' @export
plot.bincum = function(x, ...){
        plot(x$success,x$cumulative,ylab="probability",xlab="successes",lines(x$success,x$cumulative))
}

## 1.7) Function bin_variable()

#' @title bin_variable
#' @description make a list of class binvar with number of trials and probability of success
#' @param trials number of trials
#' @param prob probability of success
#' @return a list object of class binvar
#' @examples
#' bin_variable(trials = 10, prob = 0.3)
#' @export
bin_variable = function(trials,prob){
        check_trials(trials)
        check_prob(prob)

        binvar = list(trials = trials, prob = prob)
        class(binvar) = "binvar"
        return(binvar)
}

# Method print.binvar()
#' @export
print.binvar = function(x, ...){
        cat("\"Binomial variable\"")
        cat("\n")
        cat("\n")
        cat("\"Parameters\"")
        cat("\n")
        cat(" - number of trials:", x$trials)
        cat("\n")
        cat(" - prob of success:", x$prob)
        }

# Method summary.binvar() and print.summary.binvar()
#' @export
summary.binvar = function(object, ...){
        x = object
        trials = x$trials
        prob = x$prob
        mean = aux_mean(x$trials,x$prob)
        variance = aux_variance(x$trials,x$prob)
        mode = aux_mode(x$trials,x$prob)
        skewness = aux_skewness(x$trials,x$prob)
        kurtosis = aux_kurtosis(x$trials,x$prob)

        summary.binvar = list(trials = trials, prob = prob, mean = mean,variance = variance,
                              mode = mode, skewness = skewness, kurtosis = kurtosis)
        class(summary.binvar) = "summary.binvar"
        return(summary.binvar)
}



#' @export
print.summary.binvar = function(x, ...){
        cat("\"Summary Binomial\"")
        cat("\n")
        cat("\n")
        cat("\"Parameters\"")
        cat("\n")
        cat(" - number of trials:", x$trials)
        cat("\n")
        cat(" - prob of success:", x$prob)
        cat("\n")
        cat("\n")
        cat("\"Measures\"")
        cat("\n")
        cat(" - mean    :", x$mean)
        cat("\n")
        cat(" - variance:", x$variance)
        cat("\n")
        cat(" - mode    :", x$mode)
        cat("\n")
        cat(" - skewness:", x$skewness)
        cat("\n")
        cat(" - kurtosis:", x$kurtosis)
}




## 1.8) Functions of measures

# bin_mean()
#' @title bin_mean
#' @description calculate mean of binomial distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return mean of binomial distribution
#' @examples
#' bin_mean(trials = 10, prob = 0.3)
#' @export
bin_mean = function(trials, prob){
        check_trials(trials)
        check_prob(prob)

        mean = aux_mean(trials,prob)
        return(mean)
}

# bin_variance()
#' @title bin_variance
#' @description calculate variance of binomial distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return variance of binomial distribution
#' @examples
#' bin_variance(trials = 10, prob = 0.3)
#' @export
bin_variance = function(trials, prob){
        check_trials(trials)
        check_prob(prob)

        variance = aux_variance(trials,prob)
        return(variance)
}

# bin_mode()
#' @title bin_mode
#' @description calculate mode of binomial distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return mode of binomial distribution
#' @examples
#' bin_mode(trials = 10, prob = 0.3)
#' @export
bin_mode = function(trials, prob){
        check_trials(trials)
        check_prob(prob)

        mode = aux_mode(trials,prob)
        return(mode)
}

# bin_skewness()
#' @title bin_skewness
#' @description calculate skewness of binomial distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return skewness of binomial distribution
#' @examples
#' bin_skewness(trials = 10, prob = 0.3)
#' @export
bin_skewness = function(trials, prob){
        check_trials(trials)
        check_prob(prob)

        skewness = aux_skewness(trials,prob)
        return(skewness)
}

# bin_kurtosis()
#' @title bin_kurtosis
#' @description calculate kurtosis of binomial distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return kurtosis of binomial distribution
#' @examples
#' bin_kurtosis(trials = 10, prob = 0.3)
#' @export
bin_kurtosis = function(trials, prob){
        check_trials(trials)
        check_prob(prob)

        kurtosis = aux_kurtosis(trials,prob)
        return(kurtosis)
}

