function [solution serial] = seidel_method(A,b,x,n)
  serial = [];
  len = length(x);
  serial(1,:) = x;

  for iter = 1:n
    for i = 1:len
      x(i) = (b(i) - sum(A(i,1:i-1)*x(1:i-1)) - sum(A(i,i+1:end)*x(i+1:end))) / A(i,i);
    end
    serial(iter+1,:) = x;
  end

  solution = x;
end
