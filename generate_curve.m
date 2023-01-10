function H = generate_curve(domain)
  x = [];
  y = [];
  z = [];
  
  for t = domain
    x = [x  sqrt(t)*cos(t)]; #Añadimos a lo anterior de x el nuevo valor
    y = [y  sqrt(t)*sin(t)]; # Añadimos a lo anterior de y el nuevo valor
    z = [z  10]; # z siempre es 10, es constante
  endfor
  H = [x; y; z]';
endfunction