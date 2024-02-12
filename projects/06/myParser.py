from pathlib import Path
import re
from myCode import destParser, compParser, jumpParser

def parser(path):
    parserCode=[]
    with open(path) as file:
        mycode = file.read().splitlines()
        for codeLine in mycode:
            if not removeComments(codeLine):
                parserCodeLine = commandType(codeLine)
                parserCode.append(parserCodeLine)
    return parserCode


def removeComments(codeLine):
    pattern = re.compile(r'//.*?$')
    return pattern.match(codeLine) or codeLine == ''

def commandType(codeLine):
    patternA = re.compile(r'^@(\w*)')
    match = patternA.match(codeLine)
    if match:
        parserCodeLine = parserAcommand(match)
    else:
        parserCodeLine = parserCommand(codeLine)
    return parserCodeLine

def parserAcommand(match):
    aCommand = match.groups(1)
    aNumber = int (aCommand[0])
    parserCode = '{:015b}'.format(aNumber)
    return '0'+parserCode

def parserCommand(codeLine):
    patternC = re.compile(r'(?:(?P<dest>[^=;]+)=)?(?P<comp>[^;]+)(?:;(?P<jump>.*))?')
    match = patternC.match(codeLine)
    dest = match.group('dest')
    comp = match.group('comp')
    jump = match.group('jump')
    return '111'+ compParser(comp) + destParser(dest)  + jumpParser(jump)