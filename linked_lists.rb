require_relative 'node'

class LinkedList
  def initialize
    @head = Node.new
  end

  def append(value, node = @head)
    return node.value = value if node.value.nil?

    return node.next_node = Node.new(value) if node.next_node.nil?

    append(value, node.next_node)
  end

  def prepend(value)
    return @head.value = value if @head.value.nil?

    new_node = Node.new(value, @head)
    @head = new_node
  end

  def size(n = 1, node = @head)
    return 0 if node.value.nil?

    return n if node.next_node.nil?

    size(n + 1, node.next_node)
  end

  def head
    @head.value
  end

  def tail(node = @head)
    return node.value if node.next_node.nil?

    tail(node.next_node)
  end

  def at(index, n = 0, node = @head)
    return node.value if index == n

    at(index, n + 1, node.next_node)
  end

  def pop(node = @head)
    return node.next_node = nil if node.next_node.next_node.nil?

    pop(node.next_node)
  end

  def contains?(value, node = @head)
    return true if node.value == value

    return false if node.next_node.nil?

    contains?(value, node.next_node)
  end

  def find(value, n = 0, node = @head)
    return n if node.value == value

    return nil if node.next_node.nil?

    find(value, n + 1, node.next_node)
  end

  def to_s(string = '', node = @head)
    return "#{string}(#{node.value})" if node.next_node.nil?

    to_s(string + "(#{node.value}) -> ", node.next_node)
  end

  def insert_at(value, index, n = 0, node = @head)
    return prepend(value) if index.zero?

    if n + 1 == index
      new_node = Node.new(value, node.next_node)
      node.next_node = new_node
      return
    end

    return if node.next_node.nil?

    insert_at(value, index, n + 1, node.next_node)
  end

  def remove_at(index, n = 0, node = @head)
    return @head = @head.next_node if index.zero?

    return if node.next_node.nil?

    return node.next_node = node.next_node.next_node if n + 1 == index

    remove_at(index, n + 1, node.next_node)
  end
end
