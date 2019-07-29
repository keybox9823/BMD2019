function [lb, ub] = bounds()
% BOUNDS - Returns the lower and upper bounds of the free parameters.

lb = [
 -inf; % w
 -inf; % c
 -pi/2; % lam
 0.0; % mD
 -inf; % xD
 -inf; % zD
 -inf; % kDxx
 -inf; % kDzz
 -pi/2; % alphaD
 -inf; % xP
 -inf; % zP
 -pi/2; % alphaP
 0.0; % mH
 -inf; % xH
 -inf; % zH
 -inf; % kHxx
 -inf; % kHyy
 -inf; % kHzz
 -pi/2; % alphaH
 0.127; % rR (10" OD wheel)
 1.0; % mR
 0.127; % rF (10" OD wheel)
 1.0]; % mF

ub = [
 inf; % w
 inf; % c
 pi/2; % lam
 inf; % mD
 inf; % xD
 0.0; % zD
 inf; % kDxx
 inf; % kDzz
 pi/2; % alphaD
 inf; % xP
 0.0; % zP
 pi/2; % alphaP
 inf; % mH
 inf; % xH
 0.0; % zH
 inf; % kHxx
 inf; % kHyy
 inf; % kHzz
 pi/2; % alphaH
 inf; % rR
 inf; % mR
 inf; % rF
 inf]; % mF
