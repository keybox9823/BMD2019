function p = default_principal_parameters()

% based on Jason sitting on the Browser (parameters taken from
% BicycleParameters/data)

% geometry and other
p.c = 0.0685808540382;
p.w = 1.121;
p.lam = 0.399680398707;
p.g = 9.81;
p.v = 3.0;

% rear wheel
p.mR = 3.11;
p.rR = 0.340958858855;
p.xR = 0.0;
p.yR = 0.0;
p.zR = -p.rR;
IRxx = 0.0904114316323;
IRyy = 0.152391250767;
IRzz = IRxx;
p.kR11 = sqrt(IRyy/p.mR);  % aligned with Y axis
p.kR22 = sqrt(IRxx/p.mR);
p.kR33 = sqrt(IRzz/p.mR);

% front wheel
p.mF = 2.02;
p.rF = 0.34352982332;
p.xF = p.w;
p.yF = 0.0;
p.zF = -p.rF;
IFxx = 0.0883826870796;
IFyy = 0.149221207336;
IFzz = IFxx;
p.kF11 = sqrt(IFyy/p.mF);  % aligned with Y axis
p.kF22 = sqrt(IFxx/p.mF);
p.kF33 = sqrt(IFzz/p.mF);

% person
p.lP = 1.728;  % estimated from the BicycleParameters figure
p.wP = 0.483;  % estimated from the BicycleParameters figure
p.mP = 83.50000000000001;
p.xP = 0.3157679154070924;
p.yP = 0.0;
p.zP = -1.0989885659819278;
p.kPaa = 0.36796654;
p.kPbb = 0.15276369;
p.kPyy = 0.36717241;  % aligned with the Y axis
p.alphaP = 0.18617531745505142;  % angle between X and the max of kPa and kPb

% front frame
p.mH = 3.22;
p.xH = 0.866949640247;
p.yH = 0.0;
p.zH = -0.748236400835;
p.kHaa = 0.29556015;
p.kHbb = 0.14493343;
p.kHyy = 0.27630431;  % aligned with the Y axis
p.alphaH = 0.3699481738478786;

% rear frame (only) parameters
p.mD = 9.86;
p.xD = 0.275951285677;
p.yD = 0.0;
p.zD = -0.537842424305;
p.kDaa = 0.28586689;
p.kDbb = 0.22079007;
p.kDyy = 0.36538846;  % this is aligned with the Y axis
p.alphaD = 1.1722101094171953;
