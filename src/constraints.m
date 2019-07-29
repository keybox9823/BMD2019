% c(x) <= 0
% nonlinear
Ihyy - sqrt(IHxx^2 + IHzz^2);
zP + lP / 2 * cos(alphaP);
zP + wP / 2 * sin(alphaP);
zP - lP / 2 * cos(alphaP);
zP - wP / 2 * sin(alphaP);
4*xT/abs(zT) - 1
abs(zT) + xT - w
real(s)  % real part of closed loop eigenvalues must be negative
% linear
rF + rF - w;  % wheels can't over lap
b.mD + mH + mR + mF - 25.0;  % bicycle mass (D,H,R,F) no more than 25 kg

% ceq(x) = 0
IDyy - sqrt(IDxx^2 + IDzz^2)  % frame is planar
IRyy - mR*rR^2  % wheel is a ring
IRxx - IRyy / 2  % wheel is a ring
IRzz - IRyy / 2  % wheel is a ring
IFyy - mF*rF^2  % wheel is a ring
IFxx - IFyy / 2  % wheel is a ring
IFzz - IFyy / 2  % wheel is a ring
