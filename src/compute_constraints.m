function [c, ceq] = compute_constraints(x, p)
% COMPUTE_CONSTRAINTS - Returns the nonlinear inequality and equality
% constraints.
%
% Inputs:
%   x - 23x1 double, free parameters
%   p - structure, default principal parameters
%
% Outputs:
%   c - 15x1 double, inequality constraint values
%   ceq - 7x1 double, equality constraint values

p = update_principal_parameters(p, x);
b = convert_principal_to_benchmark(p);

% Inequality constraints
% c(x) <= 0
% nonlinear
% if this was equality the handelbar would be XZ planar, but if we want
% some IHzz and IHxx (protruding handle bars in Y direction) then this:
% TODO : need better explanation of this.
% TODO : Should we express in terms of kH11, kH22, kH33?
c(1, 1) = b.IHyy - sqrt(b.IHxx^2 + b.IHzz^2);
% the person does not penetrate the ground
c(1, 2) = p.zP + p.lP / 2 * cos(p.alphaP);
c(1, 3) = p.zP + p.wP / 2 * sin(p.alphaP);
c(1, 4) = p.zP - p.lP / 2 * cos(p.alphaP);
c(1, 5) = p.zP - p.wP / 2 * sin(p.alphaP);
% the bike doesn't tip forward and backward when braking and accelerating
comT = combine_mass_centers([p.mD, p.mP, p.mH, p.mR, p.mF], ...
                            [[p.xD; p.yD; p.zD], ...
                             [p.xP; p.yP; p.zP], ...
                             [p.xH; p.yH; p.zH], ...
                             [p.xR; p.yR; p.zR], ...
                             [p.xF; p.yF; p.zF]]);
xT = comT(1, 1);
zT = comT(3, 1);
c(1, 6) = 4*xT/abs(zT) - 1;
c(1, 7) = (xT - p.w) / abs(zT) + 1;
% real part of closed loop eigenvalues must be negative
[A, B, C, D] = whipple_pull_force_abcd(b, b.v);
data = generate_data('Browser', b.v, ...
                     'simulate', false, ...
                     'forceTransfer', {}, ...
                     'fullSystem', false, ...
                     'stateSpace', {A, B, C, D}, ...
                     'display', 0);
lateral_dev_loop = minreal(tf(data.closedLoops.Y.num, ...
                              data.closedLoops.Y.den));
real_evals = real(pole(lateral_dev_loop));
c(1, 8) = real_evals(1);
c(1, 9) = real_evals(2);
c(1, 10) = real_evals(3);
c(1, 11) = real_evals(4);
c(1, 12) = real_evals(5);
c(1, 13) = real_evals(6);
% linear
% TODO : Should these be formulated as Ax<=b for fmincon, does it matter?
c(1, 14) = p.rR + p.rF - p.w;  % wheels can't over lap
c(1, 15) = p.mD + p.mH + p.mR + p.mF - 25.0;  % bicycle mass (D,H,R,F) no more than 25 kg

% Equality constraints
% ceq(x) = 0
ceq = [];
