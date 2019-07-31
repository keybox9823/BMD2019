function is_equal(a, b)
if (abs(a-b) < 1e4*eps(min(abs(a),abs(b))))
else
    fprintf("%f is not equal to %f\n", a, b)
end
