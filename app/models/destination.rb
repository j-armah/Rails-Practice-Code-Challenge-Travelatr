class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def avg_age
        self.bloggers.sum {|blogger| blogger.age} / self.bloggers.length.to_f
    end

    def most_liked
        self.posts.order("likes DESC").first   
     end

end
