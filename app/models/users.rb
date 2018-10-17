class User < ActiveRecord::Base 
    has_many :bottles 
    has_secure_password 
    
    validates :username, presence: true 

    def slug
        self.username.downcase.gsub(" ","-")
      end
    
      def self.find_by_slug(slug)
        User.all.detect do |user|
          if user.slug == slug
            return user
          end
        end
      end


end  