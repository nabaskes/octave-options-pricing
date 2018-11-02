function [greek] = theta(S, K, r, vol, T, is_call)
    %{
  S -> float: spot price of underlying security
  K -> float: strike price of the option
  r -> float: risk-free interest rate
  vol -> float: volatility of underlying security
  T -> float: time until option matures, years
  is_call -> bool: true if the option is a call, false if it's a puthe ""

  Gives the value of the "theta" greek.
  This is the derivative of the option price with respect to
  time (in calendar days, this is sometimes expressed in trading days,
  which you can convert to by multiplying the value by 365/252;)
  %}

  pdf = @(x) (1/sqrt(2*pi))*exp(x^2/2);
  d1 = 1/(vol*sqrt(T)) * (log(S/K) + (r + (vol^2/2)*T));
  d2 = d1 - vol * sqrt(T);*
  prefix_term = -(S*pdf(d1)*vol)/(2*sqrt(T));
  if (is_call)
    greek = (prefix - r * K * exp(-r*T)*normcdf(d2)) / 365;
  else
    greek = (prefix + r*K*exp(-r*T)*normcdf(-d2)) / 365;
  end
end
