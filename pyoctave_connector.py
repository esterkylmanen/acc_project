import os
import sys

#command = "roundtrip1(\""+sys.argv[1]+"\")"

#print(os.popen("octave -q --eval \'"+command+"\'").read())

def call_octave(funcname,args):
    command = funcname+"(\""+"\",\"".join(args)+"\")"
    return os.popen("octave -q --eval \'"+command+"\'").read()


if(__name__ == '__main__'):
    print(call_octave("choose",sys.argv[1:]))
