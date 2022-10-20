SimplexMeetod;
%{
Ulesanne 1.

    z = -x1 + 5x2 +  x3 +  x4 + 0x5 -> max

         x1 -  x2 + 0x3 + 3x4 +  x5 = 27
         x1 - 6x2 -  x3 + 5x4 + 0x5 =  8
         x1 - 2x2 -  x3 + 2x4 +  x5 = 20

            x1,x,x3,x4,x5 >= 0
%}

A1 = [ 0, 1, -5, -1, 3, 0;
       27, 1, -1,  0, 3, 1;
        8, 1, -6, -1, 5, 0;
       20, 1, -2, -1, 2, 1];

V1 = kahe_faasiline_simplex_algoritm_public(A1);
lahenduskaik_format_public(V1);

%{
Ulesanne 2.

    z = 30x1 + 80x2

         x1 +  x2 <= 12
        4x1 + 6x2 <= 48
               x1 >=  3
               x2 >=  5
%}

A2 = [  0, -30, -80, 0, 0, 0, 0;
       12,   1,  1,  1, 0, 0, 0;
       48,   4,  6   0, 1, 0, 0;
        3,   1,  0,  0 ,0,-1, 0;
        5,   0,  1,  0, 0, 0,-1];

V2 = kahe_faasiline_simplex_algoritm_public(A2);
lahenduskaik_format_public(V2);
