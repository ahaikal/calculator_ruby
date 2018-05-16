require 'rails_helper'

RSpec.describe Operator, type: :model do
  let(:subject) { Operator.new }

  describe 'calculate a valid string' do
    it 'should return 919.0' do
      @string = '5*3+1+6/2+9*100'
      value = subject.calculate(@string)
      expect(value).to eq('919.0')
    end

    it 'should return 916.07' do
      @string = '5*3+1+6/85+9*100'
      value = subject.calculate(@string)
      expect(value).to eq('916.07')
    end

    it 'should return -883.93' do
      @string = '5*3+1+6/85-9*100'
      value = subject.calculate(@string)
      expect(value).to eq('-883.93')
    end

    it 'should return -858.96' do
      @string = '5*8+1+3/85-9*100'
      value = subject.calculate(@string)
      expect(value).to eq('-858.96')
    end
  end

  describe 'calculate invalid string' do
    it 'should return invalid string if not number' do
      @string = 'RRRRR'
      value = subject.calculate(@string)
      expect(value).to eq('RRRRR')
    end

    it 'should return invalid string if includes non-number' do
      @string = '5*8+1+3/85-r*100'
      value = subject.calculate(@string)
      expect(value).to eq('5*8+1+3/85-r*100')
    end

    it 'should return invalid string if includes special characters ' do
      @string = '5*8+1+3/85-#*100'
      value = subject.calculate(@string)
      expect(value).to eq('5*8+1+3/85-#*100')
    end
  end
end
