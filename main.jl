
using  LinearAlgebra

"""

    maxeig(A; epsilon, norm_epsilon, max_iter)

Attempt to compute the donimant eigenvalue of `A`.

"""
function maxeig(
    A::Matrix{Complex{T}};
    epsilon::T = sqrt(eps(T)),
    norm_epsilon::T = epsilon * length(A),
    max_iter::Integer = 1_000
) where { T <: AbstractFloat }
    # FIXME!
end

maxeig(
    A::Matrix{T};
    epsilon::Real = sqrt(eps(Float64)),
    norm_epsilon::Real = epsilon * length(A),
    max_iter::Integer = 1_000
) where { T <: Real } =
    maxeig(Complex{Float64}.(A), epsilon=epsilon, norm_epsilon=norm_epsilon, max_iter=max_iter)

"""

    maxeig(A, mu; epsilon, norm_epsilon, max_iter)

Attempt to compute the eigenvalue of `A` closest to `mu`.

"""
function mineig(
    A::Matrix{Complex{T}}, mu=Complex{T}(0);
    epsilon::T = sqrt(eps(T)),
    norm_epsilon::T = epsilon * length(A),
    max_iter::Integer = 1_000
) where { T <: AbstractFloat }
    # FIXME!
end

mineig(
  A::Matrix{T}, mu=T(0);
  epsilon::Real = sqrt(eps(Float64)),
  norm_epsilon::Real = epsilon * length(A),
  max_iter::Integer = 1_000
) where { T <: Real } =
    mineig(Complex{Float64}.(A), Complex{Float64}(mu), epsilon=epsilon, norm_epsilon=norm_epsilon, max_iter=max_iter)
