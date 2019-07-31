p = default_principal_parameters();

b = convert_principal_to_benchmark(p);

x = free_parameters(p);

p_updated = update_principal_parameters(p, nan*ones(23,1));

[lb, ub] = free_par_bounds();

[c, ceq] = compute_constraints(x, p);
