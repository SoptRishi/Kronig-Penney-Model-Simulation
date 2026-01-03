% Constants
a = 1;      % Coefficient a
b = 1;      % Coefficient b
P = (3*pi)/2; 
n = 10000;  % Number of points

% Equations
Q = sqrt((2*P)/(a*b));

%% --- Figure 5 Logic ---

% Define K space
K = linspace((-4*pi)/a, (4*pi)/a, n);

% Handle potential division by zero if K contains 0 (replace with epsilon)
K(K==0) = eps; 

% Calculate Energy (Eq 21a) using element-wise operations (.)
% Python: ((Q**2 - K**2)/(2*Q*K))*np.sinh(Q*b)*np.sin(K*a) + np.cosh(Q*b)*np.cos(K*a)
term1 = ((Q^2 - K.^2) ./ (2*Q.*K)) .* sinh(Q*b) .* sin(K*a);
term2 = cosh(Q*b) .* cos(K*a);
e5 = term1 + term2;

% Generate Ka space
Ka_list = K * a;

% Plotting Figure 5
figure('Name', 'Figure 5', 'Color', 'w', 'Position', [100, 100, 1200, 700]);
ax = gca;
plot(Ka_list, e5, 'LineWidth', 1.5);
hold on;

% Draw horizontal lines at y=1 and y=-1
yline(1, 'r', 'LineWidth', 0.75);
yline(-1, 'r', 'LineWidth', 0.75);

% Axis adjustments to match the Python "centered spines" look
ax.XAxisLocation = 'origin'; % Move x-axis to center
ax.YAxisLocation = 'origin'; % Move y-axis to center
box off;                     % Turn off the box border
ax.TickDir = 'out';          % Ticks pointing out

% Labels
xlabel('Ka', 'Color', 'g', 'FontSize', 14);
% Note: MATLAB titles/ylabels handle position differently, placing simple label here
ylabel('e', 'Color', 'g', 'FontSize', 14, 'Rotation', 0);

%% --- Figure 6 Logic ---

% Filter data: -1 <= e5 <= 1 AND K >= 0
% We find the indices that satisfy the condition
valid_idx = (e5 >= -1) & (e5 <= 1) & (K >= 0);

% Extract the specific K values that met the condition to calculate e6
K_valid = K(valid_idx);

% Calculate e6: (K^2)/(pi^2)
e6 = (K_valid.^2) / (pi^2);

% Define linear space for k based on the length of found valid points
k_new = linspace(0, (4*pi)/(a+b), length(e6));

% Generate x-axis data: k(a+b)
ka_kb_list = k_new * (a + b);

% Theoretical dashed line (y)
y_dashed = (k_new.^2) / (pi^2);

% Plotting Figure 6
figure('Name', 'Figure 6', 'Color', 'w');
scatter(ka_kb_list, e6, 10, 'filled'); % 10 is marker size
hold on;
% plot(ka_kb_list, y_dashed, '--'); % The commented out code from Python

xlabel('k(a+b)', 'Color', 'g', 'FontSize', 14);
ylabel('e', 'Color', 'g', 'FontSize', 14, 'Rotation', 0);
grid on;