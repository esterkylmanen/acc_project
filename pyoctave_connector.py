import os
import sys

command = "roundtrip1(\""+sys.argv[1]+"\")"

print(os.popen("octave -q --eval \'"+command+"\'").read())
