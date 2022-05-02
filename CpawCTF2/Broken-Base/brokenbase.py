import base64

path = 'C:\\Users\\tiwasaki\\Desktop\\brokenbase.txt'

table = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567'
pad = '='


f = open(path)
s = f.read()
without_pad = s.replace('=','')
ignore_invalid = without_pad.replace('1','')

count = 0
for c in ignore_invalid:
    count += 1 
    num = table.index(c)
    print(f'{c}:{num:05b}')
    if count == 8 :
        print()
        count = 0
