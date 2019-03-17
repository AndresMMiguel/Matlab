%% Datos iniciales
Pmed= -9.7; %[dBm]
fnor= 0.35;
fmin = 3e3; %[kHz]
fmax = 15e3; %[kHz]
fpfija= 1.75e6; %[Hz]
%fn= 50900e3 + 30e3*(n-1) %frecuencia variable segun el canal [Hz]



%% Apartado1
%datos
Piloto= 11; %Potencia del piloto por debajo de la portadors [dB]


%% Apartado2

Ppico=Pmed - 10*log10(fnor);
%Para escoger el modulador IQ vamos a la tabla de apendice y apuntamos
%datos porque no se escogerlo asique se prueba con todos

%datos para MIQA-21M
PolIQ=10; %Nivel OL [dBm]
Pconver=7; %Perdidas de conversion [dB]

Psalidaol=PolIQ + 3; %[dB] le sumamos 3dB porque hay un divisor de 2
PmediaBLp2= Pmed - Pconver;
Pportadorap2 = PmediaBLp2 - Piloto;
Atenuacion= PolIQ - Pportadorap2;
Pmedtotalp2=10*log10(10^(PmediaBLp2/10)+10^(Pportadorap2/10)); %La suma hay que hacerlo en unidades lineales [dBm]


fprintf('Potencia pico P1: %.5f  dBm\n',Ppico)
fprintf('Potencia salida OL: %.5f  dBm\n',Psalidaol)
fprintf('Potencia media bandas laterales P2: %.5f  dBm\n',PmediaBLp2)
fprintf('Potencia portadora P2: %.5f  dBm\n',Pportadorap2)
fprintf('Atenuacion inyeccion: %.5f  dB\n',Atenuacion)
fprintf('Atenuacion inyeccion: %.5f  dBm\n',Pmedtotalp2)


%% Apartado3

fcanal1= 50900e3 + 30e3*(1-1); 
fcanal42= 50900e3 + 30e3*(42-1);

fOL1=fcanal1-fpfija;
fOL42=fcanal42-fpfija;

fesp1= fOL1 - fpfija;
fesp42=fOL42 - fpfija;

fprintf('fcanal1: %.5f  kHz\n',fcanal1/1000)
fprintf('fcanal42: %.5f  kHz\n',fcanal42/1000)
fprintf('fOL1: %.5f  kHz\n',fOL1/1000)
fprintf('fOL42: %.5f  kHz\n',fOL42/1000)
fprintf('fesp1: %.5f  kHz\n',fesp1/1000)
fprintf('fesp42: %.5f  kHz\n',fesp42/1000)


fprintf('BWpaso finf1: %.5f  kHz\n',fcanal1/1000)
fprintf('BWpaso finf42: %.5f  kHz\n',fcanal42/1000)
fprintf('BWpaso fsup1: %.5f  kHz\n',(fcanal1+fmax)/1000)
fprintf('BWpaso fsup42: %.5f  kHz\n',(fcanal42+fmax)/1000)
fprintf('BWeliminar finf1: %.5f  kHz\n',(fesp1-fmax)/1000)
fprintf('BWeliminar finf42: %.5f  kHz\n',(fesp42-fmax)/1000)
fprintf('BWeliminar fsup1: %.5f  kHz\n',fesp1/1000)
fprintf('BWeliminar fsup42: %.5f  kHz\n',fesp42/1000)

Q=50; %factor de calidad
RechazoOL = 10*log10(1+Q^2*(fOL1/fcanal1-fcanal1/fOL1)^2);
Rechazoespuria = 10*log10(1+Q^2*(fesp1/fcanal1-fcanal1/fesp1)^2);

fprintf('Rechazo OL: %.5f  dB\n',RechazoOL)
fprintf('Rechazo espuria: %.5f  dB\n',Rechazoespuria)

%% Apartdo4 
%No se como coger el mezclador pero vamos probando con los que nos dan en
%los apendices
%datos apendice
Pconversor=6.5; %miramos apendice y apuntamos valor tipico
PolRFconversor=30; %aislamiento ol-rf minimo
Polconversor = 7; %Pol

Pp3= Pmedtotalp2 - Pconversor;
MaxnivelOLp3= Polconversor - PolRFconversor;

fprintf('Potencia en P3: %.5f  dBm\n',Pp3)
fprintf('Maximo nivel de OL en P3: %.5f  dBm\n',MaxnivelOLp3)

%% Apartado5
N=42; %Ultimo canal
pp6=2.2; %[W]
G=10; %[dB]
C_I = 35; %[dB]

c_i=10^(C_I/10); 
Pp6=10*log10(pp6*1000); %[dBm]
Pp5=Pp6-10
Lcom=10*log10(N)+1;
Pp4=Pp5+Lcom;
Gtotal=Pp4-Pp3;
Gcanal = Gtotal - 10*log10(N);

pi3=sqrt(6*c_i)*pp6; %Podemos usar la aproximacion para N canales muy grandes
PI3=10*log10(pi3*1000);
fprintf('Lcomb: %.5f  dBm\n',Lcom)
fprintf('Gcanal: %.5f  dBm\n',Gcanal)
fprintf('PI3: %.5f  dBm\n',PI3)


%% Apartado6

Ppico_Pmed = 5;
pp6= pp6; %[W] mismo valor que en el apartado anterior dado que  lo hemos sacado de ese apartado

pout=Ppico_Pmed*pp6; %[W]
p1db=pout*10^(-1/10); %[W]
pdc=2*p1db; %[W]
pdismax=pdc; %[W] la maxima potencia que se puede disipar es toda
rend=pp6/pdc*100; %[%]

fprintf('P1db: %.5f  W\n',p1db)
fprintf('Potencia de alimentacion: %.5f  W\n',pdc)
fprintf('Maxima potencia que se puede disipar: %.5f  W\n',pdismax)
fprintf('Rendimiento: %.5f  %\n',rend)


%% Apartado7
fI=0.57e6; %[Hz]
%Funcion del filtro 1a 1a eliminacion banda imagen y reduccion de ruido de
%interferencias
%funcion filtro 1b eliminacion banda imagen
fminfiltro1a=fcanal1;
fmaxfiltro1a=fcanal42+fmax;

fminfiltro1b1=fminfiltro1a;
fmaxfiltro1b1=fminfiltro1a + fmax;
fminfiltro1b42=fmaxfiltro1a-fmax;
fmaxfiltro1b42=fmaxfiltro1a;

fprintf('Filtro 1a: fmin: %.5f  kHz\n',fminfiltro1a/1000)
fprintf('Filtro 1a: fmax: %.5f  kHz\n',fmaxfiltro1a/1000)
% fprintf('Filtro 1b: fmin

%Canal1: %.5f  kHz\n',fminfiltro1b1/1000)
fprintf('Filtro 1b: fmax Canal1: %.5f  kHz\n',fmaxfiltro1b1/1000)
fprintf('Filtro 1b: fmin Canal42: %.5f  kHz\n',fminfiltro1b42/1000)
fprintf('Filtro 1b: fmax Canal42: %.5f  kHz\n',fmaxfiltro1b42/1000)

%% Apartado8
%datos
f=0.57e6; %[Hz]

fOLrx1=fminfiltro1b1-f; %[Hz]
fOLrx42=fminfiltro1b42-f; %[Hz]

fimage1=fOLrx1-f;%[Hz]
fimage42=fOLrx42-f; %[Hz]

fprintf('fOLrx canal1: %.5f  kHz\n',fOLrx1/1000)
fprintf('fOLrx canal42: %.5f  kHz\n',fOLrx42/1000)
fprintf('fimagenrx canal1: %.5f  kHz\n',fimage1/1000)
fprintf('fimagenrx canal42: %.5f  kHz\n',fimage42/1000)