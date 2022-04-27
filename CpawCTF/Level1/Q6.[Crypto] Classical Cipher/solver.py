c = 'fsdz{Fdhvdu_flskhu_lv_fodvvlfdo_flskhu}'

for char in c:
  # {}とか_はずらさないでそのまま出力する
  if char.isalpha():
    print(chr(ord(char) - 3),end='')
  else:
    print(char, end='')