function x = free_parameters(principal_parameters)
% FREE_PARAMETERS - Returns the free parameter vector, x, given the full set
% of principal parameters.
%
% Inputs
%   principal_parameters - Structure containing all of the principal
%   parameters.
% Outputs
%   x - 23x1 double, vector of free parameters

p = principal_parameters;

x = [p.w;
     p.c;
     p.lam;
     p.mD;
     p.xD;
     p.zD;
     p.kDaa;
     p.kDbb;
     p.alphaD;
     p.xP;
     p.zP;
     p.alphaP;
     p.mH;
     p.xH;
     p.zH;
     p.kHaa;
     p.kHbb;
     p.kHyy;
     p.alphaH;
     p.rR;
     p.mR;
     p.rF;
     p.mF];
