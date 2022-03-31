function is_prime(n::Int)
    if n <= 3 # if n is 2 or 3, it is prime (so if it is <= 3 and greater than 1), otherwise 1 isn't and we don't test negative numbers
        return n > 1
    end # if 

    if (n % 2 == 0) || (n % 3 == 0) # if n is divisable by 2 or 3, then it isn't prime
        return false
    end # if

    i=5 # start iteration at 5 
    while i^2 <= n # only need to check until √n 
        if (n % i == 0) || (n % (i+2) == 0) # if n is divisable by i or i+2, then it isn't prime (6k - 1 or 6k + 1 because we started at 5)
            return false
        end # if
        i += 6 # increment by 6 
    end # while

    return true # if we get to this point then n is prime    
end # function is_prime