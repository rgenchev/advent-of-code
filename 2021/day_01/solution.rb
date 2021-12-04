class SonarSweep
  attr_accessor :entries

  def initialize
    @entries = File.readlines('input.txt').map { |entry| entry.strip.to_i }
  end

  def number_of_entries_larger_than_previous_entry
    @entries.select.with_index do |entry, index|
      next if index == 0

      entry > @entries[index - 1]
    end.count
  end

  def number_of_sums_larger_than_previous_sum
    @entries.select.with_index do |entry, index|
      next if @entries[index + 2].nil?

      previous_sum = @entries[index - 1] + @entries[index] + @entries[index + 1]
      current_sum = @entries[index] + @entries[index + 1] + @entries[index + 2]

      current_sum > previous_sum
    end.count
  end
end

puts SonarSweep.new.number_of_entries_larger_than_previous_entry
puts SonarSweep.new.number_of_sums_larger_than_previous_sum
