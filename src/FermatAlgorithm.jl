"""
Fast modular exponentiation algorithm outlined here:
https://en.wikipedia.org/wiki/Modular_exponentiation#Right-to-left_binary_method

"""
function modular_exp(base::Int, exponent::Int, modulus::Int)
    if modulus == 1 # anything mod 1 is 0, so why do anything more here 
        return 0
    end

    result = 1 # initialize result to 1 
    base = base % modulus # can adjust basis to equivalence 
    while exponent > 0 # loop until completed all exponents 
        if exponent % 2 == 1 # we binary shift the exponent each time so if it is odd, then that digit is 1, we ignore 0s 
            result = oftype(modulus, widemul(result, base) % modulus) # multiply by base and can take mod because mod rules
        end # if
        exponent = exponent >> 1 # shift bit representation of exponent to right 
        base = oftype(modulus, widemul(base, base) % modulus) # square base and can take mod
    end # while

    result
end # function modular_exp

"""
Determines whether or not n is prime given k tests of the fermat equality.
Note: this errors if k > n-4

"""
function fermat_prime(n::Int, k::Int)
    if n ≤ 3 # ignore numbers less than 3 off the bat. Algorithm doesn't handle negative numbers (defaults to not prime) and we know 2 or 3 are just prime numbers
        return n > 1 # 2 and 3 are prime, greater than 1, 1 isn't prime, we aren't considering negative numbers 
    elseif n % 2 == 0 # if n is divisable by 2 (and isn't 2) then it isn't prime 
        return false 
    end # if

    testNumbers = sample(2:(n-2), k, replace=false) # sample k unique integers between 2 and n-2 

    for i ∈ testNumbers
        if modular_exp(i, n-1, n) != 1 # if i^(n-1) % n != 1 then n isn't prime 
            return false
        end # if
    end # for

    # if no issues were found, just assume true 
    return true 
end # function fermat_prime


    