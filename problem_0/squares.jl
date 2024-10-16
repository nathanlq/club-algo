using Base.Threads
using Printf

length = 531441.0
iterations = 9

function snowflake_perimeter(length::Float64, iterations::Int)
	perimeter = 4 * length
	for i in 1:iterations
		perimeter = 4 * 5^i * (length / (3^i))
	end
	return perimeter
end

result = snowflake_perimeter(length, iterations)
@printf("Parallel: %.2f\n", result)
