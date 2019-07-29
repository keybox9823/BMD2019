function [lower, upper] = free_par_bounds()
% FREE_PAR_BOUNDS - Returns the lower and upper bounds of the free
% parameters.
%
% Outputs:
%   lower - 23x1 double
%   upper - 23x1 double

bounds = [
  -inf, inf;  % w
  -inf, inf;  % c
 -pi/2, pi/2; % lam
   0.0, inf;  % mD
  -inf, inf;  % xD
  -inf, 0.0;  % zD
  -inf, inf;  % kDxx
  -inf, inf;  % kDzz
 -pi/2, pi/2; % alphaD
  -inf, inf;  % xP
  -inf, 0.0;  % zP
 -pi/2, pi/2; % alphaP
   0.0, inf;  % mH
  -inf, inf;  % xH
  -inf, 0.0;  % zH
  -inf, inf;  % kHxx
  -inf, inf;  % kHyy
  -inf, inf;  % kHzz
 -pi/2, pi/2; % alphaH
 0.127, inf;  % rR (10" OD wheel)
   1.0, inf;  % mR
 0.127, inf;  % rF (10" OD wheel)
   1.0, inf]; % mF

lower = bounds(:, 1);
upper = bounds(:, 1);