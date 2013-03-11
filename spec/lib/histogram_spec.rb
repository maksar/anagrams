require_relative '../spec_helper'
require_relative '../../lib/histogram'

describe Histogram do
  context 'substraction' do
    it 'substracts histograms' do
      ('sample' - 'map').positive?.must_equal true
      ('sample' - 'sample').positive?.must_equal true
      ('sample' - 'example').positive?.must_equal false
    end
  end
end