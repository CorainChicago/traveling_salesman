require 'minitest/autorun'
class TravelingSalesmanTest < Minitest::Test

  class FirstCheck < Minitest::Test
    def setup
      @cities = [[1, 2], [3, 4], [8, 7], [10, 12], [2, 4]]
      @tsp = TravelingSalesman.new(cities)
      @expected = [[3, 4], [8, 7], [10, 12], [2, 4], [1, 2]]
    end

    def tear_down
    end

    def test_distribution
      assert_equal @tsp.dist.round(2), 32.00
    end

    def test_route
      assert_equal (@tsp.route == @expected || @tsp.route == @expected.reverse), true
    end
  end


  class SecondCheck < Minitest::Test
    def setup
      @cities = [[1,1], [8,4], [10, 11], [4, 5], [3,3], [5,6], [3,2]]
      @tsp = TravelingSalesman.new(cities)
      @answer_route = [[1, 1], [3, 3], [4, 5], [5, 6], [10, 11], [8, 4], [3, 2]]
    end

    def test_distribution
      assert_equal @tsp.dist.round(2), 31.23
    end

    def test_route
      assert_equal (@tsp.route == answer_route || @tsp.route == @answer_route.reverse), true
    end


  end
  
end  