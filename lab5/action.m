function action()
  num                         = 20;
  [A b]                       = generate_equation(24,16);
  start_x                     = ones(7,1)


  %
  % TODO: Find way to check convergency of matrix
  %
  % c = check_convergency(A)

  % Iterative method
  [iter_solution iter_plot]   = iter_method(A,b,start_x,num);

  iter_residual = b - A*iter_solution;

  iter_norm_residual = norm(iter_residual,1);


  % Seidel method
  [seidel_solution seidel_plot]   = seidel_method(A,b,start_x,num);

  seidel_residual = b - A*seidel_solution;

  seidel_norm_residual = norm(seidel_residual,1);

  % Exact solution
  exact = A \ b;

  iter_error = abs(iter_solution - exact);

  seidel_error = abs(seidel_solution - exact);

  % Relative error
  dA = A;

  for i = 1:length(A)
    dA(i,i) = A(i,i)*0.9;
  end

  dA = norm(dA - A);

  dx = iter_error;
  db = norm(b * 0.01);

  rel_error =  cond(A)/(1 - cond(A)*dA*norm(A))*(dA/norm(A) + db/norm(b));


  % Output plots
  subplot(2,1,1);
  H = plot(0:num, iter_plot)
  legend(H, arrayfun(@(x)(sprintf('x%d',x)),1:7,'UniformOutput',false));
  ylabel('Iterative method','fontsize',20,'fontweight','b');

  subplot(2,1,2);
  H = plot(0:num, seidel_plot)
  legend(H, arrayfun(@(x)(sprintf('x%d',x)),1:7,'UniformOutput',false));
  ylabel('Seidel method','fontsize',20,'fontweight','b');

  A, b

  % Errors
  iter_error, norm(iter_error), seidel_error, norm(seidel_error)

  % Output iter values
  iter_residual, iter_norm_residual

  % Output seidel values
  seidel_residual, seidel_norm_residual

  rel_error

  % Results
  seidel_solution, iter_solution, exact
end
