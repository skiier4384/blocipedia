class User < ActiveRecord::Base
    has_many :wikis, dependent: :destroy
    
    before_save { self.email = email.downcase if email.present? }

    validates :name, length: { minimum: 1, maximum: 100 }, presence: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :password, length: { minimum: 6 }, allow_blank: true
    validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }

end
