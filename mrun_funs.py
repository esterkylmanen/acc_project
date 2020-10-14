import pyoctave_connector as poc

def run_method_and_problem(method,problem):
    return poc.call_octave("choose",[method,problem])
