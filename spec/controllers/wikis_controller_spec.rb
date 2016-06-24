require 'rails_helper'

RSpec.describe WikisController, type: :controller do
    
   let(:my_user) { User.create!(name: "Blocipedia User", email: "user@blocipedia.com", password: "helloworld") }
   let(:my_wiki) { Wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: my_user) }

end
