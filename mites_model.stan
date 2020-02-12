data {
  // sample size; a non-negative integer
  int<lower=0> n;
  
  // vector of n observations, each of which is an integer
  // these are the mite counts
  int x[n];
}

parameters {
  // declare a parameter named mu that is a non-negative real number
  // this is the mean parameter for the negative binomial distribution; 
  real<lower=0> mu;
  
  // declare a parameter named phi that is a non-negative real number
  // this is the size parameter for the negative binomial distribution
  real<lower=0> phi;
}

model {
  // each element of the vector x is modeled as following a
  // Negative Binomial(mu, phi) distribution
  // In stan, the function to use is neg_binomial_2(mu, phi)
  // (we are using the second parameterization provided by Stan)
  x ~ neg_binomial_2(mu, phi);
}
