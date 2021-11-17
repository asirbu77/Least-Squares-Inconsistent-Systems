% Create 3000x3000 matrix of random numbers
rng('default')
randomMatrix = randi(100,3000,3000);

% Concatenate randomMatrix for 6000x3000 matrix A where first 3000 rows are
% random and second 3000 rows repeat the first 3000
A = [randomMatrix; randomMatrix];

% Create 6000x1 random vector b
b = randi(100,6000,1);

% Solve system
x = A\b;

% Normal equations
ATA = transpose(A)*A;
ATb = transpose(A)*b;
% Least square solution vector c
c = ATA\ATb;

% RMSE from regular solution
rR = b - A*x;
sR = 0;
for i=1:6000
    sR = sR + rR(i).^2;
end
RMSEreg = (sR/6000)^(0.5);

% RMSE from Least Squares solution
rLS = b - A*c;
sLS = 0;
for i=1:6000
    sLS = sLS + rLS(i).^2;
end
RMSEls = (sLS/6000)^(0.5);