{:ok, input} = File.read("input.txt")

report = input |> String.split("\n", trim: true)
               |> Enum.map(fn(x) -> String.to_integer(x) end)
               |> Enum.sort

expected_sum = 2020

defmodule Report do
  def findSolution(report, num_count, sum) do
    Enum.reduce_while(report, nil, fn(x), acc ->
      mult_result = case num_count do
        2 -> Enum.find(report, fn(y) -> x + y == sum end)
        _ -> findSolution(report, num_count - 1, sum - x)
      end

      case mult_result do
        nil -> {:cont, acc}
        _ -> {:halt, x * mult_result}
      end
    end)
  end
end

IO.puts "Answer is #{Report.findSolution(report, 2, expected_sum)}"
IO.puts "Answer is #{Report.findSolution(report, 3, expected_sum)}"
