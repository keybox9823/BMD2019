function rotated_inertia = rotate_inertia_about_y(inertia, angle)
% ROTATE_INERTIA_ABOUT_Y - Returns inertia tensor rotated through angle
% about the Y axis.
%
% Inputs:
%   inertia - 3x3 double, inertia tensor
%   angle - 1x1 double, Angle in radians about the positive Y axis of which
%           to rotate the inertia tensor.
ca = cos(angle);
sa = sin(angle);
C = [ca, 0.0, -sa;
     0.0, 1., 0.0;
     sa, 0.0, ca];
rotated_inertia = C * inertia * C';
