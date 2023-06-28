% The Healthier Habits Project
%
% This code will help you to develop better habits by tracking your
% progress.

% Initialize tracking variables

habit1track = 0; % Habit 1 will track people who drink 8 glasses of water per day
habit2track = 0; % Habit 2 will track people who exercise 3+ days per week
habit3track = 0; % Habit 3 will track people who eat healthy 5+ days per week

% Develop user interaction loop

while 1
    disp('Enter a number to track your progress:');
    disp('1 - Drink 8 glasses of water per day');
    disp('2 - Exercise 3+ days per week');
    disp('3 - Eat healthy 5+ days per week');
    
    choice = input('Choice: ');
    
    if choice == 1
        habit1track = habit1track + 1;
        disp(['You have completed habit 1 ' num2str(habit1track) ' times!']);
    elseif choice == 2
        habit2track = habit2track + 1;
        disp(['You have completed habit 2 ' num2str(habit2track) ' times!']);
    elseif choice == 3
        habit3track = habit3track + 1;
        disp(['You have completed habit 3 ' num2str(habit3track) ' times!']);
    else
        disp('Please enter a valid number.');
    end
    
    choice2 = input('Would you like to continue tracking? (y/n) ', 's');
    if choice2 == 'n'
        break;
    end
end

% Calculate total progress

totalprogress = habit1track + habit2track + habit3track;

disp(['Congratulations! You have successfully completed ' num2str(totalprogress) ' healthier habits throughout this project.']);