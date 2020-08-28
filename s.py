import sys
import subprocess

debug = False
def p(x):
    if debug:
        sys.stderr.write(str(x) + '\n')
p(sys.argv[1:])

def get_find():
    find = sys.argv[1] if len(sys.argv) > 1 else '.*'
    if set('()') - set(find):
        find = '(' + find + ')'
    return find

def get_replace():
    if len(sys.argv) > 2:
        replace = ' '.join(sys.argv[2:])
        try:
            replace = '$'+str(int(replace))
        except:
            pass
    else:
        replace = '$1'
    return replace.replace('@', '$')

def get_cmd():
    find, replace = get_find(), get_replace()
    return ['rg', find, '--replace', replace, '-o']
    return f"rg {find} --replace '{replace}' -o"

def run(cmd=None):
    cmd = cmd or get_cmd()
    p(cmd)
    output = subprocess.run(cmd, stdout=subprocess.PIPE)
    p(output)
    sout = str(output.stdout.decode('utf-8'))
    return sout.strip()

if __name__ == '__main__':
    ran = run()
    p(ran)
    print(ran)
    #print('echo ' + run())
