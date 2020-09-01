class Trip
  
  attr_accessor :listing, :guest
  @@all = []

  def initialize(listing, guest)
    @listing = listing
    @guest = guest
    @@all << self
  end

  def self.all
    @@all
  end


end






class Guest

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end


end







class Listing
  
  attr_accessor :city
  @@all = []

  def initialize(name, city)
    @name = name
    @city = city
    @@all << self
  end
  
  def self.all
    @@all
  end

  def guests
    Guest.all.select {|ints_guest| inst_guest.trip == self}
  end


end
