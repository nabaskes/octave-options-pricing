function [greek] = rho(S, K, r, vol, T, is_call)
  %{
  S -> float: spot price of underlying security
  K -> float: strike price of the option
  r -> float: risk-free interest rate
  vol -> float: volatility of underlying security
  T -> float: time until option matures, years
  is_call -> bool: true if the option is a call, false if it's a put

  The "rho" greek, which gives the derivative of
  the option price with respect to the risk-free interest rate.
  A scaling factor of 1/10000 is applied to convert the greek
  into units of basis points.
  %}
  d1 = 1/(vol*sqrt(T)) * (log(S/K) + (r + (vol^2/2)*T));
  d2 = d1 - vol * sqrt(T);

  if is_call
    greek = K * T * exp(-r*T)*normcdf(d2);
  else
    greek = -K * T * exp(-r*T)*normcdf(-d2);
  end
end
