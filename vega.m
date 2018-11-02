function [greek] = vega(S, K, r, vol, T)
    %{
  S -> float: spot price of underlying security
  K -> float: strike price of the option
  r -> float: risk-free interest rate
  vol -> float: volatility of underlying security
  T -> float: time until option matures, years

  Gives the "vega" greek for a given stock.
  This is the partial of the price of the option
  with respect to the volatility.
  A scaling factor of (1/100) is applied to express in units of vol points
  %}
  d1 = 1/(vol*sqrt(T)) * (log(S/K) + (r + (vol^2/2)*T));
  pdf = @(x) (1/sqrt(2*pi))*exp(x^2/2);
  greek = S * pdf(d1) * sqrt(T) / 100;
end
