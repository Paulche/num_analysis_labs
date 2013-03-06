function b = check_convergency(A)
  len = length(A);

  for i = 2:len
    acc = sum(abs(A(1:i-1,i)))

    flag = acc > A(i,i)

    if flag
      b = false
      return
    end
  end

  b = true
end
