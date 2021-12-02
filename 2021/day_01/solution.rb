class SonarSweep
  @measurements = File.readlines('input.txt').map { |measurement| measurement.strip.to_i }

  def self.number_of_measurements_larger_than_previous_measurement
    @measurements.select.with_index do |measurement, index|
      next if index == 0

      measurement > @measurements[index - 1]
    end.count
  end

  def self.number_of_sums_larger_than_previous_sum
    @measurements.select.with_index do |measurement, index|
      next if @measurements[index + 2].nil?

      previous_sum = @measurements[index - 1] + @measurements[index] + @measurements[index + 1]
      current_sum = @measurements[index] + @measurements[index + 1] + @measurements[index + 2]

      current_sum > previous_sum
    end.count
  end
end

puts SonarSweep.number_of_measurements_larger_than_previous_measurement # -> 1466
puts SonarSweep.number_of_sums_larger_than_previous_sum # -> 1491
