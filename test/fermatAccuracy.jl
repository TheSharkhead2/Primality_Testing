include("../src/PrimalityTesting.jl")

using .PrimalityTesting

using Primes

k = 10

println(modular_exp(12, 123, 5))
println(BigInt(12)^(123) % 5)

readline()

println("Testing accuracy with range 10000-100000")
testNumbers = primes(10000, 100000) # get all primes in range
resultsFermat = fermat_prime.(testNumbers, k)
resultsActual = is_prime.(testNumbers)

differences = resultsFermat .== resultsActual # get how many are equal 

println("Accuracy: ", sum(differences)/length(differences)) # number correct will be number of equivalences, or the sum of the bit vector

println("Testing accuracy with range 100000-1000000")
testNumbers = primes(100000, 1000000) # get all primes in range
resultsFermat = fermat_prime.(testNumbers, k)
resultsActual = is_prime.(testNumbers)

differences = resultsFermat .== resultsActual # get how many are equal

println("Accuracy: ", sum(differences)/length(differences)) # number correct will be number of equivalences, or the sum of the bit vector

println("Testing accuracy with range 1000000-10000000")
testNumbers = primes(1000000, 10000000) # get all primes in range
resultsFermat = fermat_prime.(testNumbers, k)
resultsActual = is_prime.(testNumbers)

differences = resultsFermat .== resultsActual # get how many are equal

println("Accuracy: ", sum(differences)/length(differences)) # number correct will be number of equivalences, or the sum of the bit vector

println("Testing accuracy with range 10000000-100000000")
testNumbers = primes(10000000, 100000000) # get all primes in range
resultsFermat = fermat_prime.(testNumbers, k)
resultsActual = is_prime.(testNumbers)

differences = resultsFermat .== resultsActual # get how many are equal

println("Accuracy: ", sum(differences)/length(differences)) # number correct will be number of equivalences, or the sum of the bit vector

println("Testing accuracy with range 100000000-1000000000")
testNumbers = primes(100000000, 1000000000) # get all primes in range
resultsFermat = fermat_prime.(testNumbers, k)
resultsActual = is_prime.(testNumbers)

differences = resultsFermat .== resultsActual # get how many are equal

println("Accuracy: ", sum(differences)/length(differences)) # number correct will be number of equivalences, or the sum of the bit vector