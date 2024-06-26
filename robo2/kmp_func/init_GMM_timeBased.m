function model = init_GMM_timeBased(Data, model)
% This function initializes the parameters of a Gaussian Mixture Model
% (GMM) by splitting the data into equal bins (time-based clustering).
% Inputs -----------------------------------------------------------------
%   o Data:     D x N array representing N datapoints of D dimensions.
%   o nbStates: Number K of GMM components.
% Outputs ----------------------------------------------------------------
%   o Priors:   1 x K array representing the prior probabilities of the
%               K GMM components.
%   o Mu:       D x K array representing the centers of the K GMM components.
%   o Sigma:    D x D x K array representing the covariance matrices of the
%               K GMM components.
%
% Writing code takes time. Polishing it and making it available to others takes longer! 
% If some parts of the code were useful for your research of for a better understanding 
% of the algorithms, please reward the authors by citing the related publications, 
% and consider making your own research available in this way.
%
% @article{Calinon15,
%   author="Calinon, S.",
%   title="A Tutorial on Task-Parameterized Movement Learning and Retrieval",
%   journal="Intelligent Service Robotics",
%   year="2015"
% }
%
% Copyright (c) 2015 Idiap Research Institute, http://idiap.ch/
% Written by Sylvain Calinon, http://calinon.ch/
% 
% This file is part of PbDlib, http://www.idiap.ch/software/pbdlib/
% 
% PbDlib is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License version 3 as
% published by the Free Software Foundation.
% 
% PbDlib is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with PbDlib. If not, see <http://www.gnu.org/licenses/>.


[nbVar, nbData] = size(Data);%nbVar, nbData分别为矩阵的行数和列数
%diagRegularizationFactor = 1E-2; %Optional regularization term
diagRegularizationFactor = 1E-8; %Optional regularization term

TimingSep = linspace(min(Data(1,:)), max(Data(1,:)), model.nbStates+1);

for i=1:model.nbStates
	idtmp = find( Data(1,:)>=TimingSep(i) & Data(1,:)<TimingSep(i+1));
	model.Priors(i) = length(idtmp);
	model.Mu(:,i) = mean(Data(:,idtmp)');
	model.Sigma(:,:,i) = cov(Data(:,idtmp)');
	%Optional regularization term to avoid numerical instability
	model.Sigma(:,:,i) = model.Sigma(:,:,i) + eye(nbVar)*diagRegularizationFactor;
end
model.Priors = model.Priors / sum(model.Priors);
