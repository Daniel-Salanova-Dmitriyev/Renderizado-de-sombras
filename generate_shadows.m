function shadows = generate_shadows(curve_points, sun_point, plane_coefficients)
  [n_rows, n_columns] = size(curve_points);
  
  A = zeros(3,3);
  b = zeros(3,1);
  
  x = [];
  y = [];
  z = [];

  for i = 1:n_rows
    ## En cada fila de tanto la matriz A como de b incoporaremos los valores correspondientes detallados en las ecuaciones dentro de la documentación.
    punto = curve_points(i, :);
    A(1,:) = [(sun_point(:, 2) - punto(:, 2)), (-sun_point(:, 1) + punto(:, 1)), 0 ];
    A(2,:) = [0,(sun_point(:,3) - punto(:,3)), (-sun_point(:,2) + punto(:,2))];
    A(3,:) = [plane_coefficients(:,1), plane_coefficients(:,2), plane_coefficients(:,3)];
    
    b(1,1) = sun_point(:,1) * (sun_point(:,2) - punto(:,2)) - sun_point(:,2) * (sun_point(:,1) - punto(:,1));
    b(2,1) = sun_point(:,2) * (sun_point(:,3) - punto(:,3)) - sun_point(:,3) * (sun_point(:,2) - punto(:,2));
    b(3,1) = plane_coefficients(:,4);

    ###Resolvemos PAQ = LU;
    [U3,L3,P3,Q3] = LUFacPM(A);
    Pb3 = P3*b;
    Y3 =lower_triangular_solver(L3,Pb3); ##Encargado de resolver Ly = Pb
    Z3 =upper_triangular_solver(U3,Y3); ##Encargado de resolver Uz = y
    X3 = Q3*Z3; ##Encargado de resolver x = QZ

    x = [x X3(1,1)];
    y = [y X3(2,1)];
    z = [z X3(3,1)];
  endfor
  shadows = [x; y; z]';
  
endfunction