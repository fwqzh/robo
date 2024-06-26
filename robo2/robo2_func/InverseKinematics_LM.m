function err_norm = InverseKinematics_LM(to, Target)

global uLINK

idx = FindRoute(to);
wn_pos = 1/0.3;
wn_ang = 1/(2*pi);
We = diag([wn_pos wn_pos wn_pos wn_ang wn_ang wn_ang]);
Wn = eye(length(idx));

ForwardKinematics(1);
err = CalcVWerr(Target, uLINK(to));
Ek = err'*We*err;

for n = 1:10
  J  = CalcJacobian(idx);
  Jh = J'*We*J + Wn*(Ek + 0.002);  %Hk + wn
  
  gerr = J'*We*err;    %gk
  dq   = Jh \ gerr;    %new
  
  MoveJoints(idx, dq);
  ForwardKinematics(1);
  err = CalcVWerr(Target, uLINK(to));
  Ek2 = err'*We*err;
  if Ek2 < 1E-12
      break;
  elseif Ek2 < Ek
      Ek = Ek2;
  else
      MoveJoints(idx, -dq);  % revert
      ForwardKinematics(1);
      break, 
  end
end

if nargout == 1 
    err_norm = norm(err);
end