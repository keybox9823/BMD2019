function I = parallel_axis(Ic, m, d)
% PARALLEL_AXIS - Returns and inertia tensor about a new point.
% Syntax : I = parallel_axis(Ic, m, d)
% Inputs:
%   Ic - 3x3 double, The moment of inertia about the center of mass of the
%        body with respect to an orthogonal coordinate system.
%   m - 1x1 double, The mass of the body.
%   d - 3x1 double, The distances along the three ordinates that located the new point
%       relative to the center of mass of the body.
%
% Outputs:
%   I : 3x3 double, The moment of inertia of a body about a point located by
%   the distances in d.
a = d(1, 1);
b = d(2, 1);
c = d(3, 1);
dMat = [b**2 + c**2,      -a * b,      -a * c;
             -a * b, c**2 + a**2,      -b * c;
             -a * c,      -b * c, a**2 + b**2];
I = Ic + m * dMat;
