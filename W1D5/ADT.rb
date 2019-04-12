class Stack
    def initialize
        @array = []
    end
    def push(el)
        @array.push(el)
    end
    def pop
        @array.pop
    end
    def peek
        @array[-1]
    end
end

class Queue
    def initialize
        @array = []
    end
    def enqueue(el)
        @array.push(el)
    end
    def dequeue
        @array.shift
    end
    def peek
        @array[0]
    end
end

class Map
    def initialize
        array = []
    end
    def set(key,value)
        key_ind = array.index{|pair| pair[0] == key}
        key_ind ||= array.length
        array[key_ind] = [key,value]
    end
    def get(key)
        key_ind = array.index{|pair| pair[0] == key}
        if key_ind
            array[key_ind][1]
        end
    end
    def delete(key)
        key_ind = array.index{|pair| pair[0] == key}
        if key_ind
            array.delete_at(key_ind)
        end
    end
    def show
        p array
    end
    private
    attr_accessor :array
end