%frontal delta (7)

g=[ones(1,7) repmat(2,1,7) repmat(3,1,7) repmat(4,1,7) repmat(5,1,7) repmat(6,1,7)];

X=reshape(frontal_lobe_delta,1,[]);

dunn(X, g)

%frontal theta 

X=reshape(frontal_lobe_theta,1,[]);

dunn(X, g)

clear X
clear g

%central alpha (11)

g=[ones(1,11) repmat(2,1,11) repmat(3,1,11) repmat(4,1,11) repmat(5,1,11) repmat(6,1,11)];
X=reshape(central_lobe_alpha,1,[]);
dunn(X, g)

%central beta 

X=reshape(central_lobe_beta,1,[]);
dunn(X, g)

clear X
clear g

%parietal delta (5)

g=[ones(1,5) repmat(2,1,5) repmat(3,1,5) repmat(4,1,5) repmat(5,1,5) repmat(6,1,5)];
X=reshape(parietal_lobe_delta,1,[]);
dunn(X, g)

%parietal alpha 

X=reshape(parietal_lobe_alpha,1,[]);
dunn(X, g)

clear X
clear g

%occipital delta (3)

g=[ones(1,3) repmat(2,1,3) repmat(3,1,3) repmat(4,1,3) repmat(5,1,3) repmat(6,1,3)];
X=reshape(occipital_lobe_delta,1,[]);
dunn(X, g)

%occipital theta

X=reshape(occipital_lobe_theta,1,[]);
dunn(X, g)

%occipital alpha

X=reshape(occipital_lobe_alpha,1,[]);
dunn(X, g)

%occipital beta

X=reshape(occipital_lobe_beta,1,[]);
dunn(X, g)

clear X
clear g

%temporal alpha (6)

g=[ones(1,6) repmat(2,1,6) repmat(3,1,6) repmat(4,1,6) repmat(5,1,6) repmat(6,1,6)];
X=reshape(temporal_lobe_alpha,1,[]);
dunn(X, g)