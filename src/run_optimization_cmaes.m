% Load the parameters based on Jason + Browser.
p = default_principal_parameters();

% The initial guess for the parameters will be the Jason + Browser values.
x0 = free_parameters(p);

% Load the lower and upper bounds for the parameters.
[lb, ub] = free_par_bounds();
opts.LBounds = lb;
opts.UBounds = ub;

% TODO : Probably want to set sigma manually.
sigma = sqrt(var(x0')');

[x, hqm] = cmaes('calculate_peak_hqm_cmaes', x0, sigma, opts, p);
