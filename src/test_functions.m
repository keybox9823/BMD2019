p = default_principal_parameters();

b = convert_principal_to_benchmark(p);

is_equal(b.w, 1.121)
is_equal(b.c, 0.0685808540382)
is_equal(b.lam, 0.399680398707)
is_equal(b.g, 9.81)
is_equal(b.mB, 93.36)
is_equal(b.xB, 0.3115627743494798)
is_equal(b.yB, 0.0)
is_equal(b.zB, -1.0397244169145061)
is_equal(b.IBxx, 14.291736774539832)
is_equal(b.IByy, 15.364340673709581)
is_equal(b.IBxz, -1.621358873619717)
is_equal(b.IBzz, 3.0399891044245795)
is_equal(b.mH, 3.22)
is_equal(b.xH, 0.866949640247)
is_equal(b.zH, -0.748236400835)
is_equal(b.IHxx, 0.25335539588)
is_equal(b.IHyy, 0.245827908036)
is_equal(b.IHzz, 0.0955686343473)
is_equal(b.IHxz, -0.0720217263293)
is_equal(b.mF, 2.02)
is_equal(b.rF, 0.34352982332)
is_equal(b.IFxx, 0.0883826870796)
is_equal(b.IFyy, 0.149221207336)
is_equal(b.mR, 3.11)
is_equal(b.rR, 0.340958858855)
is_equal(b.IRxx, 0.0904114316323)
is_equal(b.IRyy, 0.152391250767)

x = free_parameters(p);

p_updated = update_principal_parameters(p, nan*ones(23,1));

[lb, ub] = free_par_bounds();

[c, ceq] = compute_constraints(x, p);
