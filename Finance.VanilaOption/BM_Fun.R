#Function Files related Brownian motion

Geom.BM <- function(S0, mu, sig, T, nstep, N.setseed){
#############################################################
# Generate the discrete-time, Continuous-state approximation for Geometric
#    Brownian motion
#
# Written by Youngsoo Choi, Hankuk University of Foreign Studies
# "09-25-2008"
################################################################
# Generate the discrete Wiener process starting at y0
# The model:
#   W_i = W_{i-1} + sqrt(n0) for i=1, ..., n0,
#   W^n_t = sqrt(t)*W_{n0},
#   n0 = ceiling(n*t)
# where
# T = target time 
# nstep = number of time step during the target time
# S0 = starting value 
# 

   dt = T/nstep# time interval
   dtsq = sqrt(dt)
   sig2 = sig*sig
   set.seed(N.setseed)
   randomNormal = rnorm(nstep)
   #
   euler = rep(c(0), length=nstep+1)
   milstein = rep(c(0), length=nstep+1)
   exact = rep(c(0), length=nstep+1)
   #
   euler[1] = S0; milstein[1] = S0; exact[1] = S0;
   for (j in 1:nstep){
      temp = dtsq*randomNormal[j]
      euler[j+1] = euler[j]*(1 + mu*dt + sig*temp)
      milstein[j+1] = milstein[j]*(1 + mu*dt + sig*temp + 0.5*sig2*(temp^2 - dt))
      exact[j+1] = exact[j]*exp((mu - 0.5*sig2)*dt + sig*temp)
   }

   return(list(Euler = euler, Milstein=milstein, Exact=exact))
}

Random.Walk <- function (t, n, y0, N.setseed) 
{
#############################################################
# Generate the random walks
#
# Written by Youngsoo Choi, Hankuk University of Foreign Studies
# "06-11-2005"
################################################################
# Generate random walks starting at 0
# The model:
#   W_i = W_{i-1} + x(i)/sqrt(n0) for i=1, ..., n0,
#   W^n_t = sqrt(t)*W_{n0},
#   n0 = ceiling(n*t)
# where
# t = target time 
# n = number of time step in unit time
# y0 = starting value 
# N.setseed = starting # for random numbers 
# 

n0 <- ceiling(n*t)
y <- rep(c(0), length=n0+1);
y[1] <- y0;
set.seed(N.setseed)
randomNormal = rnorm(n0)
for (i in 1:n0){
   temp <- randomNormal[i];
   ifelse(temp >= 0, x <- 1, x <- -1);
   y[i+1] <- y[i] + x/sqrt(n0);
}
y <- sqrt(t)*y

return(y)
}

Wiener <- function (t, n, y0, N.setseed) 
{
#############################################################
# Generate the discrete Wiener process
#
# Written by Youngsoo Choi, Hankuk University of Foreign Studies
# "06-11-2005"
################################################################
# Generate the discrete Wiener process starting at y0
# The model:
#   W_i = W_{i-1} + sqrt(n0) for i=1, ..., n0,
#   W^n_t = sqrt(t)*W_{n0},
#   n0 = ceiling(n*t)
# where
# t = target time
# n = number of time step in unit time
# y0 = starting value
# N.setseed = starting # for random numbers 
# 

n0 <- ceiling(n*t)
y <- rep(c(0), length=n0+1);
y[1] <- y0;
set.seed(N.setseed)
randomNormal = rnorm(n0)
for (i in 1:n0){
   y[i+1] <- y[i] + randomNormal[i]/sqrt(n);
}

return(y);
}