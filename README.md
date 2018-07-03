# RequiredKeywordArguments

[![Build Status](https://travis-ci.org/timkittel/RequiredKeywordArguments.jl.svg?branch=master)](https://travis-ci.org/timkittel/RequiredKeywordArguments.jl)

[![Coverage Status](https://coveralls.io/repos/timkittel/RequiredKeywordArguments.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/timkittel/RequiredKeywordArguments.jl?branch=master)

[![codecov.io](http://codecov.io/github/timkittel/RequiredKeywordArguments.jl/coverage.svg?branch=master)](http://codecov.io/github/timkittel/RequiredKeywordArguments.jl?branch=master)

This package mostly provides the `@rka` macro enabling you to define required keyword arguments in a simple way.

```Julia
using RequiredKeywordArguments

@rka f(;y) = y^2

```
is simply equivalent to

```Julia
using RequiredKeywordArguments

f(;y=RequiredKeywordArguments("y") = y^2

```
which throws an error if you do not provide an argument for y.
