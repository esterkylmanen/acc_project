import os, sys, datetime

def call_octave(funcname):
    methods = ['FFT','FGL','COS', 'FD','FD-NU','FD-AD']
    start_time = datetime.datetime.now()
    for method in methods:
        command = funcname+"('"+ method +"')"
        print(command)
        result = os.popen("octave -q --eval \'"+command+"\'").read()
    end_time = datetime.datetime.now()
    print("Time taken {}".format(end_time - start_time))


if(__name__ == '__main__'):
    print(call_octave("serial_test"))
