p = default_principal_parameters();
x0 = free_parameters(p);
A = []; b = []; Aeq = []; beq = [];
[lb, ub] = free_par_bounds();
fun = @(x) calculate_peak_hqm(x, p);
nonlcon = @(x) compute_constraints(x, p);
x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon);
