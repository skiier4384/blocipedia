class Wiki < ActiveRecord::Base
   belongs_to :user

   validates :title, length: { minimum: 10 }, presence: true
   validates :body, length: { minimum: 80 }, presence: true
   validates :user, presence: true
   
   default_scope { order('created_at DESC') }
end
