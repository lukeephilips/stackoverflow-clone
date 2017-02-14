require 'rails_helper'
describe Question do  
  it {should belong_to :user}
  it {should validate_presence_of :title}

  it 'is default score 0' do
    question = FactoryGirl.create(:question)
    question.score.should eq 0
  end
end
