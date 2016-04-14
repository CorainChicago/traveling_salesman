require 'bigdecimal'


class TravelingSalesman

  attr_accessor :cities, :point_of_origin
  def initialize(cities)
    unless cities.is_a? Array 
      raise "Please provide an array"
    end
    @cities = cities 
    @point_of_origin = [0,0]
  end


  def dist
  end


  def selection_sort
    all_cities = @point_of_origin + @cities
    n = all_cities.length
    all_cities.each_with_index do |city, index|
      pos = find_item_with_minimum_distance all_cities, index, n
      if pos != index
        all_cities[index], all_cities[pos] = all_cities[pos], all_cities[index]
      end
    end
  end

  def find_item_with_minimum_distance array, left, right

      item_with_minimum_distance = left
      minimum_distance = 0
      array[left..right].each do | item |
          if minimum_distance == 0
            item_with_minimum_distance = item
            minimum_distance = distance(array[left], item)
            break 
          end
          if distance(array[left], item) < minimum_distance
              item_with_minimum_distance = item
          end
      end
      item_with_minimum_distance
  end

  def distance(item1, item2)
    #do math
    #return the distance between both points
    x1 = BigDecimal.new(item1[0])
    y1 = BigDecimal.new(item1[1])
    x2 = BigDecimal.new(item2[0])
    y2 = BigDecimal.new(item2[1])

    Math.sqrt(((x2-x1)**2) + ((y2-y1)**2))
  end
end
