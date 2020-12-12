{:ok, input} = File.read("input.txt")

lines = input |> String.split("\n", trim: true)

defmodule Passwords do
  def occurrences(lines) do
    Enum.count(lines, fn(line) -> valid_password?(line) end)
  end

  def valid_password?(line) do
    [lower_bound, upper_bound, letter, password] = split_line(line)

    occurrences = letter_occurrences_in_password(password, letter)
    occurrences >= lower_bound && occurrences <= upper_bound
  end

  def split_line(line) do
    [policy, password] = line |> String.split(": ")
    [range, letter] = policy |> String.split(" ")
    [lower_bound, upper_bound] = range |> String.split("-") |> Enum.map(fn(x) -> String.to_integer(x) end)

    [lower_bound, upper_bound, letter, password]
  end

  def letter_occurrences_in_password(password, letter) do
    password |> String.graphemes |> Enum.count(fn(c) -> c == letter end)
  end
end

IO.puts "Answer is #{Passwords.occurrences(lines)}"
