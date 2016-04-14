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
    all_cities = @cities
    n = all_cities.length
    for index in 0...n do
      anchor = if index = 0
        @point_of_origin
      else
        anchor[index-1]
      end
      pos = find_item_with_minimum_distance all_cities, anchor, index, n-1
      if pos != -1
        all_cities[index], all_cities[pos] = all_cities[pos], all_cities[index]
      end
    end
    tsp.cities
  end

  # look at all element in array
  # find item with smallest distance from the ith element
  def find_item_with_minimum_distance array, anchor, left, right
      item_with_minimum_distance = -1
      minimum_distance = -1
      # return -1 if empty array
      # start with left to right to find smallest distance to array[i]
      # loop through to find item/index with smallest array
      array[left..right].each_with_index do | item, index |
          distance = distance(anchor, item)
          if distance < minimum_distance || minimum_distance == -1
              item_with_minimum_distance = index + left
              minimum_distance = distance
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
