function choose1a(problem_name, method, S, K, T, r, sig)

	if problem_name == '1_a_1'	
		%% Problem 1 a) I	
		method_name={method};
		rootpath=pwd;
		cd(rootpath);
		display('Problem 1 a) I');
		rootpath=pwd;
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

end
