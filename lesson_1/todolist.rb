# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(new_todo) # add new_todo to end of list, return list; can only add Todo objects
    if new_todo.class != Todo
      raise TypeError, "Can only add Todo objects"
    end
  
    todos << new_todo

    todos
  end
  alias_method :<<, :add

  # def <<(new_todo) # same as add
  #   add(new_todo)
  # end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos
  end

  def done? # => true if all items are done
    todos.all? { |todo| todo.done? }
  end
  
  def item_at(idx) # zero based index
    todos.fetch(idx)
    # check_idx(idx)
    # todos[idx]
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    check_idx(idx)
    item_at(idx).undone!
  end

  def done!
    todos.each { |todo| todo.done! }
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(idx)
    check_idx(idx)
    todos.delete_at(idx)
  end

  def to_s
    "---- #{title} ----\n" +
      todos.map { |todo| "#{todo}"}.join("\n")
  end

  def each
    counter = 0

    while counter < size
      yield(item_at(counter))
      counter += 1
    end

    self
  end

  def select
    new_todo = TodoList.new(title)
  
    todos.each do |todo|
      new_todo << todo if yield(todo)
    end

    new_todo
  end

  def find_by_title(title)
    select { |todo| todo.title == title }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    todo = find_by_title(title)
    todo.done! if !!todo
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end

  private

  attr_reader :todos

  def check_idx(idx)
    raise IndexError if idx >= size
  end

end


# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# p list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# todo1.done!

list.mark_done('Clean room')
p list.all_done
puts ''
list.mark_all_done
p list.all_done
puts ''
list.mark_all_undone
puts ''
p list.all_not_done






# p list.all_done
# p list.all_not_done

# p list.find_by_title("Do Laundry")


# results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results.inspect

# list.each do |todo|
#   puts todo                   # calls Todo#to_s
# end

# <<
# same behavior as add
# p list << todo1
# p list << 1

# ---- Interrogating the list -----

# size
# p list.size                       # returns 3

# # first
# p list.first                      # returns todo1, which is the first item in the list

# # last
# p list.last                       # returns todo3, which is the last item in the list

# #to_a
# p list.to_a                      # returns an array of all items in the list

# #done?
# p list.done?                     # returns true if all todos in the list are done, otherwise false

# # ---- Retrieving an item in the list ----

# item_at
# p list.item_at                    # raises ArgumentError
# p list.item_at(1)                 # returns 2nd item in list (zero based index)
# p list.item_at(100)               # raises IndexError

# # ---- Marking items in the list -----

# mark_done_at
# p list.mark_done_at               # raises ArgumentError
# p list.mark_done_at(1)            # marks the 2nd item as done
# p list
# p list.mark_done_at(100)          # raises IndexError

# mark_undone_at
# p list.mark_undone_at             # raises ArgumentError
# p list.mark_undone_at(1)          # marks the 2nd item as not done
# p list
# p list.mark_undone_at(100)        # raises IndexError

# done!
# p list.done!                      # marks all items as done
# p list

# # ---- Deleting from the list -----

# shift
# p list.shift                      # removes and returns the first item in list

# pop
# p list.pop                        # removes and returns the last item in list

# remove_at
# list.remove_at                  # raises ArgumentError
# list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError

# # ---- Outputting the list -----

# to_s
# puts list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym