include("../src/PrimalityTesting.jl")

using .PrimalityTesting

using BenchmarkTools

k=100

BenchmarkTools.DEFAULT_PARAMETERS.seconds = 50
BenchmarkTools.DEFAULT_PARAMETERS.samples = 100000

println("Testing range 10000-100000")
results = @benchmark fermat_prime(n, k) setup=(n=rand(10000:100000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))

println("Testing range 100000-1000000")
results = @benchmark fermat_prime(n, k) setup=(n=rand(100000:1000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))

println("Testing range 1000000-10000000")
results = @benchmark fermat_prime(n, k) setup=(n=rand(1000000:10000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))

println("Testing range 10000000-100000000")
results = @benchmark fermat_prime(n, k) setup=(n=rand(10000000:100000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))

println("Testing range 100000000-1000000000")
results = @benchmark fermat_prime(n, k) setup=(n=rand(100000000:1000000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))

println("Testing range 1000000000-10000000000")
results = @benchmark fermat_prime(n, k) setup=(n=rand(1000000000:10000000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))

println("Testing range 10000000000-100000000000")
results = @benchmark fermat_prime(n, k) setup=(n=rand(10000000000:100000000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))

println("Testing range 100000000000-1000000000000")
results = @benchmark fermat_prime(n, k) setup=(n=rand(100000000000:1000000000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))

println("Testing range 1000000000000-10000000000000")
results = @benchmark fermat_prime(n, k) setup=(n=rand(1000000000000:10000000000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))