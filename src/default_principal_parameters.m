function p = default_principal_parameters()

% based on Jason sitting on the Pista

p.w = 0.989
p.c = 0.0617300113263
p.g = 9.81
p.v = 5.0
p.lam = 0.275762021815
p.mH = 2.27
p.mR = 1.38
p.mF = 1.58
p.rR = 0.332088156971
p.rF = 0.333838861345
p.xH = 0.906321313298
p.zH = -0.732376356772
% TODO : pick some reasonable values for these two.
p.lP = nan;
p.wP = nan;

% TODO : Put into principal radius of gyration form.
IFxx = 0.0553476418952
IFyy = 0.106185287785
IRxx = 0.0552268228143
IRyy = 0.0764034890242

% TODO : Put into principal radius of gyration form.
IHxx = 0.0979884309288
IHxz = -0.00440828467861
IHyy = 0.0691907586693
IHzz = 0.0396107377431

% TODO: Break into separate bicycle and rider and put in principal radius of
% gyration form
mB = 4.49
xB = 0.382963782674
yB = 0.0
zB = -0.476798507146
IBxx = 0.289968529291
IBxz = 0.0502317583637
IByy = 0.475817094274
IBzz = 0.249418014295
