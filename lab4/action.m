function action()

  % Draw plot
  x = 0.1:0.1:4;
  y = f;
  H = plot(x,y(x));

  dsolution = d_solve(1,2,15)
  nsolution = n_solve(15,1.1)
  fzero_solution = fzero(f,[1 2])
  
  derror = abs(dsolution - fzero_solution)
  nerror = abs(nsolution - fzero_solution)
end
