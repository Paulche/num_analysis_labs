function [A b] = generate_equation(group, num)
  seed  = group + num;

  rand('seed',seed);

  A = rand(7);

  b = 10 * rand(7,1);

  Au=triu(A);

  Al=tril(A);

  Ad=diag(diag(A));

  su=sum(sum(abs(Au)));
  sl=sum(sum(abs(Al)));
  Su=sum(abs(Au));
  Sl=sum(abs(Al));

  sigma=5;

  O=ones(7);

  Ou=triu(O);

  S6=diag(sigma*(Su./Sl));

  At=sigma*((Al+Ou)./(Au'+Ou));

  neo=rem(num,2);

  mode=rem(num,3);

  if (mode==0)
    Al=(sigma*su/sl)*Al;
  end

  if (mode==1)
    Al=S6*Al;
  end

  if (mode==2)
    Al=At.*Al;
  end

  A=Al+Ad+Au;

  ma=max(max(abs(A)));

  if (ma>1000)
    A=0.08*A;
  end

  A=0.5*A+2.75*diag(diag(A));
end
