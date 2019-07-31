function is_equal(a, b, n)
if (abs(a-b) < 1e4*eps(min(abs(a),abs(b))))
else
    fprintf("%s: %f is not equal to expected %f\n", n, a, b)
end
