function convertBase64(char)
    if char == 'A' return 000000 end
    if char == 'B' return 000001 end
    if char == 'C' return 000010 end
    if char == 'D' return 000011 end
    if char == 'E' return 000100 end
    if char == 'F' return 000101 end
    if char == 'G' return 000110 end
    if char == 'H' return 000111 end
    if char == 'I' return 001000 end
    if char == 'J' return 001001 end
    if char == 'K' return 001010 end
    if char == 'L' return 001011 end
    if char == 'M' return 001100 end
    if char == 'N' return 001101 end
    if char == 'O' return 001110 end
    if char == 'P' return 001111 end
    if char == 'Q' return 010000 end
    if char == 'R' return 010001 end
    if char == 'S' return 010010 end
    if char == 'T' return 010011 end
    if char == 'U' return 010100 end
    if char == 'V' return 010101 end
    if char == 'W' return 010110 end
    if char == 'X' return 010111 end
    if char == 'Y' return 011000 end
    if char == 'Z' return 011001 end
    if char == 'a' return 011010 end
    if char == 'b' return 011011 end
    if char == 'c' return 011100 end
    if char == 'd' return 011101 end
    if char == 'e' return 011110 end
    if char == 'f' return 011111 end
    if char == 'g' return 100000 end
    if char == 'h' return 100001 end
    if char == 'i' return 100010 end
    if char == 'j' return 100011 end
    if char == 'k' return 100100 end
    if char == 'l' return 100101 end
    if char == 'm' return 100110 end
    if char == 'n' return 100111 end
    if char == 'o' return 101000 end
    if char == 'p' return 101001 end
    if char == 'q' return 101010 end
    if char == 'r' return 101011 end
    if char == 's' return 101100 end
    if char == 't' return 101101 end
    if char == 'u' return 101110 end
    if char == 'v' return 101111 end
    if char == 'w' return 110000 end
    if char == 'x' return 110001 end
    if char == 'y' return 110010 end
    if char == 'z' return 110011 end
    if char == '0' return 110100 end
    if char == '1' return 110101 end
    if char == '2' return 110110 end
    if char == '3' return 110111 end
    if char == '4' return 111000 end
    if char == '5' return 111001 end
    if char == '6' return 111010 end
    if char == '7' return 111011 end
    if char == '8' return 111100 end
    if char == '9' return 111101 end
    if char == '+' return 111110 end
    if char == '/' return 111111 end
end

function convertBase32(char)
    if char == 'A' return 0 end                                   
    if char == 'B' return 1 end                                   
    if char == 'C' return 2 end                                   
    if char == 'D' return 3 end                                   
    if char == 'E' return 4 end                                   
    if char == 'F' return 5 end                        
    if char == 'G' return 6 end                                
    if char == 'H' return 7 end                        
    if char == 'I' return 8 end                        
    if char == 'J' return 9  end
    if char == 'K' return 10 end
    if char == 'L' return 11 end
    if char == 'M' return 12 end
    if char == 'N' return 13 end
    if char == 'O' return 14 end
    if char == 'P' return 15 end
    if char == 'Q' return 16 end
    if char == 'R' return 17 end
    if char == 'S' return 18 end
    if char == 'T' return 19 end
    if char == 'U' return 20 end
    if char == 'V' return 21 end
    if char == 'W' return 22 end
    if char == 'X' return 23 end
    if char == 'Y' return 24 end
    if char == 'Z' return 25 end
    if char == '2' return 26 end
    if char == '3' return 27 end
    if char == '4' return 28 end
    if char == '5' return 29 end
    if char == '6' return 30 end
    if char == '7' return 31 end
end

using Printf

c = "CRZANFZSAQ3QMF3XWQTBONSTGMS7I52TKNJBNZTX2==="
c = replace(c,'=' => "")
vi = Vector{Int}()
vs = Vector{String}()
bin = ""

for v in c
    convert = convertBase32(v)
    push!(vi, convert)
    global bin = bin * bitstring(convert)[end-4:end]
end

for (i,v) in enumerate(bin)
    if i % 8 == 1
        if i+7 > length(bin)
            push!(vs, bin[i:end])
        else
            push!(vs, bin[i:i+7])
        end
    end
end
println(vs)
println(vi)
for i in vs
    println(parse(Int,i, base = 2))
end

# C: 67 : 1000011
# p: 112: 1110000
# a: 97 : 1100001
# w: 119: 1110111