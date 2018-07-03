module RequiredKeywordArguments

"Error to be thrown if a required keyword argument is missing"
type RequiredKeywordArgumentError <: Exception
    varname
    reason
end
function Base.showerror(io::IO, e::RequiredKeywordArgumentError)
    text = "RequiredKeywordArgumentError: `$(e.varname)` is a required keyword argument, please provide `$(e.varname) = ...`."
    if !isempty(e.reason)
        text *= " $(e.reason)"
    end
    print(io, text)
end

"Function to be used to declare an argument as a required keyword argument."
RequiredKeywordArgument(varname, reason) = throw(RequiredKeywordArgumentError(varname, reason))
RequiredKeywordArgument(varname; reason="") = RequiredKeywordArgument(varname, reason)
RKA = RequiredKeywordArgument

"Convert a functions symbol argument to the corresponding required keyword argument."
function symbol2kw(sym::Symbol)
    Expr(:kw, sym, Expr(:call, RequiredKeywordArgument, string(sym)))
end
symbol2kw(arg) = arg

"""
With @rka, for a function you can define a required keyword argument by simply
not providing a default value.

This means that

    @rka f(;y) = ...

is equivalent to

    f(;y=RequiredKeywordArgument("y")) = ...

"""
macro rka(func)
    params = func.args[1].args[2]
    params.args = map(symbol2kw, params.args)
    return esc(func)
end

export RequiredKeywordArgument, RKA, @rka, RequiredKeywordArgumentError

end # module RequiredKeywordArguments
