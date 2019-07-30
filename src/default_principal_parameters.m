function p = default_principal_parameters()

% based on Jason sitting on the Browser (parameters taken from
% BicycleParameters/data)

p.c = 0.0685808540382
p.w = 1.121
p.lam = 0.399680398707
p.g = 9.81
p.v = 3.0

p.mR = 3.11
p.rR = 0.340958858855
% TODO : convert to kR11, kR22, kR33
p.IRxx = 0.0904114316323
p.IRyy = 0.152391250767
p.IRzz = p.IRxx;

p.mF = 2.02
p.rF = 0.34352982332
% TODO : convert to kF11, kF22, kF33
p.IFxx = 0.0883826870796
p.IFyy = 0.149221207336
p.IFzz = p.IFxx;

% TODO : pick some reasonable values for these two.
p.lP = 1.728;  % estimated from the BicycleParameters figure
p.wP = 0.483;  % estimated from the BicycleParameters figure
mP = 72.0
xP = 0.2909
yP = 0.0
zP = -1.1091
IPxx = 7.9985
IPxz = -1.9272
IPyy = 8.0689
IPzz = 2.3624

% TODO : Put into principal radius of gyration form.
p.mH = 3.22
p.xH = 0.866949640247
p.yH = 0.0
p.zH = -0.748236400835
p.IHxx = 0.25335539588
p.IHxz = -0.0720217263293
p.IHyy = 0.245827908036
p.IHzz = 0.0955686343473

% TODO : Put into principal radius of gyration form.
% rear frame (only) parameters
mD = 9.86
xD = 0.275951285677
yD = 0.0
zD = -0.537842424305
IDxx = 0.52962890621
IDxz = -0.116285607878
IDyy = 1.3163960125
IDzz = 0.756786895402
