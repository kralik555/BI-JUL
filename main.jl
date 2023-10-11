
"""

The `n`-th Catalan number.

"""

function catalan(n::T) where {T <: Integer}
    if n < 0
      throw(ArgumentError("No negative numbers please"))
    end
    T(div(binomial(T(2n), T(n)), T(n + 1)))
end
