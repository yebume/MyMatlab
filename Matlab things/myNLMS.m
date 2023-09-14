function [e,w] = myNLMS(M, mu, d, s, a)

%M                  % szűrő együtthatók száma
%mu                 % bátorsági tényező ~(1/M)
%d                  % reprezentálni kívánt rendszer kimenete
%s                  % reprezentálni kívánt rendszer bemenete
%a                  % regularizációs konstans

L = length(s);      % gerj hossza
w = zeros(M, 1);    % szűrő együtthatók
x = zeros(M,1);     % forgó vektor, késleltetők értékét tartalmazza
e = zeros(1,L);     % hiba vektor

    for k = 1:L     % k: futó IDŐváltózó
        x(1)   = s(k); 
        y      = w' * x; 
        e(k)   = d(k)  - y;
        w      = w  + mu/(a+x'*x)*e(k)*x;
        x(2:M) = x(1:(M-1)); 
    end
end