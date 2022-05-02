include("../src/PrimalityTesting.jl")

using .PrimalityTesting

using Primes

k = 1

println("Testing accuracy with range 100000-1000000")
testNumbers = rand(100000:1000000, 100000) # get all primes in range
resultsFermat = miller_rabin_prime.(testNumbers, k)
resultsActual = is_prime.(testNumbers)

differences = resultsFermat .== resultsActual # get how many are equal

println("Accuracy: ", sum(differences)/length(differences)) # number correct will be number of equivalences, or the sum of the bit vector

println("Testing accuracy with range 1000000-10000000")
testNumbers = rand(1000000:10000000, 100000) # get all primes in range
resultsFermat = miller_rabin_prime.(testNumbers, k)
resultsActual = is_prime.(testNumbers)

differences = resultsFermat .== resultsActual # get how many are equal

println("Accuracy: ", sum(differences)/length(differences)) # number correct will be number of equivalences, or the sum of the bit vector

println("Testing accuracy with range 10000000-100000000")
testNumbers = rand(10000000:100000000, 100000) # get all primes in range
resultsFermat = miller_rabin_prime.(testNumbers, k)
resultsActual = is_prime.(testNumbers)

differences = resultsFermat .== resultsActual # get how many are equal

println("Accuracy: ", sum(differences)/length(differences)) # number correct will be number of equivalences, or the sum of the bit vector

println("Testing accuracy with range 100000000-1000000000")
testNumbers = rand(100000000:1000000000, 100000) # get all primes in range
resultsFermat = miller_rabin_prime.(testNumbers, k)
resultsActual = is_prime.(testNumbers)

differences = resultsFermat .== resultsActual # get how many are equal

println("Accuracy: ", sum(differences)/length(differences)) # number correct will be number of equivalences, or the sum of the bit vector

println("Testing accuracy with range 1000000000-10000000000")
testNumbers = rand(1000000000:10000000000, 100) # get all primes in range
resultsFermat = miller_rabin_prime.(testNumbers, k)
resultsActual = is_prime.(testNumbers)

differences = resultsFermat .== resultsActual # get how many are equal

println("Accuracy: ", sum(differences)/length(differences)) # number correct will be number of equivalences, or the sum of the bit vector