class Histogram

  def self.for(word)
    Histogram.new word
  end


  def substract word
    @histogram.each_with_object(Histogram.for(word).histogram) { |(char, count), histogram|
      histogram[char] = (histogram[char] || 0) - count
    }
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