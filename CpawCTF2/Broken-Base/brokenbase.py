import base64

encoded = 'CRZANFZSAQ3QMF3XWQTBONSTGMS7I52TKNJBNZTX2==='

table = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567'
pad = '='

without_pad = encoded.replace('=','')

count = 0
d = ''
for c in without_pad:
    num = table.index(c)
    d += f'{num:05b}'

d1 = d[:43]
d2 = d[44:]

d3 = d2 + d1

d3 = [d3[i:i+8] for i in range(0,len(d3),8)]
    
for c in d3:
    try:
        print(chr(int(c,2)),end='')
    except:
        print(f'{c}:error')
