class Histogram

  class ::String
    def - string
      Histogram.new(self) - string
    end
  end

  def - word
    @histogram = Histogram.new(word).histogram.each_with_object(@histogram) { |(char, count), histogram|
      histogram[char] = (histogram[char] || 0) - count
    }
    self
  end

  def positive?
    @histogram.values.all? { |count| count >= 0 }
  end

  protected

  attr_reader :histogram

  def initialize word
    @histogram = init(word)
  end

  private

  def init word
    word.
        chars.
        group_by { |char| char }.
        each_with_object({}) { |(char, grouped_chars), histogram| histogram[char] = grouped_chars.count }
  end
end