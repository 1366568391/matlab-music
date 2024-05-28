% 440 0.007094
% 882.8 0.001373
% 1326 0.002616
% 1775  0.000455
% 2225  0.0004442
% 2680 0.0003507
% 3140   0.0002064
% 3608   0.0001214
tpb = 60/80;
fs = 44100;
t = 0:1/fs:1*tpb;
to = 440;
a = [0.007094 0.001373 0.002616 0.000455 0.0004442 0.0003507 0.0002064 0.0001214];
a = a./sum(a);
wav = (0.5603*sin(2*pi*to)*t) + 0.1084*sin(4*pi*to*t) + 0.2066*sin(6*pi*to*t) + ...
    0.0359*sin(8*pi*to*t) + 0.0351*sin(10*pi*to*t) + 0.0277*sin(12*pi*to*t) + ...
    0.0163*sin(14*pi*to*t) + 0.0096*sin(16*pi*to*t);
wav_basic = adsr(0.05,0.85,0.00001,0.1,wav,t);
sound(wav_basic,fs);