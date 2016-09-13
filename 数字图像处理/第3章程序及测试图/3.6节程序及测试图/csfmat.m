function Fmat = csfmat()
%===================
% ����CSFƵ����Ӧ����
    min_f = -20;
    max_f = 20;
    step_f = 1;
    u = min_f:step_f:max_f; 
    v = min_f:step_f:max_f;
    n = length(u);
    Z = zeros(n);
    for i=1:n
      for j=1:n
        Z(i,j)=csffun(u(i),v(j));   % ����csffun
      end
    end
Fmat = Z;
