function x = free_parameters(principal_parameters)
% FREE_PARAMETERS - Returns the free parameter vector, x, given the full set
% of principal parameters.
p = principal_parameters;
x = [
p.w;
p.c;
p.lam;
p.mD;
p.xD;
p.zD;
p.kDxx;
p.kDzz;
p.alphaD;
p.xP;
p.zP;
p.alphaP;
p.mH;
p.xH;
p.zH;
p.kHxx;
p.kHyy;
p.kHzz;
p.alphaH;
p.rR;
p.mR;
p.rF;
p.mF];
