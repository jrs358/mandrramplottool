% function rram_calcvals(app)
%
% Calculates RRAM simulation data based on input from the GUI,
% and stores it in a structure for global access within the app.
% 
% This code is part of the Memristor and RRAM Plot Tool Program.
% By John Smith, 2020

function rram_calcvals(app)

% Clear any prior simulation data
clear app.vals.rram

% Obtain inputs from the GUI and assign them to variables
B = app.BreakpointField_rram.Value;

xmin = app.xminField_rram.Value;
xmax = app.xmaxField_rram.Value;
nx = app.nxField_rram.Value;

x = linspace(xmin, xmax, nx); % Create a linearly spaced vector of values

tmin = app.tminField_rram.Value;
tmax = app.tmaxField_rram.Value;
nt = app.ntField_rram.Value;
t = linspace(tmin, tmax, nt);

Aslider = app.AmplitudeSlider_rram.Value;
Amin = app.MinAmpField_rram.Value;
Amax = app.MaxAmpField_rram.Value;

% Calculate the excitation amplitude based on GUI inputs. 'Aslider' 
% varies from 0 to 1 depending on the position of the slider, from 
% left to right
A = Amin + (Aslider*(Amax-Amin));

Omegaslider = app.AngleSlider_rram.Value;
Omegamin = app.MinAngleField_rram.Value;
Omegamax = app.MaxAngleField_rram.Value;

Omega = Omegamin+(Omegaslider*(Omegamax-Omegamin));
app.AngleLabel_rram.Text = string(Omega) + ' rad/s';

Omegat = Omega*t;

% Select the calculations to perform on the input data, based on the
% selected technology
if app.rramTechnology == "ChargeControlled"
    app.AmpLabel_rram.Text = string(A) + ' A';
    R1 = 2500;
    R0 = 6000;
    
    % Constitutive eqn
    constrel = R0*x + 0.5*(R1-R0)*(abs(x + B)-abs(x - B)); 
    
    % Charge dependent resistance
    Rq_Gphi = R0 + 0.5*(R1-R0)*(sign(x + B) - sign(x - B)); 
    
    % Time dependent values
    it = A * sin(Omegat);
    
    qt = (A/Omega)*(1-cos(Omegat));
    
    phit = R0*qt + 0.5*(R1-R0)*(abs(qt + B)-abs(qt - B));
    
    Rt_Gt = R0 + 0.5*(R1-R0)*(sign(qt + B) - sign(qt - B));
    
    vt = Rt_Gt.*it;
    
elseif app.rramTechnology == "FluxControlled"
    app.AmpLabel_rram.Text = string(A) + ' v';
    G1 = 800e-9;
    
    constrel = 0.5*G1*(2*x + abs(x - B)-abs(x + B));
    
    % Flux dependent conductance
    Rq_Gphi = 0.5*G1*(2 + sign(x - B) - sign(x + B)); 
    
    vt = A * sin(Omegat);
    
    phit = (A/Omega)*(1-cos(Omegat));
    
    qt = 0.5*G1*(2*phit + abs(phit - B)-abs(phit + B));
    
    Rt_Gt = 0.5*G1*(2 + sign(phit - B) - sign(phit + B));
    
    it = Rt_Gt.*vt;
    
end

% Store all calculated vectors and values in a structure, accessible
% globally in the application
app.vals.rram.x = x;
app.vals.rram.t = t;
app.vals.rram.constrel = constrel;
app.vals.rram.Rq_Gphi = Rq_Gphi;
app.vals.rram.Rt_Gt = Rt_Gt;
app.vals.rram.it = it;
app.vals.rram.qt = qt;
app.vals.rram.phit = phit;
app.vals.rram.vt = vt;
app.vals.rram.xmin = xmin;
app.vals.rram.xmax = xmax;
app.vals.rram.nx = nx;
app.vals.rram.tmin = tmin;
app.vals.rram.tmax = tmax;
app.vals.rram.nt = nt;
app.vals.rram.Amin = Amin;
app.vals.rram.Amax = Amax;
app.vals.rram.Omegamin = Omegamin;
app.vals.rram.Omegamax = Omegamax;
app.vals.rram.breakpoint = B;

end