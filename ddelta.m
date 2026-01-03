% Constants
a = 1;
P = (3*pi)/2;
n = 5000;

%% --- Figure 5 Logic ---

% Define K space
K = linspace((-4*pi)/a, (4*pi)/a, n);
K(K==0) = eps; % Avoid division by zero

% Calculate Energy (Eq 21b)
% Python: (P/(K*a))*np.sin(K*a) + np.cos(K*a)
e5 = (P ./ (K.*a)) .* sin(K.*a) + cos(K.*a);

% Generate Ka space
Ka_list = K * a;

% Plotting Figure 5
figure('Name', 'Figure 5 (Delta)', 'Color', 'w', 'Position', [100, 100, 1200, 700]);
ax = gca;
plot(Ka_list, e5, 'LineWidth', 1.5);
hold on;

% Horizontal lines
yline(1, 'r', 'LineWidth', 0.75);
yline(-1, 'r', 'LineWidth', 0.75);

% Axis styling
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
box off;

% Labels
xlabel('Ka', 'Color', 'g', 'FontSize', 14);
ylabel('e', 'Color', 'g', 'FontSize', 14, 'Rotation', 0);

%% --- Figure 6 Logic ---

% Filter data: -1 <= e5 <= 1 AND K >= 0
valid_idx = (e5 >= -1) & (e5 <= 1) & (K >= 0);

% Extract valid K values
K_valid = K(valid_idx);

% Calculate e6
e6 = (K_valid.^2) / (pi^2);

% Define linear space for k
k_new = linspace(0, (4*pi)/a, length(e6));

% Generate ka space
ka_list = k_new * a;

% Theoretical dashed line
y_dashed = (k_new.^2) / (pi^2);

% Plotting Figure 6
figure('Name', 'Figure 6 (Delta)', 'Color', 'w');
scatter(ka_list, e6, 10, 'filled');
hold on;
% plot(ka_list, y_dashed, '--'); % Equivalent dashed line code

xlabel('ka', 'Color', 'g', 'FontSize', 14);
ylabel('e', 'Color', 'g', 'FontSize', 14, 'Rotation', 0);
grid on;
