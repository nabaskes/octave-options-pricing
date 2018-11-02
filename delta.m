function [greek] = delta(S, K, r, vol, T, is_call)
  %{
  Gets the "delta" greek for a given option where:

  S -> float: spot price of underlying security
  K -> float: strike price of the option
  r -> float: risk-free interest rate
  vol -> float: volatility of underlying security
  T -> float: time until option matures, years
  is_call -> bool: true if the option is a call, false if it's a put

  Delta tells you the derivative of the price of the option
  with respect to the spot price of the security
  %}

  d1 = 1/(vol*sqrt(T)) * (log(S/K) + (r + (vol^2/2)*T));
  if is_call
    greek = normcdf(d1);
  else
    greek = -normcdf(-d1);
  end
end
