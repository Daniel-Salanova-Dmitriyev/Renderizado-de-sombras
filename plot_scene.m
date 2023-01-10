function plot_scene(surface_points, sun_point, shadows, plane_coefficients)
  
  a = plane_coefficients(1);
  b = plane_coefficients(2);
  c = plane_coefficients(3);
  d = plane_coefficients(4);
  min_x = min(shadows(:, 1));
  max_x = max(shadows(:, 1));
  min_y = min(shadows(:, 2));
  max_y = max(shadows(:, 2));
  
  x1=min_x:0.5:max_x;
  y1=min_y:0.5:max_y;

  [X1,Y1]=meshgrid(x1,y1);
  Z = (d-a*X1-b*Y1)/c;

  for x = 1:length(x1)
    for y = 1:length(y1)
      Z(y,x) = (d-a*x1(x)-b*y1(y))/c;
    endfor
  endfor
  
  figure
  plot3(surface_points(:,1), surface_points(:, 2), surface_points(:, 3));
  hold on;
  scatter3(sun_point(1), sun_point(2), sun_point(3), "o");
  hold on;
  plot3(shadows(:, 1), shadows(:, 2), shadows(:, 3), "-", "Color", "k");
  hold on;
  mesh(X1,Y1,Z);
  hold off;
  xlabel ("X");
  ylabel ("Y");
  zlabel ("Z");
  title ("Gráfico de la escena");
endfunction