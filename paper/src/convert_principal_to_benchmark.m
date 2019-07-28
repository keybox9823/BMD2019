function benchmark_par = convert_principal_to_benchmark(principal_par)

    p = principal_par;

    % other
    p.g
    p.v
    % primary geometry
    p.w
    p.c
    p.lam
    % rear frame
    p.mD
    p.xD
    p.yD
    p.zD
    p.kD11
    p.kD22
    p.kD33
    p.alphaD
    % person
    p.xP
    p.yP
    p.zP
    p.alphaP
    % front frame
    p.mH
    p.xH
    p.yH
    p.zH
    p.kH11
    p.kH22
    p.kH33
    p.alphaH
    % rear wheel
    p.rR
    p.mR
    % front wheel
    p.rF
    p.mF


    % other
    b.g = p.g
    b.v = p.v
    % primary geometry
    b.w = p.w;
    b.c = p.c;
    b.lam = p.lam;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % rear frame [B]
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    b.mB = p.mD + p.mP;
    Bcom = com_from_two(p.mD, [p.xD, p.yD, p.zD], p.mP, [p.xP, p.yD, p.zP]);
    b.xB = Bcom(1);
    b.yB = Bcom(2);
    b.zB = Bcom(3);

    % symmetry is assumed about the XZ plane
    ID123 = mD*diag([kD11^2, p.kD22^2, p.kD33^2]);
    IP123 = mP*diag([kP11^2, p.kP22^2, p.kP33^2]);
    IP = rotate_inerita_about_y(IP123, alphaP);
    ID = rotate_inerita_about_y(ID123, alphaD);
    IB = sum_central_inertias(ID123, [xD, yD, zD], IP, [xP, yP, zP]);
    b.IBxx = IB(1, 1);
    b.IByy = IB(2, 2);
    b.IBzz = IB(3, 3);
    b.IBxz = IB(1, 3);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % front frame [H]
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    b.mH = p.mH;
    b.xH = p.xH:
    b.yH = p.yH;
    b.zH = p.zH:

    % symmetry is assumed about the XZ plane
    IH123 = mH*diag([kH11^2, p.kH22^2, p.kH33^2]);
    IH = rotate_inertia_about_y(IH123, alphaH);
    b.IHxx = IH(1, 1);
    b.IHyy = IH(2, 2);
    b.IHzz = IH(3, 3);
    b.IHxz = IH(1, 3);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % rear wheel [R]
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    b.rR = p.rR
    b.mR = p.mR
    % wheel is symmetric about XY, YZ, and XZ planes
    b.IRxx =
    b.IRyy =
    b.IRzz =

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % front wheel [F]
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    b.rF = p.rR;
    b.mF = p.mR;
    b.IFxx =
    b.IFyy =
    b.IFzz =

    benchmark = b;
