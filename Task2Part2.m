% =======================================================================
% Least Squares Fit of concentration of Atmospheric CO2  measured monthly
% from Alert, NWT, Canada from Jan 1986 to Dec 2020
%
% Authors: Aidan Sirbu, Katie Brown
% ========================================================================
% Model used for least squares:
% f(t)=c1+c2*t+c3*cos(2pi*t)+c4*sin(2pi*t)+c5*cos(4pi*t)+c6*t^2

% month represents a column matrix with number of months from
% Jan 1986 to Dec 2020
month = [];
for i=1:420
   month = [month; i/12];
end

% CO2Matrix represents a column matrix with the CO2 levels in ppv by month
% from Jan 1986 to Dec 2020
CO2=[350.99;351.5;352.67;352.95;353.54;351.64;346.84;340.44;339.27;344.16;348.54;349.37;351.44;352.09;353.88;353.56;354.52;352.8;348.21;341.02;340.4;346.04;349.19;352.53;354.05;355.41;356.15;357.17;356.87;356.21;348.44;344.08;344.37;349.51;354.82;357.45;356.32;358.84;360.08;359.51;359.52;357.69;351.54;345.73;346.15;349.87;354.69;358.28;359.28;360.11;360.76;360.58;360.19;357.69;351.26;346.19;347.08;350.79;355.73;358.42;360.48;362.03;360.92;361.86;361.44;359.86;354.11;347.52;348.64;352.91;357.5;359.93;362.1;362.15;363.73;362.58;363.11;361.59;353.87;346.93;347.78;352.16;356.74;361.02;361.86;361.86;362.7;363.45;362.97;360.94;354.12;348.05;348.42;353.35;356.97;360.31;363.01;364.11;364.83;364.43;364.28;362.1;356.7;350.84;350.46;356.03;360.01;363.27;363.48;364.9;366.7;366.32;365.74;364.32;358.58;352.04;353.45;357.25;362.31;365.65;366.94;366.69;367.63;368.16;369.13;367.33;361.53;356.14;354.52;360.11;363.82;365.54;368.35;369.07;368.17;368.85;369.5;367.6;360.86;355.18;356.04;360.73;364.77;367.84;369.45;370.13;370.9;370.56;371.56;369.31;364.51;357.45;360.58;364.06;368.75;371.63;372.68;373.88;373.8;374.13;374.54;372.09;364.85;359.13;359.7;364.98;369.83;372.67;373.27;375.18;374.87;375.46;376.22;374.06;366.57;360.82;361.83;367.57;370.6;373.42;376.2;375.98;376.49;377.54;377.73;374.86;367.43;361.71;363.47;367.8;373.23;374.48;376.7;377.48;378.32;378.79;379.07;376.01;370.82;364.11;365.43;370.31;374.11;378.06;379.09;379.41;380.95;381.45;382.45;381.1;373.85;368.04;368.63;372.36;377.8;380.08;382.53;382.41;381.66;383.28;383.64;382.68;374.7;368.75;368.65;373.46;378.58;381.76;384.2;384.38;384.21;385.38;385.39;383.87;377.13;370.67;372.17;375.27;381.78;385.13;385.04;385.61;386.88;387.81;388.71;387.61;380.95;373.96;374.88;378.95;384.29;387.24;388.37;388.9;389.77;389.85;389.59;387.94;380.86;373.03;375.44;380.74;384.36;388.34;390.2;390.96;392.63;392.38;392.73;389.54;383.07;376.52;377.53;381.58;388.22;390.02;393.32;392.46;393.6;394.02;394.12;391.71;385.17;377.99;377.76;383.07;387.37;391.91;392.48;393.63;393.83;395.15;395.75;394.62;386.41;380.8;382.35;387.12;391.52;394.17;395.39;396.26;397.63;398.26;398.55;395.19;388.69;380.68;381.95;388.08;393.75;396.72;399.04;398.77;399.41;400.08;400.37;397.4;389.66;382.72;386.1;390.5;396.11;399.44;401.05;401.47;401.5;402.01;403.37;400.76;394.93;387.85;387.98;394.36;399.95;401.8;403.77;404.61;406.87;405.08;405.7;403.62;396.34;389.84;390.43;395.65;399.43;404.16;404.25;408.19;408.05;407.05;407.65;404.77;397.74;391.25;392.56;397.4;404.12;406.48;406.74;408.98;409.07;409.6;409.29;406.63;399.37;393.54;394.49;400.75;405.84;409.45;412.48;412.4;413.66;413.56;413.77;410.63;403.55;396.85;397.76;402.64;407.83;410.28;413.46;413.38;413.99;415.8;415.22;413.51;406.29;398.59;400.2;404.2;409.87;413.51;414.63;415.86;417.55;418.39;417.49;414.22;407.74;400.83;402.28;407.54;412.74;416.33;418.37;420.53;419.46;420.43;420.15;416.71;410.3;403.38;406.82;410.73;416.65;419.5];

% Define coefficient matrix
A = zeros(420,6);
for i=1:420
    A(i,1) = 1;
    A(i,2) = month(i,:);
    A(i,3) = cos(2*pi*month(i,:));
    A(i,4) = sin(2*pi*month(i,:));
    A(i,5) = cos(4*pi*month(i,:));
    A(i,6) = month(i,:).^2;
end

% Normal equations
ATA = transpose(A)*A;
ATb = transpose(A)*CO2;
c = ATA\ATb;

% RMSE
r = CO2-A*c;
SE = 0;
for i=1:420
    SE = SE + r(i)^2;
end
RMSE = (SE/420)^(0.5);

% Plotting
scatter(month, CO2);
hold on
leastSquaresFunc = @(t)348.6987+1.2389*t+0.6070*cos(2*pi*t)+7.1601*sin(2*pi*t)+2.5665*cos(4*pi*t)+0.0197*t.^2;
fplot(leastSquaresFunc);
xlim([-5 40]);