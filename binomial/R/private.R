## 1.1) Private Checker Functions

# private auxiliary function check_prob() to test if an input prob is a valid probability value

check_prob = function(prob){
        if(any(prob >= 0) & any(prob <= 1)){
                return("TRUE")
        }
        else{
                stop("p has to be a number betwen 0 and 1")
        }
}

# private auxiliary function check_trials() to test if an input trials is a valid value for number of trials

check_trials = function(trials){
        if(any(trials%%1 == 0) & any(trials >=0)){
                return("TRUE")
        }
        else{
                stop("invalid trials value")
        }
}

# private auxiliary function check_success() to test if an input success is a valid value for number of successes

check_success = function(success, trials){
        if(any(success%%1 != 0) | any(success < 0)){
                stop("invalid success value")
        }
        else{
                if(any(success <= trials)){
                        return("TRUE")
                }
                else{
                        stop("success cannot be greater than trials")
                }
        }
}





## 1.2) Private Auxiliary Functions

# private auxiliary function aux_mean() to calculate the mean of a binomial distribution
aux_mean = function(trials, prob){
        prob*trials
}


# private auxiliary function aux_variance() to calculate the variance of a binomial distribution
aux_variance = function(trials, prob){
        trials*prob*(1-prob)
}


# private auxiliary function aux_mode() to calculate the mode of a binomial distribution
aux_mode = function(trials, prob){
        n = trials*prob + prob
        int = floor(trials*prob + prob)
        if(n%%1 == 0){
                return(c(int,int-1))
        }
        else{
                return(int)
        }
}

# private auxiliary function aux_mode() to calculate the skewness of a binomial distribution
aux_skewness = function(trials, prob){
        (1-2*prob)/sqrt(trials*prob*(1-prob))
}

# private auxiliary function aux_mode() to calculate the kurtosis of a binomial distribution
aux_kurtosis = function(trials, prob){
        (1-6*prob*(1-prob))/(trials*prob*(1-prob))
}
