require 'linked_list_item'

class LinkedList
  attr_accessor :first_item

  def initialize (*args)
    args.each do | item |
      add_item(item)
    end
  end

  def add_item(payload)
    new_item = LinkedListItem.new(payload)
    if @first_item.nil?
      @first_item = new_item
    else
      final_item = @first_item
      until final_item.last?
        final_item = final_item.next_list_item
      end
    final_item.next_list_item = new_item
    end    
  end

  def get(n)   
    pointer = @first_item
    n.times do
      raise IndexError if pointer == nil       
      pointer = pointer.next_list_item
    end
    pointer.payload
  end

  def last #(item)
    if @first_item.nil?
      nil
    else
      final_item = @first_item
      until final_item.last?
        final_item = final_item.next_list_item
      end
      final_item.payload
    end
  end

  def size
    item = @first_item
    size = 0
    until item.nil?
      item = item.next_list_item
      size += 1
    end
    size
  end

  def to_s
    return "| |" if @first_item.nil?
    storage = "#{@first_item.payload}"      
    pointer = @first_item.next_list_item
    until pointer.nil?
      storage << ", " + pointer.payload
      pointer = pointer.next_list_item
    end
    "| #{storage} |"
  end
    
  # ========= Bonus ========== #

  def [](payload)
    get(payload)
  end

  def []=(n, payload)
    pointer = @first_item
    raise IndexError if pointer.nil?
    n.times do
      pointer = pointer.next_list_item
    end
    pointer.payload = payload
  end

  def remove(n)
    raise IndexError if @first_item.nil?
    if n == 0
      @first_item = @first_item.next_list_item
    else
      left_item = @first_item
      counter = n-1
      counter.times do 
        left_item = left_item.next_list_item
      end
      center_item = left_item.next_list_item
      right_item = center_item.next_list_item
      left_item.next_list_item = right_item
    end
  end

  # ========= Index exercise ========== #

  def indexOf(arg)
    index = 0
    pointer = @first_item
    while pointer
      if pointer.payload == arg
        return index  
      end
      pointer = pointer.next_list_item
      index += 1
    end
  end

end
