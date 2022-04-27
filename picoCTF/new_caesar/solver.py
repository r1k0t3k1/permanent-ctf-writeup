import string

enc_flag = 'dcebcmebecamcmanaedbacdaanafagapdaaoabaaafdbapdpaaapadanandcafaadbdaapdpandcac'
ALPHABET = string.ascii_lowercase[:16] # abcdefghijklmnop

def base16_decode(encoded):
  base16_decoded = ''
  for i,b in enumerate(encoded):
    if((i+1) % 2 == 0):
      continue

    bintop = ALPHABET.index(b)
    binbottom = ALPHABET.index(encoded[i+1])

    base16_decoded += chr((bintop << 4) + binbottom)
  return base16_decoded


def unshift(shifted:str, key:str):
  shift = ALPHABET.index(key)
  unshifted = ''
  for s in shifted:
    if((ord(s) - shift) < ord(ALPHABET[0])):
      unshifted += chr(ord(s) + 16 - shift)
    else:
      unshifted += chr(ord(s) - shift)
  return unshifted


for k in ALPHABET:
  unshifted = ''
  for e in enc_flag:
    unshifted += unshift(e, k)
  print('key={}: flag={}'.format(k,base16_decode(unshifted)))



