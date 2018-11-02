function [greek] = gamma(S, K, r, vol, T)
    %{
  S -> float: spot price of underlying security
  K -> float: strike price of the option
  r -> float: risk-free interest rate
  vol -> float: volatility of underlying security
  T -> float: time until option matures, years

  Gives the "gamma" greek for a given option.
  The gamma is the second derivative of the price
  of the option with respect to

  %}
  d1 = 1/(vol*sqrt(T)) * (log(S/K) + (r + (vol^2/2)*T));
  pdf = @(x) (1/sqrt(2*pi))*exp(x^2/2);
  greek = pdf(d1)/(S*vol*sqrt(T));
end
