function fig = plotSimulationResultSignal(nvpairs)
% plots the simulation result.

% Copyright 2021-2022 The MathWorks, Inc.

arguments
  nvpairs.SimData timetable
  nvpairs.SignalName {mustBeTextScalar}
  nvpairs.PlotParent (1,1)  % matlab.ui.Figure
end

sigName = nvpairs.SignalName;

t = nvpairs.SimData.Time;
y = nvpairs.SimData.(sigName);

lix = nvpairs.SimData.Properties.VariableNames == sigName;
unitStr = nvpairs.SimData.Properties.VariableUnits{lix};

if not(isfield(nvpairs, "PlotParent"))
  fig = figure;
  fig.Position(3:4) = [700 300];  % width height
else
  fig = nvpairs.PlotParent;
end

plot(fig, t, y, LineWidth = 2)
hold on
grid on
xlabel("Time")
title(sigName + " (" + unitStr + ")")

end
