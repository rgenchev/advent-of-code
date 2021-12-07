class BinaryDiagnostic
  attr_accessor :binary_numbers, :gamma_rate, :epsilon_rate

  def initialize
    @binary_numbers = File.readlines('input.txt').map { |binary_number| binary_number.strip }
    @gamma_rate = ""
    @epsilon_rate = ""
  end

  def power_consumption
    bits_on_each_position.each do |binary_number|
      @gamma_rate << most_common_bit(binary_number)
      @epsilon_rate << least_common_bit(binary_number)
    end

    @gamma_rate.to_i(2) * @epsilon_rate.to_i(2)
  end

  private

  def bits_on_each_position
    bits_on_each_position = []

    @binary_numbers.each_with_index do |binary_number, binary_number_index|
      raise ArgumentError, "All binary numbers should have the same length." if binary_number.length != @binary_numbers[binary_number_index - 1].length

      binary_number.chars.each_with_index do |bit, bit_index|
        bits_on_each_position[bit_index] = bit and next if bits_on_each_position[bit_index].nil?

        bits_on_each_position[bit_index] << bit
      end
    end

    bits_on_each_position
  end

  def most_common_bit(binary_number)
    binary_number.count("0") > binary_number.count("1") ? "0" : "1"
  end

  def least_common_bit(binary_number)
    binary_number.count("0") > binary_number.count("1") ? "1" : "0"
  end
end

puts BinaryDiagnostic.new.power_consumption
