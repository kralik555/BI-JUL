"""

Draw and simulate motion of a particle confined to a billiard with boundary
formed by line segments and circular arcs.

"""
module Billiard

export Arc, Segment, Table
export simulate!, draw_path, draw_poincare

#
# Types
#

abstract type Obstacle end


"""

    Segment(A, B)

Obstacle formed by a line segment connecting points `A` and `B`.

"""
struct Segment <: Obstacle
    A::Vector{Float64}
    B::Vector{Float64}
    # ...you may wish to add other attributes...

    # ...custom constructor...
end


@doc raw"""

    Arc(C, R, α, β)

Obstacle formed by a circular arc defined by the circle of radius `R` and
center `C`, and specified by the polar coordinates `α` and `β` (measured counter clock-wise with respect to `R` and with the angle running from ``-π`` to ``π``, the direction of the positive ``x`` axis corresponds to
the angle ``0``).

More precisely, the circular arc is parametrized by ``x = R \cos(t)`` and
``y = R \sin(t)` for ``t ∈ ⟨α, β⟩`` where ``α < β``.

"""
struct Arc <: Obstacle
    C::Vector{Float64}
    R::Float64
    α::Float64
    β::Float64
    # ...you may wish to add other attributes...

    # ...custom constructor...
end


"""

    Table(obstacles)

The billiard table is formed by number of obstacles.

"""
struct Table
    obstacles::Vector{<:Obstacle}
    # ...you may need to add other...

    # ...custom constructor...
end

#
# Functions and methods
#

"""

    simulate!(table, path)

Run the simulation on the `table`.
First two rows of `path` represent position, last two velocity.
The first column holds the initial condition, the rest is overwritten. 
"""
function simulate!(table::Table, path::Matrix{Float64})
    # FIX ME!
end


"""

    draw_path(table, path)

Draw the `table` and a `path`.

"""
function draw_path(table::Table, path::Matrix{Float64})
    # FIX ME
end


"""

    draw_poincare(paths, P1, P2)

Draw the Poincaré section from array of trajectories (`paths`) and defined
by segment with endpoints `P1` and `P2`.

"""
function draw_poincare(paths, P1::Vector{Float64}, P2::Vector{Float64})
    # FIX ME
end

end # module

