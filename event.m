function [position,isterminal,direction] = event(t,y)
  position = y(3)-0.001; % The value that we want to be zero
    isterminal = 1;  % Halt integration 
  direction = 0;   % The zero can be approached from either direction
end