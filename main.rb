require_relative 'linked_lists'

list = LinkedList.new

puts list
list.append(2)
list.append(3)
puts list
list.prepend(1)
puts list
puts "Size is #{list.size}"
puts "Head value is #{list.head}"
puts "Tail value is #{list.tail}"
puts "At index 1 we find value #{list.at(1)}"
list.pop
puts list
puts "Contains 1?: #{list.contains?(1)}"
puts "Contains 3?: #{list.contains?(3)}"
puts "We find value 2 at index #{list.find(2)}"
list.insert_at(0.5, 0)
list.insert_at(1.5, 2)
puts list
list.remove_at(2)
puts list
