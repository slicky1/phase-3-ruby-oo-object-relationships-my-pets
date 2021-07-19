class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  # Instance Methods

  def say_species
    "I am a human." if species == "human"
  end

  # Class Methods

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    self.all.clear
  end

  # Owner Instance Association Methods

  def cats
    Cat.all.select{|et| et.owner == self}
  end
  
  def dogs
    Dog.all.select{|et| et.owner == self}
  end
  
  def buy_cat(cat_name)
    cat = Cat.new(cat_name,self)
    cat.owner = self
  end

  def buy_dog(dog_name)
    dog = Dog.new(dog_name,self)
    dog.owner = self
  end

  def walk_dogs
    self.dogs.each{|et| et.mood = "happy"}
  end

  def feed_cats
    self.cats.each{|et| et.mood = "happy"}
  end

  def sell_pets
    (self.cats + self.dogs).each do |et| 
      et.mood = "nervous"
      et.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
  end

end