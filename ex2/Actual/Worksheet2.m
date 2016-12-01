%% Worksheet 2, Scientific Computing Lab
clear
close all
clc
%% Part a
%
t = 0:0.01:10;
p = 10./(1 + 9*exp(-t));

figure('Name','Part a')
plot(t,p);
%}
%% Part b
% Input
%
prompt = {'Enter f(y, t)', 'Enter y0:', 'Enter dt:', 'Enter tStart:', 'Enter tEnd:'};
dlg_title = 'Input';
num_lines = 1;
defaultans = {'(1 - y/10)*y', '1','1', '0', '5'};
options.Resize = 'off';
answer = inputdlg(prompt,dlg_title,num_lines,defaultans,options);

f       = answer{1};
y0      = str2num(answer{2});
dt      = str2num(answer{3});
tStart  = str2num(answer{4});
tEnd    = str2num(answer{5});
clear prompt dlg_title num_lines defaultans options answer

% Solution
disp('Part b Solutions:')
Identifier = {'ExplicitEuler' 'Heun' 'RK4'};
for iIdentifier = 1 : length(Identifier)
    Method = str2func(Identifier{iIdentifier});
    y.Partb.(Identifier{iIdentifier}) = Method( f, y0, dt, tStart, tEnd);
    disp(Identifier{iIdentifier})
    disp(y.Partb.(Identifier{iIdentifier}))
end
%}
%% Part c
% Discretizing the given exact Solution
%
tStart = 0;
tEnd = 5;
dt = [1, 1/2, 1/4, 1/8];
nStep   = (tEnd - tStart)./dt + 1;
TimeString = {'One' 'OneHalf' 'OneQuarter' 'OneEigth'};

% Approximation and Error with various time steps
f = '(1 - y/10)*y';
y0 = 1;

%f = 't^2';
%y0 = 10;
for iTimeStep = 1 : length(dt)
    dTime   = tStart : dt(iTimeStep) : tEnd;
   y.Exact.(TimeString{iTimeStep}).Value = 10./(1 + 9*exp(-dTime));
%    p = 10+(t).^3./3;
%    y.Exact.(TimeString{iTimeStep}).Value = p;
    
end

Identifier = {'ExplicitEuler' 'Heun' 'RK4'};

for iIdentifier = 1 : length(Identifier)
    Method = str2func(Identifier{iIdentifier});
    figure('Name',Identifier{iIdentifier})
    plot(t, p);
    axis([tStart tEnd -inf inf]) %Range of the axis
    Legend = cell(length(dt), 1); 
    for iTimeStep = 1 : length(dt)
        hold on;
        y.(Identifier{iIdentifier}).(TimeString{iTimeStep}).Value   = ...
            Method( f, y0, dt(iTimeStep), tStart, tEnd);
        y.(Identifier{iIdentifier}).(TimeString{iTimeStep}).Error   = ...
            Error(y.(Identifier{iIdentifier}).(TimeString{iTimeStep}).Value, ...
            y.Exact.(TimeString{iTimeStep}).Value, dt(iTimeStep), tEnd);
        plot(tStart : dt(iTimeStep) : tEnd, y.(Identifier{iIdentifier}).(TimeString{iTimeStep}).Value,'*');
        Legend{iTimeStep}=strcat(Identifier{iIdentifier},TimeString{iTimeStep});
        hold off;
    end
    Legend = ['Exact'; Legend];
    legend(Legend, 'Location','northeastoutside');
end
%}
%% Part d
% Error Reduction Factor (Reciprocal of Change in Error Factor)
%
nRatio = length(dt) - 1;
for iIdentifier = 1 : length(Identifier)
    for iRatio = 1 : nRatio
        RatioIdentifier = strcat('ErrorReduction', TimeString{iRatio}, 'To' , TimeString{iRatio + 1});
        y.(Identifier{iIdentifier}).(RatioIdentifier)       = ...
            y.(Identifier{iIdentifier}).(TimeString{iRatio})    .Error/ ...
            y.(Identifier{iIdentifier}).(TimeString{iRatio + 1}).Error;
    end
end
%}
%% Part e
% Approximate Error
%
[Min, MinIndex] = min(dt);

for iIdentifier = 1 : length(Identifier)
    Method = str2func(Identifier{iIdentifier});
    for iTimeStep = 1 : length(dt) - 1
        yMin = y.(Identifier{iIdentifier}).(TimeString{MinIndex}).Value(1:dt(iTimeStep)/Min:end);
        y.(Identifier{iIdentifier}).(TimeString{iTimeStep}).ErrorApproximate   = ...
            Error(y.(Identifier{iIdentifier}).(TimeString{iTimeStep}).Value, ...
            yMin, dt(iTimeStep), tEnd);
    end
end
%}
%%  Tables
%
RowTopicString = {'del T'; 'error'; 'error reduction'; 'error approximate'};
Identifier = {'ExplicitEuler' 'Heun' 'RK4'};

for iIdentifier = 1 : length(Identifier)
    for iTimeStep = 1 : length(dt)
        y.(Identifier{iIdentifier}).Table.Error(iTimeStep) = ...
            y.(Identifier{iIdentifier}).(TimeString{iTimeStep}).Error;
    end
    for iRatio = 1 : nRatio
        RatioIdentifier = strcat('ErrorReduction', TimeString{iRatio}, 'To' , TimeString{iRatio + 1});
        y.(Identifier{iIdentifier}).Table.ErrorReduction(iRatio) = ...
            y.(Identifier{iIdentifier}).(RatioIdentifier);
    end
    y.(Identifier{iIdentifier}).Table.ErrorReduction = ...
        [ y.(Identifier{iIdentifier}).Table.ErrorReduction, NaN];
    for iTimeStep = 1 : length(dt) - 1
        y.(Identifier{iIdentifier}).Table.ErrorApproximate(iTimeStep) = ...
            y.(Identifier{iIdentifier}).(TimeString{iTimeStep}).ErrorApproximate;
    end
    y.(Identifier{iIdentifier}).Table.ErrorApproximate = ...
        [ y.(Identifier{iIdentifier}).Table.ErrorApproximate, 0];
    
    TransposedTable = table(dt', ....
        y.(Identifier{iIdentifier}).Table.Error',...
        y.(Identifier{iIdentifier}).Table.ErrorReduction', ...
        y.(Identifier{iIdentifier}).Table.ErrorApproximate');
    TableArray = table2array(TransposedTable);
    y.(Identifier{iIdentifier}).Table.Value = ...
        array2table(TableArray.','RowNames',RowTopicString,...
        'VariableNames',{'First' 'Second' 'Third' 'Fourth'});
    disp(Identifier{iIdentifier})
    disp(y.(Identifier{iIdentifier}).Table.Value)
end
%}
%% Question 2: Plotting Absolute value of Max Error with varying time steps
%
Identifier = {'ExplicitEuler' 'Heun' 'RK4'};
X = 1:4;
y.(Identifier{iIdentifier}).ErrorMaxTrend = zeros(1, length(dt));
for iIdentifier = 1 : length(Identifier)
    Method = str2func(Identifier{iIdentifier});
    figure('Name', strcat('Error ', Identifier{iIdentifier}));
    axis([tStart tEnd -inf inf]) %Range of the axis
    Legend = cell(length(dt), 1);
    nRatio = length(dt) - 1;
    for iTimeStep = 1 : length(dt)
        hold on;
        y.(Identifier{iIdentifier}).(TimeString{iTimeStep}).ErrorDefinition   = ...
            y.(Identifier{iIdentifier}).(TimeString{iTimeStep}).Value - ...
            y.Exact.(TimeString{iTimeStep}).Value;
        plot(tStart : dt(iTimeStep) : tEnd, ...
            y.(Identifier{iIdentifier}).(TimeString{iTimeStep}).ErrorDefinition,'*');
        Legend{iTimeStep}=strcat(Identifier{iIdentifier},TimeString{iTimeStep});
        hold off;
        y.(Identifier{iIdentifier}).(TimeString{iTimeStep}).ErrorMax = ...
            max(abs(y.(Identifier{iIdentifier}).(TimeString{iTimeStep}).ErrorDefinition));
        end
    legend(Legend, 'Location','northeastoutside');
    figure('Name', strcat('Max Error Reduction Trend ', Identifier{iIdentifier}));
    for iRatio = 1 : nRatio
    y.(Identifier{iIdentifier}).ErrorMaxReduction = ...
            y.(Identifier{iIdentifier}).(TimeString{iRatio}).ErrorMax / ...
            y.(Identifier{iIdentifier}).(TimeString{iRatio + 1}).ErrorMax;
    end
    plot(X, y.(Identifier{iIdentifier}).ErrorMaxReduction,'*');   
end
%}
%% Question 3: Plotting Absolute value of Max Error with varying time steps
%