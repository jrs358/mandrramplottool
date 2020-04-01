function mchar_calcvals(app)

clear app.vals.mchar;

ConstRel = app.ConstSwitch_mchar.Value;
CurrentSource = app.CurrentSwitch_mchar.Value;

qmin = app.qminField_mchar.Value;
qmax = app.qmaxField_mchar.Value;
nq = app.nqField_mchar.Value;

q = linspace(qmin, qmax, nq);

tmin = app.tminField_mchar.Value;
tmax = app.tmaxField_mchar.Value;
nt = app.ntField_mchar.Value;
t = linspace(tmin, tmax, nt);

Aslider = app.AmpSlider_mchar.Value;
Amin = app.MinAmpField_mchar.Value;
Amax = app.MaxAmpField_mchar.Value;

A = Amin + (Aslider*(Amax-Amin));

app.AmpLabel_mchar.Text = string(A) + ' A';

Omegaslider = app.AngleSlider_mchar.Value;
Omegamin = app.MinAngleField_mchar.Value;
Omegamax = app.MaxAngleField_mchar.Value;

Omega = Omegamin+(Omegaslider*(Omegamax-Omegamin));
app.AngleLabel_mchar.Text = string(Omega) + ' rad/s';

Omegat = Omega.*t;

if ConstRel == "Eq.1" && CurrentSource == "Eq.1"
    
    phiq = q+(1/3).*q.^3;
    Rq = 1 + q.^2;
    
    it = A.*sin(Omegat);
    qt = (A/Omega).*(1-cos(Omegat));
    phit = (A/Omega).*(1-cos(Omegat)).*(1+(1/3).*((A/Omega)^2).*(1-cos(Omegat)).^2);
    vt = A*(1+((A/Omega)^2).*(1-cos(Omegat)).^2).*sin(Omegat);
    Rt = 1 + qt.^2;

elseif ConstRel == "Eq.2" && CurrentSource == "Eq.1"
    
    phiq = (1/3).*q.^3;
    Rq = q.^2;
    
    it = A.*sin(Omegat);
    qt = (A/Omega).*(1-cos(Omegat));
    phit = (1/3).*(A^3/Omega^3).*(1-cos(Omegat)).^3;
    vt = (A^3/Omega^2).*(1-cos(Omegat)).^2.*sin(Omegat);
    Rt = qt.^2;
    
elseif ConstRel == "Eq.1" && CurrentSource == "Eq.2"
    
    phiq = q+(1/3).*q.^3;
    Rq = 1 + q.^2;
    
    it = A.*cos(Omegat);
    qt = (A/Omega).*(sin(Omegat));
    phit = (A/Omega).*sin(Omegat)+(1/3)*(A^3/Omega^3).*(sin(Omegat)).^3;
    vt = A.*cos(Omegat).*(1+(A^2/Omega^2).*sin(Omegat).^2);
    Rt = 1 + qt.^2;
    
elseif ConstRel == "Eq.2" && CurrentSource == "Eq.2"
    
    phiq = (1/3).*q.^3;
    Rq = q.^2;
    
    it = A.*cos(Omegat);
    qt = (A/Omega).*(sin(Omegat));
    phit = (1/3)*(A^3/Omega^3).*sin(Omegat).^3;
    vt = (A^3/Omega^2).*(sin(Omegat).^2).*cos(Omegat);
    Rt = qt.^2;
    
end

app.vals.mchar.q = q;
app.vals.mchar.t = t;

app.vals.mchar.phiq = phiq;
app.vals.mchar.Rq = Rq;
app.vals.mchar.it = it;
app.vals.mchar.qt = qt;
app.vals.mchar.phit = phit;
app.vals.mchar.vt = vt;
app.vals.mchar.Rt = Rt;
app.vals.mchar.qmin = qmin;
app.vals.mchar.qmax = qmax;
app.vals.mchar.nq = nq;
app.vals.mchar.tmin = tmin;
app.vals.mchar.tmax = tmax;
app.vals.mchar.nt = nt;
app.vals.mchar.Amin = Amin;
app.vals.mchar.Amax = Amax;
app.vals.mchar.Omegamin = Omegamin;
app.vals.mchar.Omegamax = Omegamax;