class User < ApplicationRecord
    has_many :posts
    validates :name, presence: true
    before_create->{self.toke=generate_token}

    private
    def generate_token
        loop do
         pre_token=SecureRandom.hex
         return pre_token unless User.exists?({toke:pre_token}) 
        end
    end
    
end
