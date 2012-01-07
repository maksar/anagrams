require 'spec_helper'
require 'histogram'

describe Histogram do
  context 'substraction' do
    it 'substracts histograms' do
      ('sample' - 'map').should be_positive
      ('sample' - 'sample').should be_positive
      ('sample' - 'example').should_not be_positive
    end
  end
end