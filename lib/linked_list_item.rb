class LinkedListItem
  include Comparable
  attr_reader :next_list_item
  attr_accessor :payload

  def initialize( payload )
  	@payload = payload
  end

  def next_list_item= (linked_list_item)
  	raise ArgumentError if linked_list_item === self
    @next_list_item = linked_list_item
  end

  def last?
  	@next_list_item.nil?
  end

  def === other_item
    self.object_id == other_item.object_id
  end

  def <=> other
    # Comparators return 1, 0, or -1 to indicate > , ==, or <
    # Precedence: integers, then strings, then symbols (each sorted
    # individually)
    if self.payload.class == other.payload.class
      # I implemented this basic comparison for you.
      return self.payload <=> other.payload
    else
      if self.payload.is_a? Symbol
        1
      elsif self.payload.is_a? Integer 
        -1
      elsif self.payload.is_a? String and other.payload.is_a? Symbol
        -1
      elsif self.payload.is_a? String and other.payload.is_a? Integer
        1
      else
        0
      end
    end
  end

end