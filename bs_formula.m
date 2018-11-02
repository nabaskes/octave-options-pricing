function [price] = bs_formula(S, K, r, vol, T, is_call)
  %{
  S -> float: spot price of underlying security
  K -> float: strike price of the option
  r -> float: risk-free interest rate
  vol -> float: volatility of underlying security
  T -> float: time until option matures, years
  is_call -> bool: true if the option is a call, false if it's a put

  Gives the predicted value of the option
  %}

  d1 = 1/(vol*sqrt(T)) * (log(S/K) + (r + (vol^2/2)*T));
  d2 = d1 - vol * sqrt(T);

  if (is_call)
    price = normcdf(d1)*S - normcdf(d2)*K*exp(-r*T);
  else
    price = normcdf(-d2)*K*exp(-r*T)-normcdf(-d1)*S;
  end
end
