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
c(1, 1) = b.IHyy - sqrt(b.IHxx^2 + b.IHzz^2);
% the person does not penetrate the ground
c(2, 1) = p.zP + p.lP / 2 * cos(p.alphaP);
c(3, 1) = p.zP + p.wP / 2 * sin(p.alphaP);
c(4, 1) = p.zP - p.lP / 2 * cos(p.alphaP);
c(5, 1) = p.zP - p.wP / 2 * sin(p.alphaP);
% the bike doesn't tip forward and backward when braking and accelerating
comT = combine_mass_centers([p.mD, p.mP, p.mH, p.mR, p.mF], ...
                            [[p.xD; p.yD; p.zD], ...
                             [p.xP; p.yP; p.zP], ...
                             [p.xH; p.yH; p.zH], ...
                             [p.xR; p.yR; p.zR], ...
                             [p.xF; p.yF; p.zF]]);
xT = comT(1, 1);
zT = comT(3, 1);
c(6, 1) = 4*xT/abs(zT) - 1;
c(7, 1) = (xT - p.w) / abs(zT) + 1;
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
num_evals = length(real_evals);
c(8:8+num_evals-1, 1) = real_evals;
% linear
% TODO : Should these be formulated as Ax<=b for fmincon, does it matter?
c(8+num_evals, 1) = p.rR + p.rF - p.w;  % wheels can't over lap
c(8+num_evals+1, 1) = p.mD + p.mH + p.mR + p.mF - 25.0;  % bicycle mass (D,H,R,F) no more than 25 kg

% Equality constraints
% ceq(x) = 0
% These are baked into update_principal_parameters() to reduce the number of
% free parameters.
ceq = [];
