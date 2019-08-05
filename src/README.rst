Explanation of the principal parameters
=======================================

The "principal parameters" are an alternative and extended presentation of the
Whipple-Carvallo model parameters presented in Meijaard2007. The primary change
is to express inertia tensors in terms of principal moments of inertia and the
corresponding orientation of the principal axes relative to the coordinate
system in Meijaard2007. Secondly, we use the principal radii of gyration to
decouple the mass and inertia parameters.

primary geometry, gravity, and speed
------------------------------------

These are the same as in the benchmark bicycle paper.

- w : wheelbase [m]
- c : trail [m]
- lam : steer axis tilt [m]
- g : acceleration due to gravity [m/s^2]
- v : forward speed [m/s]

rear frame
----------
- mD : mass of the rear frame (without rider) [kg]
- xD : X CoM location [m]
- yD : Y CoM location [m]
- zD : Z CoM location [m]
- kDaa : Central principal radius of gyration
- kDbb : Central principal radius of gyration
- kDyy : Central principal radius of gyration
- alphaD : Angle between the X and 1 axes, positive about Y

person
------
- lP : length of person [m]
- wP : longitudinal width of person [m]
- mP : mass of person [kg]
- xP : mass center [m]
- yP : mass center [m]
- zP : mass center [m]
- kPaa : maximal central principal radius of gyration of person [m]
- kPbb : intermediate central principal radius of gyration of person [m]
- kPyy : minimal central principal radius of gyration of person [m]
- alphaP : Angle between the X axis and the maximal principal axis [rad]

front frame
-----------
- mH : mass of front frame (handlebar/fork)
- xH : X mass center [m]
- yH : Y mass center [m]
- zH : Z mass center [m]
- kHaa
- kHbb
- kHyy
- alphaH

rear wheel
----------
- rR : radius of rear wheel [m]
- mR : mass of rear wheel [kg]
- kR11 : Maximal principal radius of gyration, aligned with Y in the case of
  the wheels
- kR22 : Intermediate principal radius of gyration
- kR33 : Minimal principal radius of gyration

front  wheel
------------
- rF : radius of front wheel [m]
- mF : mass of front wheel [kg]
- kF11 : Maximal principal radius of gyration, aligned with Y in the case of
  the wheels
- kF22 : Intermediate principal radius of gyration
- kF33 : Minimal principal radius of gyration
