class SignalDevice
  def start(data)
    find_start(data.chars, 4)
  end

  def message(data)
    find_start(data.chars, 14)
  end

  private

  def find_start(chars, string_length)
    chars.each_with_index do |_char, i|
      slice = chars[i..i+string_length-1]
      return i + string_length if slice.length == slice.uniq.length
    end
  end
end
