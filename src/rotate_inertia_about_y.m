function rotated_inertia = rotate_inertia_about_y(inertia, angle)

    %Returns inertia tensor rotated through angle about the Y axis.
%
    %Parameters
    %----------
    %I : ndarray, shape(3,)
        %An inertia tensor.
    %angle : float
        %Angle in radians about the positive Y axis of which to rotate the
        %inertia tensor.

    ca = cos(angle);
    sa = sin(angle);
    C = [ca, 0.0, -sa;
         0.0, 1., 0.0;
         sa, 0.0, ca];
    rotated_inertia = C * inertia * C';
