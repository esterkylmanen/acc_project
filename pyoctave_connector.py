import os, sys, datetime

def call_octave(funcname,args):
    args = list(map(str, args))
    command = funcname+"("+",".join(args)+")"
    print(command)
    result = os.popen("octave -q --eval \'"+command+"\'").read()
    results = result.split('result =\n\n',1)[1]
    time_result = results.strip().split('\n')[0]
    error_result = results.strip().split('\n')[1].strip() 
    end_time = datetime.datetime.now()
    return [time_result, error_result, end_time]


if(__name__ == '__main__'):
    print(call_octave("choose",sys.argv[1:]))
