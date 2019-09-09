# A rudimentary implementation a map using only arrays.
class Map
  def initialize
    @map = []
  end

  # Recall that no duplicates are allowed when writing set.
  def set(key, value)
    i = @map.find_index { |kv_arr| kv_arr[0] == key }
    i.nil? ? @map << [key, value] : @map[i][1] = value
    value
  end

  def get(key)
    @map.each { |kv_arr| return kv_arr[1] if kv_arr[0] == key }
    nil
  end

  def delete(key)
    value = nil
    @map.each_with_index do |kv_arr, i|
      if kv_arr[0] == key
        value = kv_arr[1]
        @map.delete_at(i)
        break
      end
    end
    value
  end

  def show
    final_idx = @map.length - 1
    @map.each_with_index do |kv_arr, i|
      print '{' if i == 0
      print "#{kv_arr[0]}=>#{kv_arr[1]}"
      print (i == final_idx ? "}\n" : ', ')
    end
  end
end
