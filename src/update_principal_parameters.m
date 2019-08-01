function p = update_principal_parameters(p, x)
% Updates the structure with the values stored in the free parameter vector
% x.
%
% Inputs
%   p - structure, principal parameters key-value mapping
%   x - 23x1 double, free parameter vector
% Outputs
%   p - structure, principal parameters key-value mapping

p.w      = x(1, 1);
p.c      = x(2, 1);
p.lam    = x(3, 1);
p.mD     = x(4, 1);
p.xD     = x(5, 1);
p.zD     = x(6, 1);
p.kDaa   = x(7, 1);
p.kDbb   = x(8, 1);
p.alphaD = x(9, 1);
p.xP     = x(10, 1);
p.zP     = x(11, 1);
p.alphaP = x(12, 1);
p.mH     = x(13, 1);
p.xH     = x(14, 1);
p.zH     = x(15, 1);
p.kHaa   = x(16, 1);
p.kHbb   = x(17, 1);
p.kHyy   = x(18, 1);
p.alphaH = x(19, 1);
p.rR     = x(20, 1);
p.mR     = x(21, 1);
p.rF     = x(22, 1);
p.mF     = x(23, 1);

% NOTE : These are functionally equality constraints.
p.zR = -p.rR;
p.xF = p.w;
p.zF = -p.rF;
p.kDyy = (p.kDaa^4 + p.kDbb^4)^(1/4);  % frame is planar
% rear wheel is a ring
p.kR11 = b.rR;
p.kR22 = p.kRyy/2;
p.kR33 = p.kRyy/2;
% front wheel is a ring
p.kF11 = b.rF;
p.kF22 = p.kFyy/2;
p.kF33 = p.kFyy/2;
