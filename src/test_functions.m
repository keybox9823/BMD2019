p = default_principal_parameters();

b = convert_principal_to_benchmark(p);

expd_b.w = 1.121;
expd_b.c = 0.0685808540382;
expd_b.lam = 0.399680398707;
expd_b.g = 9.81;
expd_b.mB = 93.36;
expd_b.xB = 0.3115627743494798;
expd_b.yB = 0.0;
expd_b.zB = -1.0397244169145061;
expd_b.IBxx = 14.291736774539832;
expd_b.IByy = 15.364340673709581;
expd_b.IBxz = -1.621358873619717;
expd_b.IBzz = 3.0399891044245795;
expd_b.mH = 3.22;
expd_b.xH = 0.866949640247;
expd_b.yH = 0.0;
expd_b.zH = -0.748236400835;
expd_b.IHxx = 0.25335539588;
expd_b.IHyy = 0.245827908036;
expd_b.IHzz = 0.0955686343473;
expd_b.IHxz = -0.0720217263293;
expd_b.mF = 2.02;
expd_b.rF = 0.34352982332;
expd_b.IFxx = 0.0883826870796;
expd_b.IFyy = 0.149221207336;
expd_b.IFzz = 0.0883826870796;
expd_b.mR = 3.11;
expd_b.rR = 0.340958858855;
expd_b.IRxx = 0.0904114316323;
expd_b.IRyy = 0.152391250767;
expd_b.IRzz = 0.0904114316323;
expd_b.v = 3.0;

fields = fieldnames(b);
for i = 1:length(fields)
    is_equal(b.(fields{i}), expd_b.(fields{i}), fields{i})
end

x = free_parameters(p);

size(x)

p_updated = update_principal_parameters(p, nan*ones(23,1));

[lb, ub] = free_par_bounds();

size(lb)
size(ub)

[c, ceq] = compute_constraints(x, p);

size(c)
