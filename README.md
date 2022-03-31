# Primality Testing

This is a project where I am exploring various algorithms for testing whether or not a number is prime. What are the different running times of these algorithms? How can we speed this process up? 

## The Dumb Solution

What is the obvious way of testing if a number is prime? Well, we just test all the numbers less than the number we intend to test, if any of them divide the number, it isn't prime. This algorithm would look something like: 
```julia
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
```

The only thing other than testing all the numbers below the inputted number we are doing is: 1) checking if the number is negative or 1 (either way, we are just going to say it isn't prime (we don't care about negative numbers)) and 2) if the number is 2, because we want to algorithm to be correct and 2 is prime. 

After this one bit of actually doing some logic, we just loop through every single number less than n, test to see n is divisable by it, if it is, then n isn't prime. Once we loop through all of that, if we didn't find a number n was divisable by, then it must be prime. 

What is the running time of this? Well considering worst case (so any number besides 1 and 2) this runs in O(n) time. You loop through every number less than n and then do an operation at each step. There is a chance this terminates on the first loop (at 2 for example if it is even), but for a prime number, this will loop through EVERY value. 

We can confirm that this does indeed run in O(n) time: 
```
random number range → maximum time (ns), average time (ns)
10000, 100000 → 173831.8 ns, 8342 ns
100000, 1000000 → 1.6671904e6 ns, 104439 ns
1000000, 10000000 → 1.13468907e7, 1.4186300875e6 ns 
10000000, 100000000 → 1.541426022e8, 3.08285237e7 ns 
```

Maximum time is a little bit of a better measurement here as this algorithm (despite being really stupid) still runs quite fast on even numbers (it is one check at the beginning of the loop and then if it is even it just terminates there). Still, this is very clearly O(n) time. 

But the fact that it is O(n) time isn't necessarily the bad part. If you think about it, really any algorithm testing for primes will be in O(n) time as the larger the number, the more things you have to check. Just... We can reduce the amount of checks necessary quite substantially. 

## Slightly Less Dumb (But Still Dumb) Solution

We can speed up our algorithm in a few ways without having to make any cool math jumps (which is what happens for some later algorithms). We can do this by thinking about factoring a number. This algorithm is searching for a way to split one number into 2 different numbers (which when multiplied together gets you back to that inital number). When you multiply two positive integers together, we can say:
```
a ⋅ b ≥ b  and  a ⋅ b ≥ a
```

Basically, multiplying by a natural number will always yeild a greater number (unless it is 1, in which case it will be the same). Why does this matter? Well what is the smallest number we are going to be checking? 2. And if the number we are checking for if it is prime is divisable by 2, then we know ```2 ⋅ x/2 = x``` As we are only considering integers, we won't have a multiplier less than 2... And increasing ```x/2``` by anything would, by definition, increase the result of ``` 2 ⋅ x/2```. Therefore, we don't have to check any numbers greater than ```n/2```. An example of this working could be with 64: 
```
1 ⋅ 64
2 ⋅ 32 
4 ⋅ 16
8 ⋅ 8 
```
The smallest number we need to check is 2, and the number that it muliplies with will be the largest. Therefore, we don't need to check any numbers larger than the number divided by 2, there just aren't any integers that could multiply to get back to the number. 

So we can write this algorithm like so:
```julia
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
```

Here we are only really making a few changes. For one, we are checking to see if the number is even immedietly and not in the first loop. This won't have major performance impacts, but it should at least make it such that the code never has to generate the iter object saving a bit of memory. But the main change is we are looking for numbers, below half of the number we are testing, to see if they divide our number. 


Testing this algorithm, we get the results: 
```
random number range → maximum time (ns), average time (ns)
10000, 100000 → 70517.8 ns, 3210 ns
100000, 1000000 → 659495.5 ns, 38442.2 ns
1000000, 10000000 → 5.2918406e6, 403156.5 ns 
10000000, 100000000 → 1.72449799e7, 663289.7 ns 
```

And yeah, that is faster. In fact, as we would expect, it is roughly 2x the speed of our previous algorithm. Though these gains are entirely expected from a naive approach as all we have really done in optimization is removed calculations that we had already done. Now we look at some more interesting algorithms. 

## That Algorithm I Found on Wikipedia

A while back when looking at implementing RSA, I needed a way to find primes (very large primes), and so I didn't want to spend hours just trying to find a massive prime. Hence, I looked at [wikipedia](https://en.wikipedia.org/wiki/Primality_test). I came across quite an odd algorithm which I just looked at the code for, I got confused, and moved on with RSA. But this was partially the inspiration for this project, and the reason for that is that I was so confused by this test that I wanted to explore it a bit more. 

So what kinds of optimizations does the Wikipedia page talk about? Well for starters, it builds on removing uneccessary tests. Now I talked about not testing and numbers greater than n/2, but we can actually stop testing all numbers greater than √n. Why? Well let's look at our 64 example from before: 
```
1 ⋅ 64
2 ⋅ 32 
4 ⋅ 16
8 ⋅ 8 
```

The largest number that isn't paired with a larger number is 8 (if that made any sense). For 1, 2, and 4, we could test those numbers or larger numbers. At 8, we see a turn around where the two factors are as close as possible (here they are equal). As you may notice, 8 is √64. We find this because, intuitively, the point where a number multiplied by itself is another is just the square root. If we increase one of the factors, that has to come with a decrease of the other (and vise versa). Therefore, decreasing from 8 will test all factors above 8, and the other way around. As there are less numbers below √n than above it, we might as well just test numbers up until √n. 

But we can actually imporve this even more when we notice that all primes greater than 3 follow the pattern of 6k ± 1 (I would believe it I am just not entirely sure how you get here. Insert some math stuff.). For all other numbers, we can represent them as 6k + 0, 6k + 2, 6k + 3, 6k + 4. But we will notice that the following are divisable by 2: 6k + 0, 6k + 2, 6k + 4, and the following is divisable by 3: 6k + 3. Therefore, if we immeditely check to see if the number is divisable by 2 or 3, we can remove a significant chunk of numbers without checking any further. 

From here, we just check every single number that is of the form 6k ± 1 ≤ √n in order to find any divisability of n. This is about 3x as fast as checking every number below √n as we are checking 2 in every 6 numbers, or 1 in 3. Essentially, we are testing all numbers that have the possibility of being prime (by the 6k ± 1 rule, though this obviously produces some non-primes) below √n. We can do this as every non-prime can be disassembled into primes, meaning we test those primes, we don't need to test the number itself. This yeilds us the algorithm: 

```julia
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
```

The Wikipedia page also talks about optimizations in the form of storing a fair amount of primes and testing all of them off the bat, which would speed things up considerably but which I won't do here. Testing the algorithm, we find it performs like so: 
```
random number range → maximum time (ns), average time (ns)
10000, 100000 → 159.6 ns, 14.8 ns
100000, 1000000 → 516.8 ns, 34.6 ns
1000000, 10000000 → 1485.9 ns, 81.19 ns 
10000000, 100000000 → 4685.9 ns, 226.49 ns 
100000000, 1000000000 → 13934.9 ns, 614.7 ns
```

That is so much faster than the previous algorithms. This makes sense, of course, as instead of running in O(n/2) time we are running in O(√n/3) time... Which is much faster. So fast I even waited in 2 seconds for numbers on the magnitude of 1000000000, which took longer than a minute and I gave up on for previous algorithms. 

