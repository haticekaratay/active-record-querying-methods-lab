require "pry"
class Show < ActiveRecord::Base
    def self.highest_rating
        self.maximum("rating")
    end

    def self.most_popular_show
        #self.where(rating: self.highest_rating) returns an array so grab the first element
        #<ActiveRecord::Relation [#<Show id: 1, name: "Rick and Morty", network: "Adult Swim", day: "Thursday", rating: 10, season: nil>]>
        self.where(rating: self.highest_rating)[0]
    end

    def self.lowest_rating
        self.minimum(:rating) # or self.minimum("rating")
    end

    def self.least_popular_show
        self.where(rating: self.lowest_rating)[0]
    end

    def self.ratings_sum
        self.sum(:rating)
    end

    def self.popular_shows
        self.where("rating > ?" , 5)
    end

    def self.shows_by_alphabetical_order
        self.order(name: :asc)
    end
end