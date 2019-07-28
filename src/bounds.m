function lb, ub = bounds()
% BOUNDS - Returns the lower and upper bounds of the free parameters.

lb = [
 nan; % w
 nan; % c
 -pi/2; % lam
 0.0; % mD
 nan; % xD
 nan; % zD
 nan; % kDxx
 nan; % kDzz
 -pi/2; % alphaD
 nan; % xP
 nan; % zP
 -pi/2; % alphaP
 0.0; % mH
 nan; % xH
 nan; % zH
 nan; % kHxx
 nan; % kHyy
 nan; % kHzz
 -pi/2; % alphaH
 0.127; % rR (10" OD wheel)
 1.0; % mR
 0.127; % rF (10" OD wheel)
 1.0]; % mF

ub = [
 nan; % w
 nan; % c
 pi/2; % lam
 nan; % mD
 nan; % xD
 0.0; % zD
 nan; % kDxx
 nan; % kDzz
 pi/2; % alphaD
 nan; % xP
 0.0; % zP
 pi/2; % alphaP
 nan; % mH
 nan; % xH
 0.0; % zH
 nan; % kHxx
 nan; % kHyy
 nan; % kHzz
 pi/2; % alphaH
 nan; % rR
 nan; % mR
 nan; % rF
 nan]; % mF
