class User < ApplicationRecord
    has_many :posts
    validates :name, presence: true
    before_create->{self.toke=generate_token}

    private
    def generate_token
        loop do
         pre_token= secureRandom.hex
         return pre_token User.exists? unless({toke:pre_token}) 
        end
    end
    
end
