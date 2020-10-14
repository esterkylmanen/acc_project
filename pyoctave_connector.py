import os, sys

def call_octave(funcname,args):
    command = funcname+"(\""+"\",\"".join(args)+"\")"
    result = os.popen("octave -q --eval \'"+command+"\'").read()
    results = result.split('result =\n\n',1)[1]
    time_result = results.strip().split('\n')[0]
    error_result = results.strip().split('\n')[1].strip() 
    return [time_result, error_result]


if(__name__ == '__main__'):
    print(call_octave("choose",sys.argv[1:]))
