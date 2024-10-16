using Printf

length = 531441.0
iterations = 9

function snowflake_perimeter_recursive(length::Float64, iterations::Int)
	if iterations == 0
		return 3 * length
	else
		return snowflake_perimeter_recursive(length, iterations - 1) * (4 / 3)
	end
end

function snowflake_perimeter_iterative(length::Float64, iterations::Int)
	perimeter = 3 * length
	for _ in 1:iterations
		perimeter *= 4 / 3
	end
	return perimeter
end

using Base.Threads

function snowflake_perimeter_parallel(length::Float64, iterations::Int)
	perimeter = 3 * length
	@threads for _ in 1:iterations
		perimeter *= 4 / 3
	end
	return perimeter
end

result = snowflake_perimeter_parallel(length, iterations)
@printf("Recursive: %.2f\n", result)
