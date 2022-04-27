using Primes
x = 0
setprecision(BigFloat, 4096) do
  global x = string(BigFloat(pi))
end

x = replace(x, "." => "")

for i in 1:1226
  if x[i] == '0'
    continue
  end
  p = parse(BigInt, x[i:i+9], base = 10)
  if isprime(p)
    println(p)
    break
  end
end

