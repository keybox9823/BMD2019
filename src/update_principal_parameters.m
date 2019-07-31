function p = update_principal_parameters(principal_parameters, x)
% Updates the structure with the values stored in the free parameter vector
% x.

p = principal_parameters;

p.w      = x(1, 1);
p.c      = x(2, 1);
p.lam    = x(3, 1);
p.mD     = x(4, 1);
p.xD     = x(5, 1);
p.zD     = x(6, 1);
p.kD11   = x(7, 1);
p.kD33   = x(8, 1);
p.alphaD = x(9, 1);
p.xP     = x(10, 1);
p.zP     = x(11, 1);
p.alphaP = x(12, 1);
p.mH     = x(13, 1);
p.xH     = x(14, 1);
p.zH     = x(15, 1);
p.kH11   = x(16, 1);
p.kH22   = x(17, 1);
p.kH33   = x(18, 1);
p.alphaH = x(19, 1);
p.rR     = x(20, 1);
p.mR     = x(21, 1);
p.rF     = x(22, 1);
p.mF     = x(23, 1);

% TODO : These can be added as constraints, no? Or these shouldn't be
% principal parameters.
p.zR = -p.rR;
p.xF = p.w;
p.zF = -p.rF;
