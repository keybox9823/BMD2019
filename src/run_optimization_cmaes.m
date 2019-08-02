% Load the parameters based on Jason + Browser.
p = default_principal_parameters();

% The initial guess for the parameters will be the Jason + Browser values.
x0 = free_parameters(p);

% Load the lower and upper bounds for the parameters.
[lb, ub] = free_par_bounds();
opts.LBounds = lb;
opts.UBounds = ub;

%sigma = sqrt(var(x0')');
sigma = free_parameter_std();

[x, hqm] = cmaes('calculate_peak_hqm_cmaes', x0, sigma, opts, p);
