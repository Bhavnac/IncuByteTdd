class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    # Extract delimiter(s) and number string
    delimiters, number_string = extract_delimiters(numbers)

    # Validate for negative or malformed inputs
    validate_input(number_string)

    # Split numbers and calculate sum
    number_list = split_numbers(number_string, delimiters)
    number_list.sum
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

  def self.parse_custom_delimiters(delimiter_part)
    # Support multiple delimiters of variable length
    if delimiter_part.include?('[')
      delimiter_part.scan(/\[(.*?)\]/).flatten
    else
      [delimiter_part]
    end
  end

  def self.split_numbers(numbers, delimiters)
    delimiter_regex = Regexp.union(delimiters.map { |d| Regexp.escape(d) })
    numbers.split(delimiter_regex).map(&:to_i).tap do |nums|
      negatives = nums.select { |n| n < 0 }
      raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
    end
  end

  def self.validate_input(numbers)
    # Raise error if input is malformed, such as ending with a delimiter
    raise 'Invalid format' if numbers.empty? || numbers[-1] =~ /[,\n]/
  end
end
