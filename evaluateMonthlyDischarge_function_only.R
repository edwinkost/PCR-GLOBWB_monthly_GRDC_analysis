# functions:
#
nPairs_function <- function(obs, pred) length(pred[which(!is.na(obs) & !is.na(pred))])
#

KGE_function <- function (Qsim, Qobs, method =  "2009") {
# reference: http://homepages.ecs.vuw.ac.nz/~kevin/forSGEES/Compiled-Matlab/klinggupta.m

# original data:
Qobs_ori <- Qobs 
Qsim_ori <- Qsim 

# throw away missing values (both obs and sim must have values)
Qsim <- Qsim_ori[!is.na(Qobs_ori) & !is.na(Qsim_ori)]
Qobs <- Qobs_ori[!is.na(Qobs_ori) & !is.na(Qsim_ori)]


if (length(Qobs) < 2 || length(Qsim) < 2) {return(NA)}

modelled <- Qsim
observed <- Qobs

sd_modelled = sd(modelled)
sd_observed = sd(observed)

m_modelled = mean(modelled)
m_observed = mean(observed)

cor_pearson = cor(modelled, observed)

if (sd_observed == 0) {(return(NA))}
if (m_observed == 0) {(return(NA))}

alpha_var = sd_modelled/sd_observed
beta_bias  = m_modelled/m_observed

kge_2009 <- 1 - sqrt( ((cor_pearson - 1)^2) + ((alpha_var-1)^2)  + ((beta_bias-1)^2))

if (method == "2009") {return(kge_2009)}

covar_modelled = sd_modelled/m_modelled
covar_observed = sd_observed/m_observed

gamma_covar = covar_modelled/covar_observed

kge_2012 <- 1 - sqrt( ((cor_pearson - 1)^2) + ((gamma_covar-1)^2)  + ((beta_bias-1)^2))

if (method == "2012") {return(kge_2012)}

}

#
NSeff_function <- function (Qobs, Qsim) {
    # original data:
    Qobs_ori <-Qobs 
    Qsim_ori <-Qsim 
    # throw away missing values (both obs and sim must have values)
    Qsim <- Qsim_ori[!is.na(Qobs_ori) & !is.na(Qsim_ori)]
    Qobs <- Qobs_ori[!is.na(Qobs_ori) & !is.na(Qsim_ori)]
    if (length(Qobs) == 0 || length(Qsim) == 0) 
        return(NA)
    NS <- 1 - (sum((Qobs - Qsim)^2)/sum((Qobs - mean(Qobs))^2))
    return(NS)
}
#
NSeff_log_function <- function (Qobs, Qsim) {
    # avoid zero and negative discharge values
    Qobs[which(Qobs<=1)] = 1
    Qsim[which(Qsim<=1)] = 1
    # convert to become log values
    Qobs = log(Qobs)
    Qsim = log(Qsim)
    # original data:
    Qobs_ori <-Qobs 
    Qsim_ori <-Qsim 
    # throw away missing values (both obs and sim must have values)
    Qsim <- Qsim_ori[!is.na(Qobs_ori) & !is.na(Qsim_ori)]
    Qobs <- Qobs_ori[!is.na(Qobs_ori) & !is.na(Qsim_ori)]
    if (length(Qobs) == 0 || length(Qsim) == 0) 
        return(NA)
    NS <- 1 - (sum((Qobs - Qsim)^2)/sum((Qobs - mean(Qobs))^2))
    return(NS)
}
#
avg_obs_function <- function(obs, sim) mean(obs[which(!is.na(obs) & !is.na(sim))]) # PS: While calculating average we consider only complete pairs.
avg_sim_function <- function(obs, sim) mean(sim[which(!is.na(obs) & !is.na(sim))]) # PS: While calculating average we consider only complete pairs.    
#
rmse_function    <- function(obs, pred) sqrt(mean((obs-pred)^2 ,na.rm=T))
 mae_function    <- function(obs, pred)      mean(abs(obs-pred),na.rm=T)
bias_function    <- function(obs, pred) mean(pred[which(!is.na(obs) & !is.na(pred))]) - mean(obs[which(!is.na(obs) & !is.na(pred))])  # POSITIVE indicates that the average prediction is higher than average observation. 
R2_function      <- function(obs, pred) summary(lm(obs ~ pred))$r.squared
R2ad_function    <- function(obs, pred) summary(lm(obs ~ pred))$adj.r.squared

