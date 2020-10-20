
function serial_test(method)

    format long
    method_name={method};

    %% Problem 1 a) I

    display('Problem 1 a) I');
    rootpath=pwd;
    S=[90,100,110]; K=100; T=1.0; r=0.03; sig=0.15;
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

    cd(rootpath);

    %% Problem 1 b) I

    display('Problem 1 b) I');
    rootpath=pwd;
    S=[90,100,110]; K=100; T=1.0; r=0.03; sig=0.15;
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

    cd(rootpath);

    %% Problem 1 c) I

    display('Problem 1 c) I');
    rootpath=pwd;
    S=[90,100,110]; K=100; T=1.0; r=0.03; sig=0.15; B=1.25*K;
    U=[1.822512255945242 3.294086516281595 3.221591131246868];

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

    cd(rootpath);

    %% Problem 1 b) II

    display('Problem 1 b) II');
    rootpath=pwd;
    S=[97,98,99]; K=100; T=0.25; r=0.1; sig=0.01;
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

    cd(rootpath);
end