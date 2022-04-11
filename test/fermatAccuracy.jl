include("../src/PrimalityTesting.jl")

using .PrimalityTesting

using StatsBase

k = 3

println("Testing accuracy with range 10000-100000")
testNumbers = sample(10000:100000, 10000, replace=false) # sample 1000 unique integers between 10000 and 100000 to test
resultsFermat = fermat_prime.(testNumbers, k)
resultsActual = is_prime.(testNumbers)

differences = resultsFermat .== resultsActual # get how many are equal 

println("Accuracy: ", sum(differences)/length(differences)) # number correct will be number of equivalences, or the sum of the bit vector

println("Testing accuracy with range 100000-1000000")
testNumbers = sample(100000:1000000, 10000, replace=false) # sample 1000 unique integers between 100000 and 1000000 to test
resultsFermat = fermat_prime.(testNumbers, k)
resultsActual = is_prime.(testNumbers)

differences = resultsFermat .== resultsActual # get how many are equal

println("Accuracy: ", sum(differences)/length(differences)) # number correct will be number of equivalences, or the sum of the bit vector

println("Testing accuracy with range 1000000-10000000")
testNumbers = sample(1000000:10000000, 10000, replace=false) # sample 1000 unique integers between 1000000 and 10000000 to test
resultsFermat = fermat_prime.(testNumbers, k)
resultsActual = is_prime.(testNumbers)

differences = resultsFermat .== resultsActual # get how many are equal

println("Accuracy: ", sum(differences)/length(differences)) # number correct will be number of equivalences, or the sum of the bit vector

println("Testing accuracy with range 10000000-100000000")
testNumbers = sample(10000000:100000000, 10000, replace=false) # sample 1000 unique integers between 10000000 and 100000000 to test
resultsFermat = fermat_prime.(testNumbers, k)
resultsActual = is_prime.(testNumbers)

differences = resultsFermat .== resultsActual # get how many are equal

println("Accuracy: ", sum(differences)/length(differences)) # number correct will be number of equivalences, or the sum of the bit vector

println("Testing accuracy with range 100000000-1000000000")
testNumbers = sample(100000000:1000000000, 10000, replace=false) # sample 1000 unique integers between 100000000 and 1000000000 to test
resultsFermat = fermat_prime.(testNumbers, k)
resultsActual = is_prime.(testNumbers)

differences = resultsFermat .== resultsActual # get how many are equal

println("Accuracy: ", sum(differences)/length(differences)) # number correct will be number of equivalences, or the sum of the bit vector