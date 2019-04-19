  class LRUCache
    def initialize(size)
        @store = []
        @size = size
    end

    def count
      # returns number of elements currently in cache
        store.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      store.delete(el)
      store.push(el)
      if store.length > size
        store.shift
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      p store
    end

    private
    # helper methods go here!
    attr_reader :size, :store

  end

  #Access O(n)
  #Insert O(n)
  #Delete O(n)
  #Implement with a hash map as well in order to quickly see if element exists in Array rather
  #than having to iterate over it each time. The value can be the index of the array
  cachemoney = LRUCache.new(4)
  cachemoney.add("yoyoyoyo")
  cachemoney.add(10)
  cachemoney.add(60.0)
  cachemoney.add("swag")
  
  cachemoney.show
  cachemoney.add(11)
  cachemoney.show
