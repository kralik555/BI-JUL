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
	size(A, 1) == size(A, 2) || throw(ArgumentError("Not a square matrix"))
	(epsilon >= 0 && norm_epsilon >= 0 && max_iter >= 0) || throw(ArgumentError("Arguments must be positive"))
	max_iter > 0 || throw(ErrorException("Zero iterations are not enough"))
	
	x_k = rand(Complex{T}, size(A, 1))
	lambda_old = nothing
	for i in 1:max_iter
		Ax = A * x_k
		x_k1 = Ax / norm(Ax)
		lambda_new = dot(x_k1, A * x_k1) / dot(x_k1, x_k1)
		
		lambda_old !== nothing && abs(lambda_new - lambda_old) < epsilon && 
			norm(A * x_k - lambda_old * x_k) < norm_epsilon && return lambda_new, x_k1
		lambda_old = lambda_new
		x_k = x_k1
	end
	throw(ErrorException("Not enough iterations to find the solution"))
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
	size(A, 1) == size(A, 2) || throw(ArgumentError("Not a square matrix!"))
	(epsilon >= 0 && norm_epsilon >= 0 && max_iter >= 0) || throw(ArgumentError("Arguments must be positive"))
	max_iter > 0 || throw(ErrorException("Zero iterations are not enough"))
	det(A - mu * I) == 0 && throw(ArgumentError("SingularMatrix"))
	
	x_k = rand(Complex{T}, size(A, 1))
	lambda_old = nothing
	A_moved = A - mu * I
	A_moved = lu(A_moved)
	for i in 1:max_iter
		Ax = A_moved \ x_k
		x_k1 = Ax / norm(Ax)
		lambda_new = dot(x_k1, A * x_k1) / dot(x_k1, x_k1)
		
		lambda_old !== nothing && abs(lambda_new - lambda_old) < epsilon && norm(A * x_k - lambda_old * x_k) < norm_epsilon && return lambda_new, x_k1
		lambda_old = lambda_new
		x_k = x_k1
	end
	throw(ErrorException("Not enough iterations to find the solution"))
end

mineig(
  A::Matrix{T}, mu=T(0);
  epsilon::Real = sqrt(eps(Float64)),
  norm_epsilon::Real = epsilon * length(A),
  max_iter::Integer = 1_000
) where { T <: Real } =
    mineig(Complex{Float64}.(A), Complex{Float64}(mu), epsilon=epsilon, norm_epsilon=norm_epsilon, max_iter=max_iter)
