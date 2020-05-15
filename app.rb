require 'pry'

# Initializes with a name, address, number of floors, and number of tenants
# The name and number of tenants should be readable and writeable
# The address should be readable
# The number of floors should not be readable or writeable
# The class should keep track of all buildings that are created
# The class should tell the average number of tenants in a building
# A building should have a placard method that returns the name and address of the building
# A building should have a method returns the average number of tenants per floor

class Building
  attr_accessor :name, :number_of_tenants
  attr_reader :address
  @@all = []

  def initialize name, address, floor_count = 0, number_of_tenants = 0
    @name = name
    @address = address
    @floor_count = floor_count
    @number_of_tenants = number_of_tenants
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tenant_average
    total_tenants = @@all.reduce(0) do |tenant_count, building|
      tenant_count + building.number_of_tenants
    end
    total_tenants / @@all.count
  end

  def placard
    "#{@name} - #{@address}"
  end

  def average_tenants_per_floor
    @number_of_tenants / @floor_count.to_f
  end
end
