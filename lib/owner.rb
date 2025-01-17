require 'pry'

class Owner

	@@all = []

	attr_accessor :pets, :name
	attr_reader :species

	def initialize(name)
		@name = name
		@species = "human"
		@pets = {fishes: [], cats: [], dogs: []}
		@@all << self 
	end

	def self.all
		@@all
	end

	def self.count
		@@all.length
	end

	def self.reset_all
		@@all = []
	end

  	def say_species
  		return "I am a human."
  	end

  	def buy_cat(new_pet_name)
  		new_pet_obj = Cat.new(new_pet_name)
  		@pets[:cats] << new_pet_obj
  	end

	def buy_dog(new_pet_name)
  		new_pet_obj = Dog.new(new_pet_name)
  		@pets[:dogs] << new_pet_obj
  	end

  	def buy_fish(new_pet_name)
  		new_pet_obj = Fish.new(new_pet_name)
  		@pets[:fishes] << new_pet_obj
  	end

  	def walk_dogs
  		@pets[:dogs].each {|dog| dog.mood = "happy"}
  	end

  	def play_with_cats
  		@pets[:cats].each {|cat| cat.mood = "happy"}
  	end

  	def feed_fish
  		@pets[:fishes].each {|fish| fish.mood = "happy"}
  	end

  	def sell_pets
  		@pets.values.each do |pets_array|
  			pets_array.each {|pet| pet.mood = "nervous"}
  		end
  		@pets = {fishes: [], cats: [], dogs: []}
  	end

  	def list_pets
  		fish_count = @pets[:fishes].length
  		dog_count = @pets[:dogs].length
  		cat_count = @pets[:cats].length
  		return "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  	end

end