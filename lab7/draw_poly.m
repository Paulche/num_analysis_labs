function straight_y = draw_poly(n,pos)
  [x y] = linput();

  straight_x = x
  straight_y = poly(x,y,n)

  % Draw plots
  subplot(3,2,2*pos);
  plot(x,y,'r.',straight_x,straight_y,'b');
  legend(sprintf('Variable %d',n), 'Straight');
end
