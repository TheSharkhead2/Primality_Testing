"""
Factors n into n = 2ʳ ⋅ d + 1, returning r and d.

"""
function power2_factor(n::Int)
    n = n-1 # need to work with even number 

    # find the largest power of 2 that divides n
    r = 0 # initialize r to 0
    while n % 2 == 0 # if n is divisable by 2 
        n = div(n, 2) # divide n by 2
        r += 1 # increment r
    end # while

    (r, n) # return r and d (n=d because we have factored 2s out of that variable)

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
    for a in sampledNumbers # loop through all test numbers 
        x = modular_exp(a, d, n) # find aᵈ mod n
        if x ≠ 1 && x ≠ n-1 # if the result of the modular exponentiation isn't ±1, then isn't prime 
            return false 
        end # if
        for _ ∈ 1:k-1 # loop k-1 times 
            x = x*x % n # square x mod n
            if x ≠ n-1 # if x ≠ -1, then not prime 
                return false 
            end # if
        end # for 
    end # for 
    return true # if no issues were found, just assume true
end # function miller_rabin_prime