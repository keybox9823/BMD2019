function I = sum_central_inertias(m1, com1, I1, m2, com2, I2)
% SUM_CENTRAL_INERTIAS - Returns the combined inertia of two bodies.
%
% Syntax : I = sum_central_inertias(m1, com1, I1, m2, com2, I2)
%
% Inputs:
%   m1 - 1x1 double, mass of the first body
%   com1 - 3x1 double, center of mass of the first body
%   I1 - 3x3 double, central inertia tensor of the first body
%   m2 - 1x1 double, mass of the second body
%   com2 - 3x1 double, center of mass of the second body
%   I2 - 3x3 double, central inertia tensor of the second body
% Outputs:
%   I - combined central inertia tensor of both bodies
com = com_from_two(m1, com1, m2, com2);
I = parallel_axis(I1, m1, com-com1) +  parallel_axis(I2, m2, com-com2);
