function y = mapprox(x,p)
  y = [];
  p_size = length(p);
  
  for i = 1:length(x)
    r = 0;
    for j = 1:length(p)
     r = r + p(j) * x(i)^(p_size-j);
    end
    y = [y r];
  end 
end
