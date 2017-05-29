require "pry"
require_relative "cat.rb"
require_relative "dog.rb"
require_relative "fish.rb"

class Owner

  attr_accessor :pets
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {:cats => [], :dogs => [], :fishes => []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = Array.new
  end

  def self.count
    @@all.length
  end

  def name
    @name
  end

  def say_species
    "I'm a human."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end

  def play_with_cats
    @pets[:cats].each{|cat| cat.mood = "happy"}
  end

  def walk_dogs
    @pets[:dogs].each{|dog| dog.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each{|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.each do |spec, pets|
      pets.each do |pet|
        pet.mood = "nervous"
      end
      pets.clear
    end
  end

  def list_pets
    "I have #{pets[:fishes].length} fish, #{pets[:cats].length} cat(s), and #{pets[:dogs].length} dog(s)."
  end

end

owner = Owner.new("Kevin")
puts owner.name
puts owner.buy_cat("Crookshanks")
puts owner.buy_fish("Nemo")
puts owner.buy_dog("Fido")

owner.play_with_cats
puts owner.pets[:cats].first.mood
owner.walk_dogs
puts owner.pets[:dogs].first.mood
owner.feed_fish
puts owner.pets[:fishes].first.mood

puts owner.sell_pets
puts Owner.all
puts Owner.count
