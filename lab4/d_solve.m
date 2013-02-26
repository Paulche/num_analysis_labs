function root = d_solve(from, till, num_steps)
  y = f;

  for n = 1:num_steps
    middle      = (from + till)/2;

    middle_val  = y(middle);
    left_val    = y(from);

    if middle_val == 0
      break;
    else
      if sign(left_val) == sign(middle_val)
        from = middle;
      else
        till = middle;
      end
    end
  end

  root = middle;
end
