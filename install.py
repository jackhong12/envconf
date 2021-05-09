#!python3
import os
import subprocess
import sys
import json
import argparse

currentPath = os.environ['PWD']
homePath = os.environ['HOME']
dataName = 'data.json'

COLOR = {
    'red': '0;31',
    'white': '1;37',
    'green': '0;32',
}

def colorPrint (msg, color='white'):
    print(f'\033[{COLOR[color]}m{msg}', end='')
    print(f'\033[0m')
    sys.stdout.flush()

def splitString (msg):
    beginS = ''
    beginStrPtr = 0
    endS = ''
    tokenList = []
    lastEnd = 0
    for i in range(len(msg)):
        if msg[i] == '\"' and i > 0 and msg[i - 1] !='\\':
            if beginS == '\"':
                tokenList += [msg[lastEnd:beginStrPtr]]
                tokenList += [msg[beginStrPtr + 1:i]]
                lastEnd = i + 1
                beginS = ''

            elif not beginS:
                beginStrPtr = i
                beginS = '\"'

        if msg[i] == '\'' and i > 0 and msg[i - 1] !='\\':
            if beginS == '\'':
                tokenList += [msg[lastEnd:beginStrPtr]]
                tokenList += [msg[beginStrPtr + 1:i]]
                lastEnd = i + 1
                beginS = ''

            elif not beginS:
                beginStrPtr = i
                beginS = '\''

    if lastEnd != len(msg):
        tokenList += [msg[lastEnd:]]
    return tokenList

def exeCommand (command, removeSudo=False, showOutput=True):
    colorPrint('$ ' + command, 'green')

    # &&
    cwd = './'
    commands = command.split('&&')
    if commands[0].find('cd') == 0:
        cwd = commands[0].split(' ')[1].strip()
        command = commands[1]
    else:
        command = commands[0]

    outputFile = ''
    appendFile = ''
    # '>'
    redirect = command.split(' > ')
    command = redirect[0].strip()
    if len(redirect) > 1:
        outputFile = redirect[1].strip()
        showOutput = False

    # '>>'
    redirect = command.split(' >> ')
    command = redirect[0].strip()
    if len(redirect) > 1:
        appendFile = redirect[1].strip()
        showOutput = False

    command = splitString(command)
    words = []
    for i in range(len(command)):
        if i % 2 == 0:
            words += command[i].split(' ')
        else:
            words += [command[i]]

    if removeSudo and words[0] == 'sudo':
        words = words[1:]

    tmp = words[:]
    words = []
    for t in tmp:
        t.replace('\\"', '"')
        words += [t]

    outMsg = ''
    #try:
    if appendFile or outputFile:
        p = subprocess.Popen(words, stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=cwd)

        while True:
            omsg = p.stdout.readline().decode('utf-8')
            emsg = p.stderr.readline().decode('utf-8')
            outMsg += omsg
            if omsg and showOutput:
                print(omsg, end='')
                sys.stdout.flush()
            if emsg and showOutput:
                print(emsg, end='')
                sys.stdout.flush()
            if not emsg and not omsg and not p.poll():
                break

        if showOutput:
            pass
    else:
        p = subprocess.run(words, cwd=cwd)
        #p = subprocess.run(words)
        #retN = p.wait()

    #except:
    #    pass

    print('')
    sys.stdout.flush()

    if outputFile:
        f = open(outputFile, 'w')
        f.write(outMsg)
        f.close()
    if appendFile:
        f = open(appendFile, 'a')
        f.write(outMsg)
        f.close()

def exeScript (script, removeSudo=False, showOutput=True):
    lines = script.split('\n')
    for line in lines:
        line = line.split('#')[0]
        if line.strip():
            exeCommand(line, removeSudo, showOutput)

def exeFile (data, removeSudo=False, showOutput=True):
    fileName = data['script']
    folder = currentPath + '/.tmux'
    f = open(fileName, mode='r')
    lines = f.readlines()
    script = ''
    for line in lines:
        script += line
    f.close()

    script = script.replace('$(pwd)', currentPath)
    script = script.replace('${HOME}', homePath)
    exeScript(script, removeSudo, showOutput)



if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-docker', action='store_true', help='remove sudo in scripts')
    args = parser.parse_args()

    dataRefs = None
    with open(dataName) as js:
        dataRefs = json.load(js)

    for key in dataRefs.keys():
        if args.docker:
            exeFile(dataRefs[key], removeSudo=True)
        else:
            exeFile(dataRefs[key], removeSudo=False)
