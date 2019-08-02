% Load the parameters based on Jason + Browser.
p = default_principal_parameters();
% The initial guess for the parameters will be the Jason + Browser values.
x0 = free_parameters(p);
% No linear constraints.
A = []; b = []; Aeq = []; beq = [];
% Load the lower and upper bounds for the parameters.
[lb, ub] = free_par_bounds();
% Setup the objective and nonlinear constraints functions.
fun = @(x) calculate_peak_hqm(x, p);
nonlcon = @(x) compute_constraints(x, p);
options = optimoptions('fmincon', ...
                       'Display','iter');
x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon, options);
