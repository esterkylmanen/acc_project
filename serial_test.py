import os, sys, datetime

def call_octave(funcname):
    start_time = datetime.datetime.now()
    command = funcname+"()"
    result = os.popen("octave -q --eval \'"+command+"\'").read()
    end_time = datetime.datetime.now()
    print("Time taken {}".format(end_time - start_time))


if(__name__ == '__main__'):
    print(call_octave("serial_test"))
