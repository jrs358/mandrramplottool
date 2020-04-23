% function rram_plotvals(app, plottype)
%
% Plots the data in the app.vals.rram structure on the GUI axes.
% 
% This code is part of the Memristor and RRAM Plot Tool Program.
% By John Smith, 2020


function rram_plotvals(app, plottype)

close all

% Assign values in the app.vals.rram structure to variables
q_or_phi = app.vals.rram.x;
t = app.vals.rram.t;

constrel = app.vals.rram.constrel;
Rq_Gphi = app.vals.rram.Rq_Gphi;
Rt_Gt = app.vals.rram.Rt_Gt;
it = app.vals.rram.it;
qt = app.vals.rram.qt;
phit = app.vals.rram.phit;
vt = app.vals.rram.vt;

linewidth = 1.5;
legendLocation = 'best';
legendOrientation = 'vertical';

% Sets the target axes to an external figure window, or an internal GUI
% axes.
if plottype == "internal"
    Charge_FluxAxis = app.TopLeftAxis;
    CurrentVoltageAxis = app.TopRightAxis;
    TimeAxis1 = app.BottomLeftAxis;
    TimeAxis2 = app.BottomRightAxis;
    
    Charge_FluxAxis.cla
    CurrentVoltageAxis.cla
    TimeAxis1.cla
    TimeAxis2.cla
    
    reset(Charge_FluxAxis);
    reset(CurrentVoltageAxis);
    reset(TimeAxis1);
    reset(TimeAxis2);
   
elseif plottype == "external"
    figure(1)
    Charge_FluxAxis = axes();
    figure(2)
    CurrentVoltageAxis = axes();
    figure(3)
    TimeAxis1 = axes();
    figure(4)
    TimeAxis2 = axes();
end

hold(Charge_FluxAxis,'on')
hold(CurrentVoltageAxis,'on')
hold(TimeAxis1,'on')
hold(TimeAxis2,'on')

if app.rramTechnology == "ChargeControlled"
    xlabel(Charge_FluxAxis, 'Charge');
    xlabel(CurrentVoltageAxis, 'Current')
elseif app.rramTechnology == "FluxControlled"
    xlabel(Charge_FluxAxis, 'Flux');
    xlabel(CurrentVoltageAxis, 'Voltage')
end

xlabel(TimeAxis1, 'Time (units of \pi)')

xlabel(TimeAxis2, 'Time (units of \pi)')

if app.ConstEqCheckBox_rram.Value == 1
    plot(Charge_FluxAxis, q_or_phi, constrel, 'k', ...
        'linewidth', linewidth, 'DisplayName','Constitutive Relation');
end

if app.CondResCheckBox_x_rram.Value == 1
    if app.rramTechnology == "ChargeControlled"
        plot(Charge_FluxAxis, q_or_phi, Rq_Gphi, 'r', ...
            'linewidth', linewidth, 'DisplayName','Resistance (\Omega)');
    elseif app.rramTechnology == "FluxControlled"
        plot(Charge_FluxAxis, q_or_phi, Rq_Gphi, 'r', ...
            'linewidth', linewidth, 'DisplayName','Conductance (S)');
    end
end

if app.viHysCheckBox_rram.Value == 1
    if app.rramTechnology == "ChargeControlled"
        plot(CurrentVoltageAxis, it, vt, 'k', ...
            'linewidth', linewidth, 'DisplayName', 'Voltage (V)');
    elseif app.rramTechnology == "FluxControlled"
        plot(CurrentVoltageAxis, vt, it, 'k', ...
            'linewidth', linewidth, 'DisplayName', 'Current (A)');
    end
end

if app.R_GHysCheckBox_rram.Value == 1
    if app.rramTechnology == "ChargeControlled"
        plot(CurrentVoltageAxis, it, Rt_Gt, 'r', ...
            'linewidth', linewidth, 'DisplayName', 'Resistance (\Omega)');
    elseif app.rramTechnology == "FluxControlled"
        plot(CurrentVoltageAxis, vt, Rt_Gt, 'r', ...
            'linewidth', linewidth, 'DisplayName', 'Conductance (S)');
    end
end

if app.ChargeCheckBox1_rram.Value == 1
    plot(TimeAxis1, t/pi, qt, 'r', ...
        'linewidth', linewidth, 'DisplayName', 'Charge (C)');
end

if app.CurrentCheckBox1_rram.Value == 1
    plot(TimeAxis1, t/pi, it, 'b', ...
        'linewidth', linewidth, 'DisplayName', 'Current (A)');
end

if app.FluxCheckBox1_rram.Value == 1
    plot(TimeAxis1, t/pi, phit, 'm', ...
        'linewidth', linewidth, 'DisplayName', 'Flux (Vm)');
end

if app.VoltageCheckBox1_rram.Value == 1
    plot(TimeAxis1, t/pi, vt, 'g', ...
        'linewidth', linewidth, 'DisplayName', 'Voltage (V)');
end

if app.CondResCheckBox_t1_rram.Value == 1
    if app.rramTechnology == "ChargeControlled"
        plot(TimeAxis1, t/pi, Rt_Gt, 'k', ...
            'linewidth', linewidth, 'DisplayName', 'Resistance (\Omega)');
    elseif app.rramTechnology == "FluxControlled"
        plot(TimeAxis1, t/pi, Rt_Gt, 'k', ...
            'linewidth', linewidth, 'DisplayName', 'Conductance (S)');
    end
end

if app.ChargeCheckBox2_rram.Value == 1
    plot(TimeAxis2, t/pi, qt, 'r', ...
        'linewidth', linewidth, 'DisplayName', 'Charge (C)');
end

if app.CurrentCheckBox2_rram.Value == 1
    plot(TimeAxis2, t/pi, it, 'b', ...
        'linewidth', linewidth, 'DisplayName', 'Current (A)');
end

if app.FluxCheckBox2_rram.Value == 1
    plot(TimeAxis2, t/pi, phit, 'm', ...
        'linewidth', linewidth, 'DisplayName', 'Flux (Vm)');
end

if app.VoltageCheckBox2_rram.Value == 1
    plot(TimeAxis2, t/pi, vt, 'g', ...
        'linewidth', linewidth, 'DisplayName', 'Voltage (V)');
end

if app.CondResCheckBox_t2_rram.Value == 1
    if app.rramTechnology == "ChargeControlled"
        plot(TimeAxis2, t/pi, Rt_Gt, 'k', ...
            'linewidth', linewidth, 'DisplayName', 'Resistance (\Omega)');
    elseif app.rramTechnology == "FluxControlled"
        plot(TimeAxis2, t/pi, Rt_Gt, 'k', ...
            'linewidth', linewidth, 'DisplayName', 'Conductance (S)');
    end
end

legend(Charge_FluxAxis, 'location', legendLocation,...
    'orientation', legendOrientation);
legend(CurrentVoltageAxis, 'location', legendLocation, ...
    'orientation', legendOrientation);
legend(TimeAxis1, 'location', legendLocation,...
    'orientation', legendOrientation);
legend(TimeAxis2, 'location', legendLocation,...
    'orientation', legendOrientation);
