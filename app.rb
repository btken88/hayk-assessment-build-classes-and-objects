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
  attr_accessor :name, :tenant_count
  attr_reader :address
  @@all = []

  def initialize name, address, floor_count, tenant_count
    @name = name
    @address = address
    @floor_count = floor_count
    @tenant_count = tenant_count
    @@all << self
  end

  def self.tenant_average
    total_tenants = @@all.reduce(0) { |tenant_count, building| tenant_count + building.tenant_count}
    total_tenants / @@all.length
  end

  def placard
    "#{@name} - #{@address}"
  end

  def tenants_per_floor
    @tenant_count / @floor_count
  end
end
