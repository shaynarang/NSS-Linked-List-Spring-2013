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

  def get_item(n)   
    item = @first_item
    n.times do
      raise IndexError if item == nil       
      item = item.next_list_item
    end
    item
  end

  def get(n)
    get_item(n).payload
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

  # def to_s
  #   return "| |" if @first_item.nil?
  #   storage = "#{@first_item.payload}"      
  #   pointer = @first_item.next_list_item
  #   until pointer.nil?
  #     storage << ", " + pointer.payload
  #     pointer = pointer.next_list_item
  #   end
  #   "| #{storage} |"
  # end

  def to_s
    current_item = @first_item
    payloads = ""
    while current_item
      payloads += " "
      payloads += current_item.payload.to_s
      payloads += "," unless current_item.last?
      current_item = current_item.next_list_item
    end
    "|#{payloads} |"
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

  # ========= Sorting Exercise ========== #

  def sorted?
    current_item = @first_item
    (size-1).times do
      if current_item > current_item.next_list_item
        return false
      else
        current_item = current_item.next_list_item
      end
    end
    true
  end

  def sort
    if @first_item.nil? or @first_item.last?
      return self
    else
      current_item = @first_item
      counter = 0
      (size-1).times do
        if current_item > current_item.next_list_item
          swap_with_next(counter)
          current_item = get_item(counter+1)
          counter += 1
        else
          current_item = get_item(counter+1) 
          counter += 1
        end
      end
      return self if sorted?      
      self.sort
    end
  end

  # This is a helper I implemented
  def swap_with_next i
    raise IndexError if i + 1 >= size
    current_item = get_item(i)
    next_item = get_item(i+1)
    if i - 1 >= 0
      previous_item = get_item(i-1)
      previous_item.next_list_item = next_item
    else
      @first_item = next_item
    end
    current_item.next_list_item = next_item.next_list_item
    next_item.next_list_item = current_item
  end

end
