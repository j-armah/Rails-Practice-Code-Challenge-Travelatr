class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :age, numericality: { greater_than_or_equal_to: 0}
    validates :name, uniqueness: true
    validates :bio, length: { minimum: 30}

    def most_liked
       self.posts.order("likes DESC").first   
    end

    def most_written
         
        self.posts.group('destination').order('count_all DESC').limit(1).count.keys[0]
        #Person.group('age').order('count(*)').limit(1).pluck(:age).first
     end
end

