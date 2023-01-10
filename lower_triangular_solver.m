function X0 = lower_triangular_solver(A,b)
  n = length(b);
  X0 = ones(n, 1);
  X0(1,1) = b(1)/A(1,1);
  for i=2:n
        S=b(i);
        for j=i-1:-1:1
              S+=-A(i,j)*X0(j);
        endfor
        X0(i,1) = S/A(i,i);
  endfor
endfunction 