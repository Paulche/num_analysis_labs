function y = runge_lagr(xo,yo,x)
  len = length(xo);
  r_sum = 0;

  for i = 1:len
    r_mul = 1;

    for j = 1:len
      if j == i
        continue;
      else
        r_mul = r_mul * (x - xo(j))/(xo(i) - xo(j));
      end
    end

    r_sum = r_sum + yo(i)*r_mul;
  end

  y = r_sum;
end
