include("../src/PrimalityTesting.jl")

using .PrimalityTesting

using BenchmarkTools, Plots, PlotThemes

k=1000

BenchmarkTools.DEFAULT_PARAMETERS.seconds = 20
BenchmarkTools.DEFAULT_PARAMETERS.samples = 10000

data = [] 

println("Testing range 10000-100000")
results = @benchmark miller_rabin_prime(n, k) setup=(n=rand(10000:100000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))
push!(data, (100000, mean(results.times)))

println("Testing range 100000-1000000")
results = @benchmark miller_rabin_prime(n, k) setup=(n=rand(100000:1000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))
push!(data, (1000000, mean(results.times)))

println("Testing range 1000000-10000000")
results = @benchmark miller_rabin_prime(n, k) setup=(n=rand(1000000:10000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))
push!(data, (10000000, mean(results.times)))

println("Testing range 10000000-100000000")
results = @benchmark miller_rabin_prime(n, k) setup=(n=rand(10000000:100000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))
push!(data, (100000000, mean(results.times)))

println("Testing range 100000000-1000000000")
results = @benchmark miller_rabin_prime(n, k) setup=(n=rand(100000000:1000000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))
push!(data, (1000000000, mean(results.times)))

println("Testing range 1000000000-10000000000")
results = @benchmark miller_rabin_prime(n, k) setup=(n=rand(1000000000:10000000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))
push!(data, (10000000000, mean(results.times)))

println("Testing range 10000000000-100000000000")
results = @benchmark miller_rabin_prime(n, k) setup=(n=rand(10000000000:100000000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))
push!(data, (100000000000, mean(results.times)))

println("Testing range 100000000000-1000000000000")
results = @benchmark miller_rabin_prime(n, k) setup=(n=rand(100000000000:1000000000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))
push!(data, (1000000000000, mean(results.times)))

println("Testing range 1000000000000-10000000000000")
results = @benchmark miller_rabin_prime(n, k) setup=(n=rand(1000000000000:10000000000000))
println("minimum: ", minimum(results.times))
println("mean: ", mean(results.times))
println("maximum: ", maximum(results.times))
push!(data, (10000000000000, mean(results.times)))

println(data)

theme(:dark)

X = [entry[1] for entry ∈ data] 
Y = [entry[2] for entry ∈ data]

scatter(X, Y, label="Miller-Rabin k = 1000")
plot!(x->(1*log(x))^3, label="Log^3(x)")
savefig("millerRabinPerformance.png")