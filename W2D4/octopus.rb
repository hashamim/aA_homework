def sluggish_octopus(fish)
    fish.each do |fish1|
        return fish1 if fish.all?{|fish2| fish1 >= fish2}
    end
end

def dominant_octopus(fish)
    fish.sort.last
end

def clever_octopus(fish)
    cur_longest = ""
    fish.each {|cur_fish| cur_longest = cur_fish if cur_fish.length > cur_longest.length}
    cur_longest
end
Tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
Tiles_hash = {
    "up" => 0,
    "right-up" => 1,
     "right" => 2, 
     "right-down" => 3, 
     "down" => 4, 
     "left-down" => 5, 
     "left" => 6,  
     "left-up"  => 7

}
def slow_dancing_octopus(step,tiles_array)
    tiles_array.index(step)
end

def constant_dance(step,tiles_hash)
    tiles_hash[step]
end