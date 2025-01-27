
# InverseGamma distribution

export InverseGamma

@parameterized InverseGamma(shape) ≃ Lebesgue(ℝ₊)

@inline function logdensity_def(μ::InverseGamma{(:shape,)}, x)
    α = μ.shape
    xinv = 1 / x

    return xlogy(α + 1, xinv) - xinv - loggamma(α)
end

Base.rand(rng::AbstractRNG, T::Type, μ::InverseGamma{(:shape,)}) =
    rand(rng, Dists.InverseGamma(μ.shape))

≪(::InverseGamma, ::Lebesgue{X}) where {X<:Real} = true

TV.as(::InverseGamma) = asℝ₊

# @μσ_methods InverseGamma(shape)
