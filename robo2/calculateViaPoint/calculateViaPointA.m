function d1 = calculateViaPointA(stairLength, stairHeight, eta1, epsilon1, epsilon2)

function tp = totalPotential(repulsivePotential, attractivePotential)
tp = repulsivePotential + attractivePotential;
end

function ur = U_rep(eta1, d1)
ur = 0.5 * eta1 * (1 ./ d1).^2;
end

function ua = U_att(epsilon1, d1)
ua = 0.5 * epsilon1 * d1.^2;% + 0.5 * epsilon2 * (d2 - d_NQ)^2;
end

d = 0:0.1:stairLength;
tp = totalPotential(U_rep(eta1, d), U_att(epsilon1, d));

[m,n] = min(tp);
d1 = d(n);

end



