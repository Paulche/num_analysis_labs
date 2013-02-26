function root = n_solve(num_steps, start)
  y   = f;
  dy  = df;

  x = start;

  for n = 1:num_steps

    if y(x) == 0
      break;
    else
      x = x - y(x)/dy(x);
    end

  end

  root = x;
end
