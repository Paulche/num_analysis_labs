function r = action()
  [n c x t dh dt ot u1 u2 u3 u4 f] = linput();

  for j = 0:n-1
    j_e = j+1;

    r(1,j_e) = u3(j);
  end
  r(1,n+1) = u4(n);

  for i = 0:n
    i_e = i+1;
    r(i_e,1) = u1(i);
    r(i_e,2) = u1(i) + dt*u2(i);
  end

  for i = 1:n-1
    for j = 2:n
      j_e = j+1;
      i_e = i+1;

      r(i_e,j_e) = - r(i_e,j_e - 2) + ot * r(i_e + 1,j_e-1) - 2*(ot - 1)*r(i_e,j_e-1) + ot*r(i_e-1,j_e-1) + dt^2 * f(i);
    end
  end

  [X Y] = meshgrid(t(1):dt:t(2),x(1):dh:x(2));

  surf(X,Y,r);
end
