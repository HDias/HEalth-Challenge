class Cns
  def initialize(value:)
    @value = value.to_s.gsub(/[^\d]/, '')
  end

  def valid?
    return false if @value.length != 15

    return start_with_1_or_2? if %w[1 2].include?(@value[0])
    return start_with_7_8_or_9? if %w[7 8 9].include?(@value[0])

    false
  end

  private

  def start_with_1_or_2?
    pis = @value[0, 11]
    cns_to_array = pis.chars.map(&:to_i)

    sum_result = cns_to_array.each_with_index.reduce(0) do |sum, (element, index)|
      sum += element * (15 - index)
      sum
    end

    rest = sum_result % 11
    verificator_digit = rest.zero? ? 0 : 11 - rest
    result = verificator_digit == 10 ? "#{pis}001#{11 - ((sum_result + 2) % 11)}" : "#{pis}000#{verificator_digit}"

    result == @value
  end

  def start_with_7_8_or_9?
    cns_to_array = @value.chars.map(&:to_i)

    sum_result = cns_to_array.each_with_index.reduce(0) do |sum, (element, index)|
      sum += element * (15 - index)
      sum
    end

    rest = sum_result % 11

    rest.zero?
  end
end
