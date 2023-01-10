function [U,L,P,Q]=LUFacPM(A)
  n=length(A(:,1));
  L=zeros(size(A));
  P=eye(size(A));
  Q=eye(size(A));
  
  for k=1:n-1
  mx=k;
  cx=k;
  for i=k:n
    for j=k:n
      if (abs(A(i,j))>abs(A(mx,cx)));
        mx=i;
        cx=j;
      endif
    endfor    
  endfor  
  if (A(mx,cx)==0);
    m=1;
  else
    %permutacion de filas (de todas las matrices necesarias)
    aF=A(k,:);
    A(k,:)=A(mx,:);
    A(mx,:)=aF;
    
    lF=L(k,:);
    L(k,:)=L(mx,:);
    L(mx,:)=lF;

    p=P(k,:);
    P(k,:)=P(mx,:);
    P(mx,:)=p;
    
    %permutacion de columnas (en todas las matrices necesarias
    aC=A(:,k);
    A(:,k)=A(:,cx);
    A(:,cx)=aC; 
    
    lC=L(:,k);
    L(:,k)=L(:,cx);
    L(:,cx)=lC; 
    
    q=Q(:,k);
    Q(:,k)=Q(:,cx);
    Q(:,cx)=q; 
  endif
  for i=k+1:n
    m=A(i,k)/A(k,k);
    L(i,k)=m;
    A(i,k)=0;
    for j=k+1:n
      A(i,j)=A(i,j)-m*A(k,j);
    endfor
  endfor  
 endfor
  U=A;
  L=L+eye(size(A)); 
endfunction