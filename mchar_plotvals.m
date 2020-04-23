% function mchar_plotvals(app, plottype)
%
% Plots the data in the app.vals.mchar structure on the GUI axes.
% 
% This code is part of the Memristor and RRAM Plot Tool Program.
% By John Smith, 2020

function mchar_plotvals(app, plottype)

close all

% Assign values in the app.vals.mchar structure to variables
q = app.vals.mchar.q;
t = app.vals.mchar.t;

phiq = app.vals.mchar.phiq;
Rq = app.vals.mchar.Rq;
it = app.vals.mchar.it;
qt = app.vals.mchar.qt;
phit = app.vals.mchar.phit;
vt = app.vals.mchar.vt;
Rt = app.vals.mchar.Rt;

linewidth = 1.5;
legendLocation = 'best';
legendOrientation = 'vertical';

% Sets the target axes to an external figure window, or an internal GUI
% axes.
if plottype == "internal"
    HysLoopAxis = app.TopLeftAxis;
    RHysAxis = app.TopRightAxis;
    TimeAxis = app.BottomLeftAxis;
    ChargeAxis = app.BottomRightAxis;
    
    HysLoopAxis.cla
    RHysAxis.cla
    TimeAxis.cla
    ChargeAxis.cla
    
    reset(HysLoopAxis);
    reset(RHysAxis);
    reset(TimeAxis);
    reset(ChargeAxis);
   
elseif plottype == "external"
    figure(1)
    HysLoopAxis = axes();
    figure(2)
    RHysAxis = axes();
    figure(3)
    TimeAxis = axes();
    figure(4)
    ChargeAxis = axes();
end

legend(HysLoopAxis, 'off');
legend(RHysAxis, 'off');

hold(HysLoopAxis,'on')
hold(RHysAxis,'on')
hold(TimeAxis,'on')
hold(ChargeAxis,'on')

xlabel(HysLoopAxis, 'i(t)')
ylabel(HysLoopAxis, 'v(t)')

xlabel(RHysAxis, 'i(t)')
ylabel(RHysAxis, 'R(t)')

xlabel(TimeAxis, 'Time (units of \pi)')

xlabel(ChargeAxis, 'Charge')

plot(HysLoopAxis, it, vt, 'r', 'linewidth', linewidth);
plot(RHysAxis, it, Rt, 'k', 'linewidth', linewidth);

if app.VoltageCheckBox_mchar.Value == 1
    plot(TimeAxis, t/pi, vt, 'r', 'linewidth', linewidth, ...
        'DisplayName','Voltage (V)');
end

if app.CurrentCheckBox_mchar.Value == 1
    plot(TimeAxis, t/pi, it, 'g', 'linewidth', linewidth, ...
        'DisplayName','Current (A)');
end

if app.FluxCheckBox_mchar.Value == 1
    plot(TimeAxis, t/pi, phit, 'm', 'linewidth', linewidth, ...
        'DisplayName','Flux (Vm)');
end

if app.ChargeCheckBox_mchar.Value == 1
    plot(TimeAxis, t/pi, qt, 'k', 'linewidth', linewidth, ...
        'DisplayName','Charge (C)');
end

if app.ResistanceCheckBox_mchar.Value == 1
    plot(TimeAxis, t/pi, Rt, 'b', 'linewidth', linewidth, ...
        'DisplayName','Resistance (\Omega)');
end

if app.ResistanceCheckBox2_mchar.Value == 1
    plot(ChargeAxis, q, Rq, 'r', 'linewidth', linewidth, ...
        'DisplayName','Resistance (\Omega)');
end

if app.FluxCheckBox2_mchar.Value == 1
    plot(ChargeAxis, q, phiq, 'b', 'linewidth', linewidth, ...
        'DisplayName','Flux (Vm)');
end

legend(TimeAxis, 'location', legendLocation, ...
    'orientation', legendOrientation);
legend(ChargeAxis, 'location', legendLocation, ...
    'orientation', legendOrientation);