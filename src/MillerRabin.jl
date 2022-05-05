"""
Factors n into n = 2ʳ ⋅ d + 1, returning r and d.

"""
function power2_factor(n::Int)
    r = trailing_zeros(n-1) # this is equivalent to finding the r. This is because the number of trailing zeros will be the power of 2 that you can divide by (see below)

    d = (n-1) >>> r # find d. Shift r bits to the right, equivalent to dividing by 2ʳ

    (r, d)
end # function power2_factor

"""
Miller Rabin primality test.

"""
function miller_rabin_prime(n::Int, k::Int)
    if n ≤ 3 # ignore numbers less than 3 
        return n > 1 # 2 and 3 are prime, greater than 1, 1 isn't prime, we aren't considering negative numbers 
    elseif n % 2 == 0 # if n is divisable by 2 (and isn't 2) then it isn't prime 
        return false 
    end # if

    (r, d) = power2_factor(n) # find r and d for n = 2ʳ ⋅ d + 1

    sampledNumbers = rand(2:n-2, k) # sample k unique integers between 2 and n-2
    for a ∈ sampledNumbers # loop through all test numbers 
        x = modular_exp(a, d, n) # find aᵈ mod n
        if x == 1  # if we get 1 then it is probably prime, we continue iterations (the following loop is always going to be 1, so why do it)
            continue
        end # if
        t = r # iterator variable to loop maximum r-1 times
        while x ≠ n-1 # we aim to find if there exists a -1, so keep looping until one is found (if one is found, things were successful)
            t -= 1 # decrement t
            t <= 0 && return false # if we looped through r-1 times and we didn't find a -1, then isn't prime (weird if thing which makes a lot of sense but I found exploring various implementations)
            x = oftype(n, widemul(x,x) % n) # compute x² mod n. Widemul to prevent integer overflow, convert back to previous type
            x == 1 && return false # if we get 1, then it will never be -1 (1 ⋅ 1 = 1 always) so isn't prime
        end # while
    end # for 
    return true # if no issues were found, just assume true
end # function miller_rabin_prime