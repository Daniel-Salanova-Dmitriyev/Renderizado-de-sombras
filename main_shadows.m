
%%%%%%%% PARÁMETROS DEL PROBLEMA %%%%%%%%

domain1 = linspace(0, 8*pi, 200);
sun_point1 = [10, 0, 15];
sun_point2 = [10, 0, 35];
plane_coefficients = [40,40,200,-11];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
curve_points = generate_curve(domain1);
shadows = generate_shadows(curve_points, sun_point1, plane_coefficients);
plot_scene(curve_points, sun_point1, shadows, plane_coefficients);


shadows2 = generate_shadows(curve_points, sun_point2, plane_coefficients);
plot_scene(curve_points, sun_point2, shadows2, plane_coefficients);
