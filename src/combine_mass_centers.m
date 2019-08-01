function mass_center = combine_mass_centers(masses, mass_centers)
% COMBINE_MASS_CENTERS - Returns a vector giving the mass center the
% combined bodies.
%
% Syntax: mass_center = combine_mass_centers(masses, mass_centers)
%
% Inputs:
%   masses - 1xn double, masses of the n bodies
%   mass_centers - 3xn double, Cartesian coordinates of the n bodies' mass
%       centers
%
% Outputs:
%   com - 3x1 double, Cartesian coordinates of the combined bodies mass
%       center
mass_center = sum(masses.*mass_centers, 2)./sum(masses);
