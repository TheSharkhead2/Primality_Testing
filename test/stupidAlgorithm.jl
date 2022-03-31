include("../src/PrimalityTesting.jl")

using .PrimalityTesting

using BenchmarkTools

# println(is_prime_basic(2))
# println(is_prime_basic(7))
# println(is_prime_basic(11))
# println(is_prime_basic(13))
# println(is_prime_basic(17))
# println(is_prime_basic(20))
# println(is_prime_basic(21))

# println(is_prime_stupid(2))
# println(is_prime_stupid(7))
# println(is_prime_stupid(11))
# println(is_prime_stupid(13))
# println(is_prime_stupid(17))
# println(is_prime_stupid(20))
# println(is_prime_stupid(21))

# println("Testing range 10000-100000")
# results = @benchmark is_prime_stupid(n) setup=(n=rand(10000:100000))
# println("minimum: ", minimum(results.times))
# println("mean: ", mean(results.times))
# println("maximum: ", maximum(results.times))

# println("Testing range 100000-1000000")
# results = @benchmark is_prime_stupid(n) setup=(n=rand(100000:1000000))
# println("minimum: ", minimum(results.times))
# println("mean: ", mean(results.times))
# println("maximum: ", maximum(results.times))

# println("Testing range 1000000-10000000")
# results = @benchmark is_prime_stupid(n) setup=(n=rand(1000000:10000000))
# println("minimum: ", minimum(results.times))
# println("mean: ", mean(results.times))
# println("maximum: ", maximum(results.times))

# println("Testing range 10000000-100000000")
# results = @benchmark is_prime_stupid(n) setup=(n=rand(10000000:100000000))
# println("minimum: ", minimum(results.times))
# println("mean: ", mean(results.times))
# println("maximum: ", maximum(results.times))

# println("Testing range 100000000-1000000000")
# results = @benchmark is_prime_stupid(n) setup=(n=rand(100000000:1000000000))
# println("minimum: ", minimum(results.times))
# println("mean: ", mean(results.times))
# println("maximum: ", maximum(results.times))

println(is_prime_less_stupid(2))
println(is_prime_less_stupid(7))
println(is_prime_less_stupid(11))
println(is_prime_less_stupid(13))
println(is_prime_less_stupid(17))
println(is_prime_less_stupid(20))
println(is_prime_less_stupid(21))

println("Testing range 10000-100000")
results = @benchmark is_prime_less_stupid(n) setup=(n=rand(10000:100000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))

println("Testing range 100000-1000000")
results = @benchmark is_prime_less_stupid(n) setup=(n=rand(100000:1000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))

println("Testing range 1000000-10000000")
results = @benchmark is_prime_less_stupid(n) setup=(n=rand(1000000:10000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))

println("Testing range 10000000-100000000")
results = @benchmark is_prime_less_stupid(n) setup=(n=rand(10000000:100000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))

println("Testing range 100000000-1000000000")
results = @benchmark is_prime_less_stupid(n) setup=(n=rand(100000000:1000000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))