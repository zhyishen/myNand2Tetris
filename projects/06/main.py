from myParser import parser
from pathlib import Path


resultcode = parser('./rect/RectL.asm')
path = './rect/Rect.hack'
with open(path,'w') as file:
    for codeLine in resultcode:
        file.write(codeLine +'\n')