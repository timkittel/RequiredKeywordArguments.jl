using RequiredKeywordArguments
@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

@rka f(;y) = y
@test f(y=2) == 2
try
    f()
catch e
    @test isa(e, RequiredKeywordArgumentError)
end

@rka g(x; y) = x*y
@test g(2,y=3) == 6
try
    g(2)
catch e
    @test isa(e, RequiredKeywordArgumentError)
end

@rka h(;x=1, y) = x*y
@test h(y=3) == 3
@test h(y=3, x=2) == 6
try
    h(x=2)
catch e
    @test isa(e, RequiredKeywordArgumentError)
end
