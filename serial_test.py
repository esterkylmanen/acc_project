import os, sys, datetime

def call_octave(funcname,args):
    args = list(map(str, args))
    command = funcname+"("+",".join(args)+")"
    print(command)
    result = os.popen("octave -q --eval \'"+command+"\'").read()
    results = result.split('result =\n\n',1)[1]
    time_result = results.strip().split('\n')[0]
    error_result = results.strip().split('\n')[1].strip() 

if(__name__ == '__main__'):
    start_time = datetime.datetime.now()
    mtd = ['COS', 'FFT', 'FGL', 'FD', 'FD-NU', 'FD-AD']
    pbl = ['1_a_1', '1_b_1', '1_b_2', '1_c_1']
    S=[90,100,110]; K=100; T=1.0; r=0.03; sig=0.15;
    parameters = [S,K,T,r,sig]
    argument_set = []
    for m in mtd:
        for p in pbl:
            argument_set.append([["\"{}\"".format(p), "\"{}\"".format(m)] + parameters,m,p])
    for args in argument_set:
        call_octave("choose",args[0])
    end_time = datetime.datetime.now()
    print("Time taken {}".format(end_time - start_time))
