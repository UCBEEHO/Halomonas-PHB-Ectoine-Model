function dydt= luong(t,y)
global   Mue_max_1  Mue_max_2   vx1x4  k_x1x4  kp_x1x4  vx2x5 k_x2x5  kp_x2x5  vx1x5  k_x1x5  kp_x1x5  vx2x4    k_x2x4  kp_x2x4  Yx4_x1  Yx5_x1  Yx5_x2  k_s2  ym1  a  kI2 n1 n2  k_s1 k_s 

dydt =zeros(5,1);



if y(3) < 0 
    disp("h");
end    



Mue_1=     Mue_max_1  * y(1)^n1/( y(1)^n1 +  k_s1 ^n1) *(1- (y(1)/ym1) ^a) ;
Mue_2=   Mue_max_2 *  y(2)^n2/( y(2)^n2 +  k_s ^n2) *(y(2)/(k_s2 + y(2) + y(2)^2/kI2)) ;
qx1_x4 = vx1x4 * y(1)/(k_x1x4  +y(1)) * kp_x1x4/ (kp_x1x4 + y(4));
qx2_x5 = vx2x5 * y(2)/(k_x2x5 +y(2)) * kp_x2x5/ (kp_x2x5 + y(5));
qx1_x5 = vx1x5 * y(1)/(k_x1x5 +y(1)) * kp_x1x5/ (kp_x1x5 + y(5));
qx2_x4 = vx2x4 * y(2)/(k_x2x4 +y(2)) * kp_x2x4/ (kp_x2x4 + y(4));

% ODE equations including biomasss formation rate, product formation rate
% and substrate consumption.
% n1=1.26 and a= 1.1


  if y(1) <= 0.001
    dydt(1) = 0;
  else

dydt(1) =   - (qx1_x4 /Yx4_x1 + qx1_x5/Yx5_x1 ) * y(3); 
  end


  if y(2) <= 0.001
    dydt(2) = 0;
  else
    dydt(2) =    - (qx2_x4 /Yx4_x1 + qx2_x5/Yx5_x2 ) * y(3);
  end

 if y(3) <= 0.001
    dydt(3) = 0;
 else
 dydt(3) =      (Mue_1 + Mue_2 ) *  y(3);
 end

 if y(3) <= 0.001
    dydt(3) = 0;
 
 else
 dydt(4) =   (qx1_x4 + qx2_x4 )  * y(3)  ;
 end

   dydt(5) = (qx1_x5 + qx2_x5 ) *y(3); 

end
 