require 'spec_helper'

describe Scorer do

  context 'all answers are wrong' do
    it 'returns 0' do
     scorer = Scorer.new(quiz)
     expect(scorer.total(answer_ids)).to eq(0)
    end
  end

end