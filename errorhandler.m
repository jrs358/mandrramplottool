% function errorhandler(app, error, minfield, maxfield)
%
% Displays error messages of a standard format in the Memristor and
% RRAM Plot Tool GUI.
%
% This code is part of the Memristor and RRAM Plot Tool Program.
% By John Smith, 2020

function errorhandler(app, error, minfield, maxfield)

switch error
    
    case 1
        str = sprintf('''%s'' must be greater than ''%s''.'...
            , maxfield, minfield);
        uialert(app.MemristorandRRAMPlotTool, str, 'Warning',...
            'Icon','warning');
        
    case 2
        str = sprintf('''%s'' must be a positive number.', minfield);
        uialert(app.MemristorandRRAMPlotTool, str, 'Warning',...
            'Icon','warning');
        
    case 3
        str = sprintf('''%s'' must be a positive integer.', minfield);
        uialert(app.MemristorandRRAMPlotTool, str, 'Warning',...
            'Icon','warning');
end