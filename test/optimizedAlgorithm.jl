include("../src/PrimalityTesting.jl")

using .PrimalityTesting

using BenchmarkTools

println(is_prime(2))
println(is_prime(7))
println(is_prime(11))
println(is_prime(13))
println(is_prime(17))
println(is_prime(20))
println(is_prime(21))

println("Testing range 10000-100000")
results = @benchmark is_prime(n) setup=(n=rand(10000:100000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))

println("Testing range 100000-1000000")
results = @benchmark is_prime(n) setup=(n=rand(100000:1000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))

println("Testing range 1000000-10000000")
results = @benchmark is_prime(n) setup=(n=rand(1000000:10000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))

println("Testing range 10000000-100000000")
results = @benchmark is_prime(n) setup=(n=rand(10000000:100000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))

println("Testing range 100000000-1000000000")
results = @benchmark is_prime(n) setup=(n=rand(100000000:1000000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))