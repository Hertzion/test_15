% Define initial position and target for x-axis
x_initial_position = 1;
x = 1;
x_target_position = 18;
% Define initial position and target for y-axis
y_initial_position = 3;
y = 3;
y_target_position = 24;

% Define motion and measurement noise
motion_noise = 0.1;
measurement_noise = 0.1;

% Initialize belief (mean and covariance) for x-axis
x_ip = x_initial_position;
sigma = 1;
% Initialize belief (mean and covariance) for y-axis
y_ip = y_initial_position;
sigma = 1;

% Simulate motion and measurement updates
num_iterations = 50;

for t = 1:num_iterations
    % Simulate motion update
    motion = randn * motion_noise;
    x_initial_position = x_initial_position + motion;
    
    % Simulate measurement update
    measurement = x_initial_position + randn * measurement_noise;
    
    % Prediction step (motion update)
    x_ip_bar = x_initial_position;
    sigma_bar = sigma + motion_noise^2;
    
    % Update step (measurement update)
    K = sigma_bar / (sigma_bar + measurement_noise^2);
    x_ip = x_ip_bar + K * (measurement - x_ip_bar);
    sigma = (1 - K) * sigma_bar;
end

for t = 1:num_iterations
    % Simulate motion update
    motion = randn * motion_noise;
    y_initial_position = y_initial_position + motion;
    
    % Simulate measurement update
    measurement = y_initial_position + randn * measurement_noise;
    
    % Prediction step (motion update)
    y_ip_bar = y_initial_position;
    sigma_bar = sigma + motion_noise^2;
    
    % Update step (measurement update)
    K = sigma_bar / (sigma_bar + measurement_noise^2);
    y_ip = y_ip_bar + K * (measurement - y_ip_bar);
    sigma = (1 - K) * sigma_bar;
end

% Display initial position
disp('Initial position');
disp(['for x: ' num2str(x)]);
disp(['for y: ' num2str(y)]);
% Display final estimated position
disp('Final estimated position');
disp(['for x: ' num2str(x_ip)]);
disp(['for y: ' num2str(y_ip)]);

% Display your name and registration number
disp('NAME : OLUSHOLA OLUWATOSIN KATHRYN');
disp('REG.NO : 2019/249541');