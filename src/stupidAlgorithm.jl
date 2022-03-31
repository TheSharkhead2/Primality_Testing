"""
The simple, brute-force algorithm to calculate if n is prime 

"""
function is_prime_basic(n::Int)
    if n < 2 # ignore inputs less than 2 (1 isn't prime)
        return false
    elseif n == 2 # 2 is prime
        return true
    elseif n % 2 == 0 # if n is divisable by 2 (and isn't 2) then it isn't prime 
        return false 
    end # if 

    for i in 2:n-1 # check all odd numbers between 2 and n-1
        if n % i == 0 # if n is divisable by i then it isn't prime
            return false
        end # if
    end # for

    return true # if we get to this point then n is prime
end # function is_prime_basic

"""
The even stupider algorithm which doesn't even check if n is divisable by 2

"""
function is_prime_stupid(n::Int)
    if n < 2 # ignore inputs less than 2 (1 isn't prime)
        return false
    elseif n == 2 # 2 is prime
        return true
    end # if 

    for i in 2:n-1 # check all odd numbers between 2 and n-1
        if n % i == 0 # if n is divisable by i then it isn't prime
            return false
        end # if
    end # for

    return true # if we get to this point then n is prime
end # function is_prime_stupid

"""
A still stupid, but slightly optimized basic algorithm

"""
function is_prime_less_stupid(n::Int)
    if n < 2 # ignore inputs less than 2 (1 isn't prime)
        return false
    elseif n == 2 # 2 is prime
        return true
    elseif n % 2 == 0 # if n is divisable by 2 (and isn't 2) then it isn't prime 
        return false 
    end # if 

    for i in 2:Int(ceil(n/2)) # check all odd numbers between 2 and n-1
        if n % i == 0 # if n is divisable by i then it isn't prime
            return false
        end # if
    end # for

    return true # if we get to this point then n is prime
end # function is_prime_less_stupid