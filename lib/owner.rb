class Owner
  attr_reader :species
  attr_accessor :name, :pets, :dog, :cat

  @@all = []
  @@pets = {:dogs => [], :cat => []}

  def initialize(species)
    @species = species
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def pets
    @@pets
  end

  
  def buy_cat(cat)
    @@pets[:cat] << Cat.new(cat)
  end

  def buy_dog(dog)
    @@pets[:dog] << Dog.new(dog)
  end

  def walk_dogs
    @@pets[:dog].each do |dog|
      dog.mood = 'happy'
    end
  end

  def play_with_cats
    @@pets[:cat].each do |cat|
      cat.mood = 'happy'
    end
  end

  

  def list_pets
    "I have #{pets[:dog].length} dog(s), and #{pets[:cat].length} cat(s)."
  end

  def sell_pets
    pets.each do |pet, arr|
      arr.map do |pet|
        pet.mood = 'nervous'
      end
      arr.clear
    end
  end

end

human = Owner.new("human")
human2 = Owner.new("human2")

Owner.all
human.buy_cat("fluffy")
human.buy_cat("whiskers")
human.buy_dog("fido")
human.buy_dog("maestro")

human.list_pets
