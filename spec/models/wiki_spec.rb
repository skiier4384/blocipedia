require 'rails_helper'

RSpec.describe Wiki, type: :model do
  
  let(:title) { RandomData.random_sentence }
  let(:body)  { RandomData.random_paragraph }
  
  let(:user) { User.create!(name: "Blocipedia User", email: "user@blocipedia.com", password: "helloworld") }
  let(:wiki) { Wiki.create!(title: title, body: body, user: user) }

  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:user) }

  it { is_expected.to validate_length_of(:title).is_at_least(5) }
  it { is_expected.to validate_length_of(:body).is_at_least(20) }
  
   describe "attributes" do
     it "has a title, body, and user attribute" do
       expect(wiki).to have_attributes(title: title, body: body, user: user)
     end
   end
end
