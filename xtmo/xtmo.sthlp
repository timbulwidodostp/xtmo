{smcl}
{* version 1.0.0 10October2016}{...}
{cmd: help xtmo}{right: ...}
{hline}

{title:Title}

{phang}
{bf:xtmo} {hline 2} Mean Observation OLS for static/dynamic Panels with intercept/slope heterogeneity across individuals and over time.

{title:Syntax}

{p 4 4 2}
{cmd:xtmo} {depvar} {varlist} {ifin} 
[{cmd:,} {it: maxiter(#) tol(#)}]{p_end}

{p 4 4 2}Items in [brackets] are optional. 
You must {cmd:xtset} your data before using {cmd:xtmo}; see {helpb xtset}.{p_end}

{title:Description}

{pstd}
{cmd:xtmo} is for large static or dynamic panel data models (medium to large N and T) that feature heterogeneity  
in the intercept term and slope coefficients that vary across individuals and over time.
It implements the Neal (2016) Mean Observation OLS ('MO-OLS') estimator to the data, and will provide a consistent
estimate of each individual coefficient as well as a consistent and asymptotically normal estimate of the average
coefficient over the sample.

{p 4 4 2}Consider the following panel model:{p_end}

{p 4 4 2}y_it = alpha_it + rho_it*y_(it-1) + beta_it*x_it + v_it{p_end}

{p 4 4 2}alpha_it = alpha + alpha_i + alpha_t {p_end}

{p 4 4 2}rho_it = rho + rho_i + rho_t{p_end}

{p 4 4 2}beta_it = beta + beta_i + beta_t{p_end}

{p 4 4 2}where the intercept and slope coefficients vary across both dimensions of the panel, 
x_it is a NTxK matrix of regressors, and v_it is the idiosyncratic error term.{p_end}

{p 4 4 2}{cmd:xtmo} provides consistent estimation of each individual alpha_it, rho_it, and beta_it. It saves these as variables in your dataset
with the titles bit_* where * is the name of the explanatory variables used in the model. Furthermore, it provides
consistent estimates of the mean coefficient over the sample, as well as standard errors for those mean estimates.
It requires x_it to be exogenous with v_it and for both N and T to be moderate to large in size (T being the most important dimension). {p_end}

{p 4 4 2}The heterogeneity can follow any distribution and also be correlated with the regressors. In this situation, using fixed effects or mean 
group based estimators may provide inconsistent and (potentially severely) biased coefficient estimates.{p_end}

{title:References}

{p 4 4 2}Neal, T. (2016) "Multidimensional Parameter Heterogeneity in Panel Data Models", Working Paper{p_end}

{title:Options}

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{synopt:{opt maxiter(#)}}Sets the maximum number of iterations for the bias correction procedure. Default is 1500.
Raise this number if the model fails to converge.{p_end}
{synopt:{opt tol(#)}}Sets the tolerance level for the bias correction procedure.
It represents the maximum amount of change in the mean coefficients between iterations before convergence is achieved.
The default value is 0.001.{p_end}

{title:Examples}

{p 4 4 2}Mean Estimates:{p_end}{phang}{cmd:. xtmo y ly x, maxiter(5000) tol(0.0001)}

{p 4 4 2}Distribution of the individual coefficients:{p_end}

{phang}{cmd:. kdensity bit_x}

{phang}{cmd:. kdensity bit_ly}

{title:Known Issues}

{p 4 4 2}The bias correction may struggle to converge with heavily unbalanced panels.{p_end}
{p 4 4 2}The command does not yet work with time series operators.{p_end}

{title:Saved results}

{pstd}{cmd:xtmo} saves the following in {cmd:e()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Scalars}{p_end}
{synopt:{cmd:e(N)}}Number of usable observations{p_end}
{synopt:{cmd:e(iters)}}Number of iterations used in the bias correction procedure{p_end}
{synopt:{cmd:e(g_min)}}Fewest number of observations in a single regression
for an individual or time period.{p_end}
{synopt:{cmd:e(g_max)}}Largest number of observations in a single regression
for an individual or time period.{p_end}
{synopt:{cmd:e(g_avg)}}The average number of observations in a single regression
for an individual or time period.{p_end}
{synopt:{cmd:e(N_g)}}Number of panel units{p_end}
{synopt:{cmd:e(chi2)}}Chi-squared{p_end}
{synopt:{cmd:e(df_m)}}Model degrees of freedom{p_end}

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Macros}{p_end}
{synopt:{cmd:e(ivar)}}Panel unit identification variable{p_end}
{synopt:{cmd:e(tvar)}}Time variable{p_end}
{synopt:{cmd:e(depvar)}}Dependent variable{p_end}

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Matrices}{p_end}
{synopt:{cmd:e(b)}}Vector of mean coefficients{p_end}
{synopt:{cmd:e(V)}}Variance matrix of the mean coefficient estimates{p_end}

{title:Author}

{pstd}Timothy Neal{p_end}
{pstd}School of Economics{p_end}
{pstd}University of New South Wales{p_end}
{pstd}Sydney, Australia{p_end}
{pstd}{browse "mailto:timothy.neal@unsw.edu.au":timothy.neal@unsw.edu.au} {p_end}
{pstd}{browse "https://sites.google.com/site/tjrneal/stata-code":https://sites.google.com/site/tjrneal/stata-code} {p_end}

{title:Also see}

{psee}
{space 2}Online: {helpb xtmg}, {helpb xtcce}, {helpb xtpedroni}, {helpb xtset}, {helpb xtpmg}
{p_end}
