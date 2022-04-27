c = "fsdz{Fdhvdu_flskhu_lv_fodvvlfdo_flskhu}"

for char in c
  # {}とか_はずらさないでそのまま出力する
  if all(isletter,char)
    print(Char(Int(char) - 3))
  else
    print(char) 
  end
end