% Copyright (c) 2015, BENCHOP, Slobodan Milovanović
% All rights reserved.
% This MATLAB code has been written for the BENCHOP project.
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are
% met:
%    * Redistributions of source code must retain the above copyright
%       notice, this list of conditions and the following disclaimer.
%    * Redistributions in binary form must reproduce the above copyright
%       notice, this list of conditions and the following disclaimer in
%       the documentation and/or other materials provided with the distribution
%    * BENCHOP article is properly cited by the user of the BENCHOP codes when publishing/reporting related scientific results.
% 
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
% LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
% CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
% SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
% INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
% POSSIBILITY OF SUCH DAMAGE.

function choose(problem_name, method, S, K, T, r, sig)

	if problem_name == '1_a_1'	
		%% Problem 1 a) I	
		method_name={method};
		rootpath=pwd;
		cd(rootpath);
		display('Problem 1 a) I');
		U=[2.758443856146076 7.485087593912603 14.702019669720769];
		filepathsBSeuCallUI=getfilenames('./','BSeuCallUI_*.m');
		par={S,K,T,r,sig};
		[timeBSeuCallUI,relerrBSeuCallUI] = executor(rootpath,filepathsBSeuCallUI,U,par)

		tBSeuCallUI=NaN(numel(method_name),1); rBSeuCallUI=tBSeuCallUI;
		for ii=1:numel(method_name)
		    for jj=1:numel(filepathsBSeuCallUI)
			a=filepathsBSeuCallUI{jj}(3:3+numel(method_name{ii}));
			b=[method_name{ii},'/'];
			if strcmp(a,b)
			    tBSeuCallUI(ii)=timeBSeuCallUI(jj);
			    rBSeuCallUI(ii)=relerrBSeuCallUI(jj);
			end
		    end
		end
		s = struct('result',[tBSeuCallUI;rBSeuCallUI]);
        disp(s);
	end

	if problem_name == '1_b_1'
		%% Problem 1 b) I
		method_name={method};
		rootpath=pwd;
		cd(rootpath);
		display('Problem 1 b) I');
		U=[10.726486710094511 4.820608184813253 1.828207584020458];
		filepathsBSamPutUI=getfilenames('./','BSamPutUI_*.m');
		par={S,K,T,r,sig};
		[timeBSamPutUI,relerrBSamPutUI] = executor(rootpath,filepathsBSamPutUI,U,par)

		tBSamPutUI=NaN(numel(method_name),1); rBSamPutUI=NaN(numel(method_name),1);
		for ii=1:numel(method_name)
		    for jj=1:numel(filepathsBSamPutUI)
			a=filepathsBSamPutUI{jj}(3:3+numel(method_name{ii}));
			b=[method_name{ii},'/'];
			if strcmp(a,b)
			    tBSamPutUI(ii)=timeBSamPutUI(jj);
			    rBSamPutUI(ii)=relerrBSamPutUI(jj);
			end
		    end
		end
		s = struct('result',[tBSamPutUI;rBSamPutUI]);
    	disp(s);
	end

	if problem_name == '1_c_1'
		%% Problem 1 c) I
		method_name={method}
		rootpath=pwd
		cd(rootpath)
		display('Problem 1 c) I');
		U=[1.822512255945242 3.294086516281595 3.221591131246868];
		B = 1.25*K;
		filepathsBSupoutCallI=getfilenames('./','BSupoutCallI_*.m');
		par={S,K,T,r,sig,B};
		[timeBSupoutCallI,relerrBSupoutCallI] = executor(rootpath,filepathsBSupoutCallI,U,par)

		tBSupoutCallI=NaN(numel(method_name),1); rBSupoutCallI=NaN(numel(method_name),1);
		for ii=1:numel(method_name)
		    for jj=1:numel(filepathsBSupoutCallI)
			a=filepathsBSupoutCallI{jj}(3:3+numel(method_name{ii}));
			b=[method_name{ii},'/'];
			if strcmp(a,b)
			    tBSupoutCallI(ii)=timeBSupoutCallI(jj);
			    rBSupoutCallI(ii)=relerrBSupoutCallI(jj);
			end
		    end
		end
		s = struct('result',[tBSupoutCallI;rBSupoutCallI]);
        disp(s);
	end

	if problem_name == '1_a_2'		
		% Problem 1 a) II
		method_name={method}
		rootpath=pwd
		cd(rootpath)
		display('Problem 1 a) II');
		U=[0.033913177006141   0.512978189232598   1.469203342553328];
		filepathsBSeuCallUII=getfilenames('./','BSeuCallUII_*.m');
		par={S,K,T,r,sig};
		[timeBSeuCallUII,relerrBSeuCallUII] = executor(rootpath,filepathsBSeuCallUII,U,par)

		tBSeuCallUII=NaN(numel(method_name),1); rBSeuCallUII=NaN(numel(method_name),1);
		for ii=1:numel(method_name)
		    for jj=1:numel(filepathsBSeuCallUII)
			a=filepathsBSeuCallUII{jj}(3:3+numel(method_name{ii}));
			b=[method_name{ii},'/'];
			if strcmp(a,b)
			    tBSeuCallUII(ii)=timeBSeuCallUII(jj);
			    rBSeuCallUII(ii)=relerrBSeuCallUII(jj);
			end
		    end
		end
		s = struct('result',[tBSeuCallUII;rBSeuCallUII]);
    	disp(s);
	end

	if problem_name == '1_b_2'
		% Problem 1 b) II
		method_name={method}
		rootpath=pwd
		cd(rootpath)
		display('Problem 1 b) II');
		U=[3.000000000000682 2.000000000010786   1.000000000010715];
		filepathsBSamPutUII=getfilenames('./','BSamPutUII_*.m');
		par={S,K,T,r,sig};
		[timeBSamPutUII,relerrBSamPutUII] = executor(rootpath,filepathsBSamPutUII,U,par)

		tBSamPutUII=NaN(numel(method_name),1); rBSamPutUII=NaN(numel(method_name),1);
		for ii=1:numel(method_name)
		    for jj=1:numel(filepathsBSamPutUII)
			a=filepathsBSamPutUII{jj}(3:3+numel(method_name{ii}));
			b=[method_name{ii},'/'];
			if strcmp(a,b)
			    tBSamPutUII(ii)=timeBSamPutUII(jj);
			    rBSamPutUII(ii)=relerrBSamPutUII(jj);
			end
		    end
		end
		s = struct('result',[tBSamPutUII;rBSamPutUII]);
        disp(s);
	end

	if problem_name == '1_c_2'
		% Problem 1 c) II
		method_name={method}
		rootpath=pwd
		cd(rootpath)
		display('Problem 1 c) II');
		U=[0.033913177006134   0.512978189232598   1.469203342553328];
		B = 1.25*K;
		filepathsBSupoutCallII=getfilenames('./','BSupoutCallII_*.m');
		par={S,K,T,r,sig,B};
		[timeBSupoutCallII,relerrBSupoutCallII] = executor(rootpath,filepathsBSupoutCallII,U,par)

		tBSupoutCallII=NaN(numel(method_name),1); rBSupoutCallII=NaN(numel(method_name),1);
		for ii=1:numel(method_name)
		    for jj=1:numel(filepathsBSupoutCallII)
			a=filepathsBSupoutCallII{jj}(3:3+numel(method_name{ii}));
			b=[method_name{ii},'/'];
			if strcmp(a,b)
			    tBSupoutCallII(ii)=timeBSupoutCallII(jj);
			    rBSupoutCallII(ii)=relerrBSupoutCallII(jj);
			end
		    end
		end
		s = struct('result',[tBSupoutCallII;rBSupoutCallII]);
		disp(s);
	end

end

