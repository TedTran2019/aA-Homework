# Longest fish in O(n^2) time
def sluggish_octopus(fishes)
  fishes.length.times do |y|
    biggest_fish = true
    fishes.length.times do |x|
      if fishes[x].length > fishes[y].length
        biggest_fish = false
        break
      end
    end
    return fishes[y] if biggest_fish == true
  end
end

# Finds longest fish in O(nlogn) time
def dominant_octopus(fishes)
  mergesort(fishes).last
end

def mergesort(array)
  return array if array.length <= 1

  half = array.length / 2
  left = mergesort(array[0...half])
  right = mergesort(array[half..-1])

  merge(left, right)
end

def merge(left, right)
  merged_arr = []
  until left.empty? || right.empty?
    case left.first.length <=> right.first.length
    when 1
      merged_arr << right.shift
    when 0
      merged_arr << left.shift
    when -1
      merged_arr << left.shift
    end
  end
  merged_arr + left + right
end

# Finds longest fish in O(n) time
def clever_octopus(fishes)
  biggest_fish = nil
  largest_size = 0
  fishes.each do |fish|
    size = fish.length
    if size > largest_size
      biggest_fish = fish
      largest_size = size
    end
  end
  biggest_fish
end

fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p sluggish_octopus(fishes) == "fiiiissshhhhhh"
p dominant_octopus(fishes) == "fiiiissshhhhhh"
p clever_octopus(fishes) == "fiiiissshhhhhh"