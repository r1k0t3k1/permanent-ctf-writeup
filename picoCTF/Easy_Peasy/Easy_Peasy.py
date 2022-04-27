from pwn import *

host = 'mercury.picoctf.net' 
port = 36981

conn = remote(host, port)
conn.recvlines(2)
enc_flag = conn.recvline().strip()
print(enc_flag)
conn.recvline()

exploit = b'A' * (50000 - (len(enc_flag)//2))

conn.sendline(exploit)
conn.recvlines(2)

conn.sendline(bytes(32))
conn.recvlines(2)

key = conn.recvline().strip()
print(key)

print(binascii.unhexlify('{:x}'.format(int(key, 16) ^ int(enc_flag, 16))))

# 7f9da29f40499a98db220380a57746a4

conn.close()