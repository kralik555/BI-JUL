
"""

The `n`-th Catalan number.

"""

# Trying all four approaches... idk why
function catalan(n::Int32)
	# I could add some saving to a list and taking the values out of it to achieve "dynamic programming" but that is too much coding :D
	# might do it for the hard deadline
	if n < 0
		throw(ArgumentError("Please check your input"))
	end
		if n == 0
		return Int32(1)
	end
	ans = 0
	for i in 1:n
		ans = ans + catalan(i-1)*catalan(n-i)	
	end
	return Int32(ans)
end


function catalan(n::Int64)
	if n < 0
		throw(ArgumentError("I curse you to endless recursion!"))
	end
	if n == 0
		return 1
	end
	ans = 0
	return Int64(((2(2n - 1))/(n + 1)) * catalan(n-1))
end


function catalan(n::Int128)
	if n < 0
		throw(ArgumentError("Another dumb entry :D"))
	end
	return Int128((factorial(big(2n))/(factorial(big(n)))^2) - (factorial(big(2n))/(factorial(n+1)*factorial(n-1))))
end


function catalan(n::Integer)
  t = typeof(n)
  if n < 0
	  throw(ArgumentError("No negative numbers please"))
    
  end
  t(round((1 / (n + 1)) * (factorial(big(2n))/(factorial(big(n))*factorial(big(n))))))

end
