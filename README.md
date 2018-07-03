# RequiredKeywordArguments

[![Build Status](https://travis-ci.org/timkittel/RequiredKeywordArguments.jl.svg?branch=master)](https://travis-ci.org/timkittel/RequiredKeywordArguments.jl)

[![Coverage Status](https://coveralls.io/repos/timkittel/RequiredKeywordArguments.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/timkittel/RequiredKeywordArguments.jl?branch=master)

[![codecov.io](http://codecov.io/github/timkittel/RequiredKeywordArguments.jl/coverage.svg?branch=master)](http://codecov.io/github/timkittel/RequiredKeywordArguments.jl?branch=master)

This package mostly provides the `@rka` macro enabling you to define required keyword arguments in a simple way.

```Julia
using RequiredKeywordArguments

@rka f(;y) = y^2

```
declares `y` to be a required keyword argument. That means
```Julia
f(y=2) # 4 # works
f() # RequiredKeywordArgumentError: `y` is a required keyword argument, please provide `y = ...`.
```
