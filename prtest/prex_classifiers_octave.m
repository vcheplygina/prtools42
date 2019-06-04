%PREX_CLASSIFERS_OCTAVE


combc = qdc([],[],1e-6);
classf = {knnc([],1),knnc,parzenc,parzendc,udc,qdc,mogc,...
          klldc,pcldc,treec,randomforestc,dtc, ...
          pksvc,rbsvc,loglc,logmlc, ...
          fdsc,naivebc,adaboostc, ...
          drbmc,rfishercc, ...
          nmc, ...
          nmsc, ...
          fisherc, ...
          ldc, ...
          quadrc, ...
          svc, ...
          nusvc, ...
          subsc, ...
          perlc, ...
          vpc, ...
          weakc, ...
          lkc, ...
          rsscc, ...
          baggingc, ...
          nmc*combc, ...
          nmsc*combc, ...
          fisherc*combc, ...
          loglc*combc, ...
          svc*combc, ...
          nusvc*combc, ...
          subsc*combc, ...
          perlc*combc, ...
          vpc*combc, ...
          weakc*combc, ...
          lkc*combc, ...
          rsscc*combc, ...
          baggingc*combc, ...
          };

% not (yet?) available in octave
% neurc,bpxnc,lmnc,rbnc,rnnc,

% Matlab based classifiers
% statsdtc,statsknnc,statslinc,statsnbc, ...
% statssvc,pkstatssvc,rbstatssvc,statssvc*combc,

% LIBSVM to be made available
% libsvc,nulibsvc,rblibsvc,pklibsvc, ...

gridsize(100);
randreset;
% trainsize = 1000;
% dimension = 10;
% t = genmdat('gendatm',dimension,1000);
% a = genmdat('gendatm',dimension,trainsize);
% w = cmapm(dimension,'randrot');
% a = a*w;
% t = t*w;
a = gendatm;
t = gendatm(500);
delfigs
w = cell(1,numel(classf));
% v = cell(1,numel(classf));
% u = cell(1,numel(classf));
e = zeros(1,numel(classf));
% f = zeros(1,numel(classf));
% g = zeros(1,numel(classf));
t0 = zeros(1,numel(classf));
t1 = zeros(1,numel(classf));
for j=1:numel(classf)
  tic; w{j} = a*classf{j};  t0(j) = toc;
  tic; e(j) = t*w{j}*testc; t1(j) = toc;
  figure(j)
  scatterd(a);
  title(getname(classf{j}));
  fprintf('%2i %20s %7.3f  %7.3f  %7.3f\n',j,getname(classf{j}),e(j),t0(j), t1(j));
  plotc(w{j})
  drawnow
end

names = char(getname(classf));
[ss,L] = sort(e);
for i=1:max(L)
  fprintf(' %3i  %20s  %6.3f\n',i,names(L(i),:),e(L(i)));
end
save exp_octave trainsize names e