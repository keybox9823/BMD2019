function com = com_from_two(m1, com1, m2, com2)
% COM_FROM_TWO - Returns a vector giving the center of mass of two combined
% bodies.
%
% Inputs:
%   m1 - 1x1 double, mass of body 1
%   com1 - 3x1 double, Cartesian coordinates of body 1's center of mass
%   m2 - 1x1 double, mass of body 2
%   com2 - 3x1 double, Cartesian coordinates of body 2's center of mass
%
% Outputs:
%   com - 3x1 double, Cartesian coordinates of the combined bodies center of
%         mass
m = m1 + m2;
com = (m1.*com1 + m2.*com2)./m;
