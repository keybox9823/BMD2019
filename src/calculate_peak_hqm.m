function [peak_hqm] = calculate_peak_hqm(x, p)
% CALCULATE_PEAK_HQM - Returns the maximum value of the HQM transfer function
% magnitude if the system is closed loop stable or an order of magnitude
% larger value based on the largest closed loop poles are if the system is
% closed loop unstable.
%
% Syntax: peak_hqm = objective(unknowns, bicycle, speed)
%
% Inputs:
%   x - Vector of the optimization parameters
%   p - structure containing the principal parameters
% Outputs:
%   peak_hqm - Maximum scalar value of the HQM magnitude.

display(sprintf(repmat('=', 1, 79)))
display('Values passed into the objective function:')
x'

p = update_principal_parameters(p, x);
b = convert_principal_to_benchmark(p);

[A, B, C, D] = whipple_pull_force_abcd(b, b.v);

data = generate_data('Browser', b.v, ...
                     'simulate', false, ...
                     'forceTransfer', {}, ...
                     'fullSystem', false, ...
                     'stateSpace', {A, B, C, D}, ...
                     'display', 0);

lateral_dev_loop = minreal(tf(data.closedLoops.Y.num, data.closedLoops.Y.den));

if ~isstable(lateral_dev_loop)
    peak_hqm = max(10, 100 * max(real(pole(lateral_dev_loop))));
else
    num = data.handlingMetric.num;
    den = data.handlingMetric.den;
    freqs = linspace(0.01, 40, 200);
    [mag, ~, ~] = bode(tf(num, den), freqs);
    peak_hqm = max(mag);
end

display('Value of the objective function:')
peak_hqm
display(sprintf(repmat('=', 1, 79)))
