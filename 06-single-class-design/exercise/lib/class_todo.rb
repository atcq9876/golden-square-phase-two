class ToDoList
  def initialize
    @to_do_list = []
  end

  def add_to_do(task)
    if task == ""
      fail "Please add a task."
    else
      @to_do_list.push(task)
      "'#{task}' added to list."
    end
  end

  def see_to_dos
    if @to_do_list.empty?
      fail "List is empty."
    else
      "To do list: #{@to_do_list.join(', ')}."
    end
  end

  def complete_to_do(task)
    if task == ""
      fail "Please enter a completed task."
    elsif @to_do_list.length == 1
      @to_do_list.shift
      "All tasks have now been completed."
    else
      @to_do_list.delete(task)
      "'#{task}' completed."
    end
  end
end


=begin

Design process:

1. Describe the Problem
Put or write the user story here. Add any clarifying notes you might have.

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.


2. Design the Class Interface
Include the initializer and public methods with all parameters and return values.

class ToDoList
  def initialize
    # create empty array of todos (or could do a hash with numbers as keys?)
  end

  def add_to_do(task) # task is a string
    # raises an error if no task is passed as an argument
    # otherwise, adds task to to do list
    # returns to do list (as a hash with numbered keys? or not?)
      # returns "No to dos added yet." if list is empty
  end

  def see_to_dos
    # returns "List is empty." if no to_dos
    # else, returns list of to_dos

  def complete_to_do(TBC - could be the hash key number / or just name of to do?)
    # raises an error if no task/number is passed as an argument
    # removes completed task from to do list
    # if todos remain, return updated list
    # otherwise return "All tasks have been completed."
  end
end


3. Create Examples as Tests
Make a list of examples of how the class will behave in different situations.

add_to_do method
# 1 done
to_do_list = ToDoList.new
to_do_list.add_to_do("") # => fails "Please add a task."

# 2 done
to_do_list = ToDoList.new
to_do_list.add_to_do("Buy groceries") # => "'Buy groceries' added to list."

# 3 done
to_do_list = ToDoList.new
to_do_list.add_to_do("Buy groceries") # => "'Buy groceries' added to list."
to_do_list.add_to_do("Clean car") # => "'Clean car' added to list."

# 4 done
to_do_list = ToDoList.new
to_do_list.add_to_do("Buy groceries") # => "'Buy groceries' added to list."
to_do_list.add_to_do("") # => fails "Please add a task."


see_to_dos method
# 5 done
fails when no items in list

# 6 done
returns list of one to do if only one task added
"To do list: Buy groceries."

# 7 done
returns list of two to dos if two added
"To do list: Buy groceries, Clean car."

# 8 done: additional test for once complete_to_do tests are finished
completes a to do (removing it from a list of > 1 todos)
returns list of remaining to dos


complete_to_do method
# 9 done
to_do_list = ToDoList.new
to_do_list.complete_to_do("") # => fails "Please enter a completed task."

# 10 done
to_do_list = ToDoList.new
to_do_list.add_to_do("Buy groceries") # => "To do list: Buy groceries"
to_do_list.complete_to_do("Buy groceries") # => "All tasks have now been completed."

# 11 done
to_do_list = ToDoList.new
to_do_list.add_to_do("Buy groceries") # => "To do list: Buy groceries"
to_do_list.add_to_do("Clean car") # => "To do list: Buy groceries, Clean car"
to_do_list.complete_to_do("Clean car") # => "'Clean car' completed."




4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

=end