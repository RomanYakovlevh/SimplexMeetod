ul1 = [  0,   -40, -50, 0, 0, 0;
       672,    6,   10, 1, 0, 0; % see on mitte uhikmaatriks
        24, 0.25, 0.15, 0, 1, 0; % aga lisamutujad et ebavordsused kirjeldada vorraldusena
        42,    0,  1.5, 0, 0, 1]; % x1=87 x2=15

ul2 = [ 0, -30, -80, 0, 0, 0, 0;
       12,   1,  1,  1, 0, 0, 0;
       48,   4,  6   0, 1, 0, 0;
        3,   1,  0,  0 ,0,-1, 0;
        5,   0,  1,  0, 0, 0,-1]; % x1=3 x2=6

ul3 = [0,  -4, -3;
       9,  3,  1;
       1, -1,  1;
       6,  1,  1]; % x1=2 x2=3 x6=3

ul4 = [ 0,  4,  12, -9,  1, -4;
       20,  4,   3, -2, -1,  2;
       18, -1,  -4,  1,  0,  3;
       16,  2,   1,  1, -1,  1]; % x2=0 x5=~6.14 zmax =~ -37.85

ul5=[ 0  -2 -3  1; 
     16   2 -1 -2; 
     18   3  2 -3; 
     24  -1  3  4]; % x1=6/11 x2=90/11 x3=0 x4=254/4 x6=0

ul6 = [0,  -1,   2,  3,  1,  1, -2;
       12,  1,   2,  2,  1,  1,  0;
       18,  1,   2,  1,  1,  2,  1;
       24,  3,   6,  2,  1,  3,  0]; % x1=6 x3=3 x6=3

ul7 = [  0, 2, 3, 1,  0, 0;
       750, 3, 5, 2, -1, 0;
       550, 2, 3, 2,  0, 0;
       650, 3, 1, 4,  0, 1]; % x1=0 x2=100 x3=125 x4=0 x5=50

ul8 = [0, -1, -2, -1, -1, -1;
       8,  1,  4,  2,  2,  1;
       6, -1,  2, -2,  2,  1;
       2,  1,  2,  0,  2, -1]; % x1=1 x2=0 x3=0 x4=2 x5=3

ul9 = [ 0, 1, -5, -1, 3, 0;
       27, 1, -1,  0, 3, 1;
        8, 1, -6, -1, 5, 0;
       20, 1, -2, -1, 2, 1];  % x2=27/11 x4=50/11 x5=174/11

SimplexMeetod;
fprintf(' ul1 x1=87 x2=15\n');
simplex_algoritm_public(ul1);
kahe_faasiline_simplex_algoritm_public(ul1);
fprintf('\n\n ul2 x1=3 x2=6\n');
simplex_algoritm_public(ul2);
kahe_faasiline_simplex_algoritm_public(ul2);
fprintf('\n\n ul3 x1=2 x2=3 x6=3\n');
simplex_algoritm_public(ul3);
kahe_faasiline_simplex_algoritm_public(ul3);
fprintf('\n\n ul4 x2=0 x5=~6.14 zmax =~ -37.85\n');
simplex_algoritm_public(ul4);
kahe_faasiline_simplex_algoritm_public(ul4);
fprintf('\n\n ul5 x1=6/11 x2=90/11 x3=0 x4=254/4 x6=0\n');
simplex_algoritm_public(ul5);
kahe_faasiline_simplex_algoritm_public(ul5);
fprintf('\n\n ul6 x1=6 x3=3 x6=3\n');
simplex_algoritm_public(ul6);
kahe_faasiline_simplex_algoritm_public(ul6);
fprintf('\n\n ul7 x1=0 x2=100 x3=125 x4=0 x5=50\n');
simplex_algoritm_public(ul7);
kahe_faasiline_simplex_algoritm_public(ul7);
fprintf('\n\n ul8 x1=1 x2=0 x3=0 x4=2 x5=3\n');
simplex_algoritm_public(ul8);
kahe_faasiline_simplex_algoritm_public(ul8);
fprintf('\n\n ul9 x2=27/11 x4=50/11 x5=174/11\n');
simplex_algoritm_public(ul9);
kahe_faasiline_simplex_algoritm_public(ul9);
