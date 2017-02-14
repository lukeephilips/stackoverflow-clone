require 'rails_helper'

describe Question do
  it 'is default score 0' do
    question = FactoryGirl.create(:question)
    question.score.should eq 0
  end
end
