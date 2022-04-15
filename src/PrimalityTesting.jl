module PrimalityTesting

using StatsBase

include("./stupidAlgorithm.jl")

export is_prime_basic, is_prime_stupid, is_prime_less_stupid

include("optimizedPrimes.jl")

export is_prime

include("FermatAlgorithm.jl")

export fermat_prime, modular_exp

end # module PrimalityTesting
