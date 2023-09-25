using Test

include("../main.jl")

@testset "First test set" begin
    @test F(1) == 2
end

