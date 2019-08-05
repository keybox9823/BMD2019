function [c, ceq] = compute_constraints(x, p, varargin)
% COMPUTE_CONSTRAINTS - Returns the nonlinear inequality and equality
% constraints.
%
% Inputs:
%   x - 23x1 double, free parameters
%   p - structure, default principal parameters
%   real_evals - optional, 12x1 double, real parts of the closed loop
%   (lateral deviation) eigenvalues.
%
% Outputs:
%   c - 25x1 double, inequality constraint values
%   ceq - 0x0 double, equality constraint values

p = update_principal_parameters(p, x);
b = convert_principal_to_benchmark(p);

% Nonlinear inequality constraints
% c(x) <= 0
% TODO : need better explanation of this.
% if this was equality the handelbar would be XZ planar, but if we want
% some IHzz and IHxx (protruding handle bars in Y direction) then this:
c(1, 1) = b.IHyy - sqrt(b.IHxx^2 + b.IHzz^2);
% the person "cross" does not penetrate the ground
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
% zT is a negative value, thus the abs
c(6, 1) = 1*abs(zT)/4 - xT;  % handle max 1/4 accel
c(7, 1) = 3*abs(zT)/4 - p.w + xT;  % handle max 3/4 g braking
% These constraints ensure that if the mass centers are far from the
% associated wheels, that there is sufficient inertial distribution that a
% frame could be constructed between the two points.
c(8, 1) = sqrt((p.xH - p.w)^2 + (p.zH + p.rF)^2) - 2*p.kHyy;
c(9, 1) = sqrt((p.xD - 0.0)^2 + (p.zD + p.rF)^2) - 2*p.kDyy;
c(10, 1) = p.rR + p.rF - p.w;  % wheels can't over lap
c(11, 1) = p.mD + p.mH + p.mR + p.mF - 25.0;  % bicycle mass (D,H,R,F) no more than 25 kg
c(12, 1) = 1.4*p.kDyy - abs(p.zD); % mass can't spread below the ground
c(13, 1) = 1.4*p.kHyy - abs(p.zH); % mass can't spread below the ground
if (size(varargin, 2) > 0)
    real_evals = varargin{1};
else
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
end
% There are only supposed to be 8 eigenvalues, but getting 12 here.
num_evals = length(real_evals)
c(14:14+num_evals-1, 1) = real_evals;

% Equality constraints
% ceq(x) = 0
% These are baked into update_principal_parameters() to reduce the number of
% free parameters.
ceq = [];
