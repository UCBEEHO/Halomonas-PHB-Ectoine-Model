function z= latest8(tspan, y0,  Mue_max_1 , Mue_max_2 ,  vx1x4 , k_x1x4  ,kp_x1x4,  vx2x5 ,k_x2x5 , kp_x2x5  ,vx1x5 , k_x1x5  ,kp_x1x5 , vx2x4  ,  k_x2x4 , kp_x2x4 , Yx4_x1,  Yx5_x1 , Yx5_x2 , k_s2,  ym1,  a,  kI2 ,n1 ,n2 , k_s1 ,k_s     )


%g = @(t,y) odefcn(t,y,a, b, Yx_s , Yp_s , Mue_max ,  m, X_max); 

%opts = odeset('NonNegative',[1:4]);
opt = odeset('MaxStep', 1e-3, 'Events',@event);
%opt = odeset('MaxStep', 1e-4);
[t,z,te,ye,ie]=ode45 (@(t,y) odefcn8(t,y,   Mue_max_1 , Mue_max_2 ,  vx1x4 , k_x1x4  ,kp_x1x4,  vx2x5 ,k_x2x5 , kp_x2x5  ,vx1x5 , k_x1x5  ,kp_x1x5 , vx2x4  ,  k_x2x4 , kp_x2x4 , Yx4_x1,  Yx5_x1 , Yx5_x2 , k_s2,  ym1,  a,  kI2 ,n1 ,n2 , k_s1 ,k_s    ), tspan, y0,opt);  