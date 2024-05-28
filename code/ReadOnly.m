%采样率
fs = 48000;
%一分钟内的拍数
BPM = 80;
%时值
tpb = 60/BPM;
%存储音频
wav = [];
Hwav = [];
Lwav = [];

%F大调
%中音部分
F = [349.23 392.00 440.00 466.16 523.25 587.33 659.26 698.46].*2^(-1/2);
%低音部分
L = F.*1/2;
%高音部分
H = F.*2;

%% 乐谱
%% 高音
%唱名
tone1 = [
    F(7) H(1) H(2) H(3) F(5) H(5) H(3) ...
    F(7) H(1) H(2) H(3) F(5) H(5) H(3) H(2) H(3) H(1) H(2) F(7) H(1) F(5) ...
    F(7) H(1) H(2) H(3) F(5) H(5) H(3)...
    F(7) H(1) H(2) H(3) F(5) H(5) H(3) H(2) H(3) H(1) H(2) F(7) H(1) F(5)...
    F(7) H(1) H(2) H(3) F(5) H(5) H(3)...
    F(7) H(1) H(2) H(3) F(5) H(5) H(3) H(2) H(3) H(1) H(2) F(7) H(1) F(5)...
    F(7) H(1) H(2) H(3) F(5) H(5) H(3) ...
    H(6) H(3) H(2) F(6) F(3) L(6) F(2) F(3) F(2)...
    F(2) F(1) F(2) F(1) F(2) F(3) F(5) F(3)...
    F(2) F(1) F(2) F(1) F(2) F(3) F(2) F(1) L(6)...
    F(2) F(1) F(2) F(1) F(2) F(3) F(5) F(3)...
    F(2) F(3) F(2) F(1) F(2) F(2) ...
    F(2) F(1) F(2) F(1) F(2) F(3) F(5) F(3)...
    F(2) F(3) F(2) F(1) L(6) F(3) F(2) F(1) F(2)...
    F(1) F(3) F(2) F(1) F(2) F(1) F(3) F(2) F(1) F(2)...
    F(1) F(1) F(2) F(3) F(1) ...
    F(6) F(5) F(6) F(1) F(7) F(6) F(7)...
    F(7) F(6) F(7) F(3) H(1) H(2) H(1) F(7) F(6) F(5)...
    F(6) F(5) F(6) F(5) F(6) F(5) F(6) F(5) F(2) F(5) F(3)...
    F(1) F(2) F(3) F(1)...
    F(6) F(5) F(6) F(1) F(7) F(6) F(7) ...
    F(7) F(6) F(7) F(3) H(1) H(2) H(1) F(7) F(6) F(5) ...##
    F(6) H(3) H(3) F(5) F(6) H(3) H(3) F(5) F(6) ...
    F(6) H(1) H(2)...
    H(3) H(6) H(5) H(6) H(5) H(6) H(5) H(2)...
    H(3) H(6) H(5) H(6) H(5) H(6) H(5) H(3)...
    H(2) H(1) F(6) H(1) H(2) H(1) F(6) H(1)...
    H(3) H(4) H(3) H(2) H(3) H(2) H(1) H(2)...
    H(3) H(6) H(5) H(6) H(5) H(6) H(5) H(2)...
    H(3) H(6) H(5) H(6) H(5) H(6) H(5) H(3)...
    H(2) H(1) F(6) H(3) H(2) H(1) F(6) H(1) H(1)... JIE
    F(6) H(3)...
    H(2) H(1) F(6) H(3) H(2) H(1) F(6) H(1) H(1)...
    F(7) H(1) H(2) H(3) F(5) H(5) H(3)...
    F(7) H(1) H(2) H(3) F(5) H(5) H(3) H(2) H(3) H(1) H(2) F(7) H(1) F(5)...
    F(7) H(1) H(2) H(3) F(5) H(5) H(3)...
    H(6) H(3) H(2) F(6) F(3) L(6) F(2) F(3) F(2)...
    F(2) F(1) F(2) F(1) F(2) F(3) F(5) F(3)...
    F(2) F(1) F(2) F(1) F(2) F(3) F(2) F(1) L(6) ...
    F(2) F(1) F(2) F(1) F(2) F(3) F(5) F(3) ...
    F(2) F(3) F(2) F(1) F(2) F(2) ...
    F(2) F(1) F(2) F(1) F(2) F(3) F(5) F(3)...
    F(2) F(3) F(2) F(1) L(6) F(3) F(2) F(1) F(2)...
    F(1) F(3) F(2) F(1) F(2) F(1) F(3) F(2) F(1) F(2)...
    F(1) F(1) F(2) F(3) F(1)...
    F(6) F(5) F(6) F(1) F(7) F(6) F(7)...
    F(7) F(6) F(7) F(3) H(1) H(2) H(1) F(7) F(6) F(5)...第3页倒数第四行刚好搞定
    F(6) F(5) F(6) F(5) F(6) F(5) F(6) F(5) F(2) F(5) F(3) ...JIE
    F(1) F(2) F(3) F(1) ...
    F(6) F(5) F(6) F(1) F(7) F(6) F(7)...
    F(7) F(6) F(7) F(3) H(1) H(2) H(1) F(7) F(6) F(5) ...
    F(6) H(3) H(3) F(5) F(6) H(3) H(3) F(5) F(6)...JIE
    H(1) H(2) ...
    H(3) H(6) H(5) H(6) H(5) H(6) H(5) H(2) ...
    H(3) H(6) H(5) H(6) H(5) H(6) H(5) H(3) ...
    H(2) H(1) F(6) H(1) H(2) H(1) F(6) H(1) ...
    H(3) H(4) H(3) H(2) H(3) H(2) H(1) H(2) ...
    H(3) H(6) H(5) H(6) H(5) H(6) H(5) H(2) ...
    H(3) H(6) H(5) H(6) H(5) H(6) H(5) H(3) ...
    H(2) H(1) F(6) H(3) H(2) H(1) F(6) H(1) H(1) ...JIE
    F(6) H(3) ...
    H(2) H(1) F(6) H(3) H(2) H(1) F(6) H(1) H(1) ...
    F(7) H(1) H(2) H(3) F(5) H(5) H(3) ...
    F(7) H(1) H(2) H(3) F(5) H(5) H(3) H(2) H(3) H(1) H(2) F(7) H(1) F(5)...
    F(7) H(1) H(2) H(3) F(5) H(5) H(3)...
    F(7) H(1) H(2) H(3) F(5) H(5) H(3) H(2) H(3) H(1) H(2) F(7) H(1) F(5)...
    ];
%% 时值
rythm1 = [
    1/4*ones(1,3) 1/2 1/4 1/4 2+1/4 ...
    1/4*ones(1,3) 1/2 1/4*ones(1,9) 1/2 ...
    1/4*ones(1,3) 1/2 1/4 1/4 2+1/4 ...
    1/4*ones(1,3) 1/2 1/4*ones(1,9) 1/2 ...
    1/4*ones(1,3) 1/2 1/4 1/4  2+1/4 ...
    1/4*ones(1,3) 1/2 1/4*ones(1,9) 1/2 ...
    1/4*ones(1,3) 1/2 1/4 1/4 2+1/4 ...
    1/4*ones(1,8) 2 ...
    3/4 1/4 3/4 1/4 1/2*ones(1,4)...
    3/4 1/4 3/4 1/4 1/4*ones(1,4) 1 ...
    3/4 1/4 3/4 1/4 1/2 1/2 1/2 1/2 ...
    3/4 1/4 1/2 1/4 1/4 2 ...
    3/4 1/4 3/4 1/4 1/2*ones(1,4) ...
    3/4 1/4 1/2 1/2 1 1/4*ones(1,4) ...
    1 1/4*ones(1,4) 1 1/4*ones(1,4) ...
    2 1/2*ones(1,4) ...
    1/2 1/4 1/4+3/4 1/4 1/2 1/4 1/4+1 ...
    1/2 1/4 1/4+1/2 1/2 1/4*ones(1,4) 3/4 1/4 ...
    1/2 1/4 1/2 1/4*ones(1,3) 1/2 1/4 1/2 1/2 1/4+2 ...jie
    1/2*ones(1,4) ...
    1/2 1/4 1 1/4 1/2 1/4 1/4+1 ...
    1/2 1/4 1/4+1/2 1/2 1/4*ones(1,4) 3/4 1/4 ...
    1/2 1/4 1/4+1/4 3/4 1/2 1/4 1/2 1/2 1/4 ...
    3 1/2 1/2 ...
    1/2 1/4 3/4 1/4 3/4 1/4 1/2 3/4 ...
    1/2 1/4 3/4 1/4 3/4 1/4 1/2 3/4 ...
    1/2 1/4 1/2 3/4 1/2 1/4 1 1/4 ...
    1+1/4 1/4*ones(1,4) 3/4 1/2 1/2 ...
    1/2 1/4 1/4+1/2 1/4 1/4+1/2 1/4 1 1/4 ...
    1/2 1/4 3/4 1/4 3/4 1/4 1/2 3/4 ...
    1/2 1/4 1/2 3/4 1/2 1/4 1/2 1/2 1/4+3 ...
    1/4 3/4 ...
    1/2 1/4 1 1/4 1/2 1/4 1/2 1/2 1/4 ...
    1/4 1/4 1/4 1/2 1/4 1/4 1/4+2 ...
    1/4 1/4 1/4 1/2 1/4*ones(1,9) 1/2 ...
    1/4 1/4 1/4 1/2 1/4 1/4 1/4+2 ...
    1/4*ones(1,8) 2 ...
    3/4 1/4 3/4 1/4 1/2 1/2 1/2 1/2 ...
    3/4 1/4 3/4 1/4 1/4*ones(1,4) 1 ...
    3/4 1/4 3/4 1/4 1/2*ones(1,4)...
    3/4 1/4 1/2 1/4 1/4 2 ...
    3/4 1/4 3/4 1/4 1/2*ones(1,4)...
    3/4 1/4 1/2 1/2 1 1/4*ones(1,4)...
    1 1/4*ones(1,4) 1 1/4*ones(1,4)...
    2 1/2*ones(1,4) ...
    1/2 1/4 1 1/4 1/2 1/4 1+1/4 ...
    1/2 1/4 1/4+1/2 1/2 1/4*ones(1,4) 3/4 1/4 ...
    1/2 1/4 1/2 1/4*ones(1,3) 1/2 1/4 1/2 1/2 1/4 + 2 ...
    1/2 *ones(1,4)...
    1/2 1/4 1 1/4 1/2 1/4 1/4+1 ...
    1/2 1/4 3/4 1/2 1/4*ones(1,4) 3/4 1/4 ...
    1/2 1/4 1/2 3/4 1/2 1/4 1/2 1/2 1/4+3 ...
    1/2 1/2 ...
    1/2 1/4 3/4 1/4 3/4 1/4 1/2 3/4 ...
    1/2 1/4 3/4 1/4 3/4 1/4 1/2 3/4 ...
    1/2 1/4 1/2 3/4 1/2 1/4 1 1/4 ...
    1+1/4 1/4*ones(1,4) 3/4 1/2 1/2 ...
    1/2 1/4 3/4 1/4 3/4 1/4 1 1/4 ...
    1/2 1/4 3/4 1/4 3/4 1/4 1/2 3/4 ...
    1/2 1/4 1/2 3/4 1/2 1/4 1/2 1/2 1/4+3 ...
    1/4 3/4 ...
    1/2 1/4 1 1/4 1/2 1/4 1/2 1/2 1/4 ...
    1/4 1/4 1/4 1/2 1/4*ones(1,2) 1/4+2 ...
    1/4*ones(1,3) 1/2 1/4*ones(1,9) 1/2 ...
    1/4 1/4 1/4 1/2 1/4 1/4 1/4+2 ...
    1/4 1/4 1/4 1/2 1/4*ones(1,9) 1/2 ...
    ];

%% 低音
%% 唱名
tone2 = [L(4) F(1) F(4) L(5) L(7) F(2) ...
    L(3) L(7) F(2) L(6)*1/2 L(3) L(6)...
    L(4) F(1) F(4) L(5) L(7) F(2)...
    L(3) L(7) F(2) L(6)*1/2 L(3) F(1)...
    L(4)*1/2 L(1) L(6) L(5)*1/2 L(2) L(7)...
    L(3)*1/2 L(7)*1/2 L(5) L(6)*1/2 L(3) F(1)...
    L(4)*1/2 L(1) F(6) L(5)*1/2 L(2) L(7)...
    L(6)*1/2 L(6)...
    L(1)*1/2 L(5)*1/2 L(1) L(2) L(3)...
    L(7)*1/2*1/2 L(5)*1/2  L(7)*1/2 L(2) L(5)...
    L(7)*1/2*1/2*2^(-1/12) L(5)*1/2  L(7)*1/2*1/2*2^(-1/12) L(2) L(5)...
    L(4)*1/2 L(1) L(4) L(5) L(6)...
    L(2)*1/2 L(6)*1/2 L(4) L(5)*1/2 L(2) L(5)...
    L(6)*1/2*1/2 L(3)*1/2 L(6)*1/2 L(7)*1/2 L(1)...
    L(4)*1/2 L(1) L(4) L(5)*1/2 L(2) L(5)...
    L(1)*1/2 L(5)*1/2 L(1) L(2) L(3)...
    L(4)*1/2 L(1) L(6) L(1) L(5)*1/2 L(2) L(7) L(2)...
    L(3)*1/2 L(7)*1/2 L(5)*2^(1/12) L(7)*1/2 L(6)*1/2 L(3) F(1) L(3) ...
    L(4)*1/2 L(1) L(6) L(1) L(5)*1/2 L(2) L(7) L(2)...
    L(1)*1/2 L(5)*1/2  L(2) L(3) L(5) ...
    L(4)*1/2 L(1) L(6) L(1) L(5)*1/2 L(2) L(7) L(2)...
    L(3)*1/2 L(7)*1/2 L(5)*2^(1/12) L(7)*1/2 L(6)*1/2 L(3) F(1) L(3)...
    L(4)*1/2 L(1) L(6) L(1) L(5)*1/2 L(2) L(7) L(2)...
    L(6)*1/2 L(3) L(6) L(7) F(1)...
    L(4)*1/2 L(1) L(6) L(1) L(5)*1/2 L(2) L(7) L(2)...
    L(3)*1/2 L(7)*1/2 L(5) L(7)*1/2 L(6)*1/2 L(3) F(1) L(3)...
    L(2)*1/2 L(6)*1/2 L(4) L(6)*1/2 L(5)*1/2 L(2) L(7) L(2)...
    L(1)*1/2 L(5)*1/2 L(3) L(5)*1/2 L(3)*1/2 L(7)*1/2 L(5)*2^(1/12) L(7)*1/2 ...
    L(4)*1/2 L(1) L(6) L(1) L(5)*1/2 L(2) L(7) L(2)...
    L(3)*1/2 L(7)*1/2 L(5) L(7)*1/2 L(6)*1/2 L(3) F(1) L(3)...
    L(4)*1/2 L(1) L(6) L(1) L(5)*1/2 L(2) L(7) L(2)...
    L(6)*1/2 L(3) L(6) L(7) F(1) ...
    L(4)*1/2 L(1) L(6) L(5)*1/2 L(2) L(7)...
    L(4)*1/2 L(1) L(6) L(5)*1/2 L(2) L(7)...
    L(3)*1/2 L(7)*1/2 L(5) L(6)*1/2 L(3) F(1)...
    L(4)*1/2 L(1) L(6) L(5)*1/2 L(2) L(7)...
    L(6)*1/2*1/2 L(6)*1/2 ...
    L(1)*1/2 L(5)*1/2 L(1) L(2) L(3) ...
    L(7)*1/2*1/2 L(5)*1/2 L(7)*1/2 L(2) L(5) ...
    L(7)*1/2*1/2*2^(-1/12) L(5)*1/2 L(7)*1/2*2^(-1/12) L(2) L(5)...
    L(4)*1/2 L(1) L(4) L(5) L(6) ...
    L(2)*1/2 L(6)*1/2 L(4) L(5)*1/2 L(2) L(5)...
    L(6)*1/2*1/2 L(3)*1/2 L(6)*1/2 L(7)*1/2 L(1) ...
    L(4)*1/2 L(1) L(4) L(5)*1/2 L(2) L(5)...
    L(4)*1/2 L(1) L(4) L(5) L(6)...
    L(4)*1/2 L(1) L(6) L(1) L(5)*1/2 L(2) L(7) L(2)...
    L(3)*1/2 L(7)*1/2 L(5)*2^(1/12) L(7)*1/2 L(6)*1/2 L(3) F(1) L(3)...
    L(4)*1/2 L(1) L(6) L(1) L(5)*1/2 L(2) L(7) L(2) ...
    L(1)*1/2 L(5)*1/2 L(2) L(3) L(5) ...
    L(4)*1/2 L(1) L(6) L(1) L(5)*1/2 L(2) L(7) L(2)...
    L(3)*1/2 L(7)*1/2 L(5)*2^(1/12) L(7)*1/2 L(6)*1/2 L(3) F(1) L(3) ...
    L(4)*1/2 L(1) L(6) L(1) L(5)*1/2 L(2) L(7) L(2) ...
    L(6)*1/2 L(3) L(6) L(7) F(1) ...
    L(4)*1/2 L(1) L(6) L(1) L(5)*1/2 L(2) L(7) L(2) ...
    L(3)*1/2 L(7)*1/2 L(5) L(7)*1/2 L(6)*1/2 L(3) F(1) L(3)...
    L(2)*1/2 L(6)*1/2 L(4) L(6)*1/2 L(5)*1/2 L(2) L(7) L(2)...
    L(1)*1/2 L(5)*1/2 L(3) L(5)*1/2 L(3)*1/2 L(7)*1/2 L(5)*2^(1/12) L(7)*1/2 ...
    L(4)*1/2 L(1) L(6) L(1) L(5)*1/2 L(2) L(7) L(2) ...
    L(3)*1/2 L(7)*1/2 L(5) L(7)*1/2 L(6)*1/2 L(3) F(1) L(3) ...
    L(4)*1/2 L(1) L(6) L(1) L(5)*1/2 L(2) L(7) L(2) ...
    L(6)*1/2 L(3) L(6) L(7) F(1) ...
    L(4)*1/2 L(1) L(6) L(5)*1/2 L(2) L(7) ...
    L(4) F(1) F(4) L(5) L(7) F(2) ...
    L(3) L(7) F(2) L(6)*1/2 L(3) L(6) ...
    L(4) F(1) F(4) L(5) L(7) F(2) ...
    L(3) L(7) F(2) L(6)*1/2 L(3) F(1) ...
    ];
%% 时值
rythm2 = [1/2 1/2 1 1/2 1/2 1 ...
    1/2 1/2 1 1/2 1/2 1 ...
    1/2 1/2 1 1/2 1/2 1 ...
    1/2 1/2 1 1/2 1/2 1 ...
    1/2 1/2 1 1/2 1/2 1 ...
    1/2 1/2 1 1/2 1/2 1 ...
    1/2 1/2 1 1/2 1/2 1 ...
    2 2 ...
    1/2*ones(1,4) 2 ...
    1/2 1/2 1/2 1/2 1/2 2 ...
    1/2*ones(1,4) 2 ...
    1/2*ones(1,4) 2 ...
    1/2 1/2 1 1/2 1/2 1 ...
    1/2*ones(1,4) 2 ...
    1/2 1/2 1 1/2 1/2 1 ...
    1/2*ones(1,4) 2 ...
    1/2*ones(1,8)...
    1/2*ones(1,8)...
    1/2 *ones(1,8)...
    1/2*ones(1,4) 2 ...
    1/2*ones(1,8) ...
    1/2*ones(1,8) ...
    1/2*ones(1,8) ...
    1/2*ones(1,4) 2 ...
    1/2*ones(1,8) ...
    1/2*ones(1,8) ...
    1/2*ones(1,8) ...
    1/2*ones(1,8) ...
    1/2*ones(1,8) ...
    1/2*ones(1,8) ...
    1/2*ones(1,8) ...
    1/2*ones(1,4) 2 ...
    1/2 1/2 1 1/2 1/2 1 ...
    1/2 1/2 1 1/2 1/2 1 ...
    1/2 1/2 1 1/2 1/2 1 ...
    1/2 1/2 1 1/2 1/2 1 ...
    2 2 ...
    1/2 1/2 1/2 1/2 2 ...
    1/2 1/2 1/2 1/2 2 ...
    1/2*ones(1,4) 2 ...
    1/2*ones(1,4) 2 ...
    1/2 1/2 1 1/2 1/2 1 ...
    1/2*ones(1,4) 2 ...
    1/2 1/2 1 1/2 1/2 1 ...
    1/2*ones(1,4) 2 ...
    1/2*ones(1,8)...
    1/2*ones(1,8)...
    1/2*ones(1,8)...
    1/2*ones(1,4) 2 ...
    1/2*ones(1,8)...
    1/2 *ones(1,8)...
    1/2 *ones(1,8) ...
    1/2*ones(1,4) 2 ...
    1/2*ones(1,8) ...
    1/2*ones(1,8) ...
    1/2*ones(1,8) ...
    1/2*ones(1,8) ...
    1/2*ones(1,8) ...
    1/2*ones(1,8) ...
    1/2*ones(1,8) ...
    1/2*ones(1,4) 2 ...
    1/2 1/2 1 1/2 1/2 1 ...
    1/2 1/2 1 1/2 1/2 1 ...
    1/2 1/2 1 1/2 1/2 1 ...
    1/2 1/2 1 1/2 1/2 1 ...
    1/2 1/2 1 1/2 1/2 1 ...
    ];

%构造合成乐曲

%%  中音-------------------中音%%
for n = 1:length(tone1)
    t = 0:1/fs:rythm1(n)*tpb;
    %添加泛音
    wav_initial_1 =(0.6882*sin(2*pi*tone1(n)*t) + sin(4*pi*tone1(n)*t) + 0.9217*sin(6*pi*tone1(n)*t) + ...
        0.2318*sin(8*pi*tone1(n)*t) + 0.0524*sin(10*pi*tone1(n)*t) + 0.1355*sin(12*pi*tone1(n)*t) + ...
        0.1797*sin(14*pi*tone1(n)*t) + 0.09109*sin(16*pi*tone1(n)*t) + 0.0055*sin(18*pi*tone1(n)*t) + ...
        0.1127*sin(20*pi*tone1(n)*t));
    wav_basic1 = adsr(0.05,0.9,0.00001,0.05,wav_initial_1,t);
    Hwav = [Hwav,wav_basic1];
end

%%  低音
for n = 1:length(tone2)
    t = 0:1/fs:rythm2(n)*tpb;
    %添加泛音
    wav_initial_2 =(0.6882*sin(2*pi*tone2(n)*t) + sin(4*pi*tone2(n)*t) + 0.9217*sin(6*pi*tone2(n)*t) + ...
        0.2318*sin(8*pi*tone2(n)*t) + 0.0524*sin(10*pi*tone2(n)*t) + 0.1355*sin(12*pi*tone2(n)*t));
    wav_basic2 = adsr(0.05,0.85,0.00001,0.1,wav_initial_2,t);
    Lwav = [Lwav,wav_basic2];
end


%% 补零
Max = max([length(Lwav),length(Hwav)]);
Lwav = [Lwav zeros(1,Max-length(Lwav))];
Hwav = [Hwav zeros(1,Max-length(Hwav))];
wav = Hwav + Lwav;
soundsc(wav,fs);