require 'rails_helper'

RSpec.describe Wiki, type: :model do 
   let(:title) { RandomData.random_sentence }
   let(:body) { RandomData.random_paragraph }
   let(:wiki) { Wiki.create!(title: title, body: body, user: user) }
   
   validates :title, length: { minimum: 10 }, presence: true
   validates :body, length: { minimum: 80 }, presence: true
 
   it { is_expected.to belong_to(:user) }
   
   it { is_expected.to validate_presence_of(:title) }
   it { is_expected.to validate_presence_of(:body) }
 
   it { is_expected.to validate_length_of(:title).is_at_least(10) }
   it { is_expected.to validate_length_of(:body).is_at_least(80) }
 
   describe "attributes" do
     it "has title and body attributes" do
       expect(wiki).to have_attributes(title: title, body: body)
     end
   end
end