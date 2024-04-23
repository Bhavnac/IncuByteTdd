class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    # Extract delimiter(s) and number string
    delimiters, number_string = extract_delimiters(numbers)
  end

  private

  def self.extract_delimiters(numbers)
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter_part = parts[0][2..-1]
      number_string = parts[1]
      delimiters = parse_custom_delimiters(delimiter_part)
    else
      delimiters = [',', '\n']
      number_string = numbers
    end
    [delimiters, number_string]
  end
end
