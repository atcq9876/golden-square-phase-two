class TodoList
  def initialize
    @list = []
    @complete = []
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
    @list << todo
  end

  def incomplete
    # Returns all non-done todos
    update_list
    @list.empty? ? (raise "No incomplete todos") : @list
  end

  def complete
    # Returns all complete todos
    update_list
    @complete.empty? ? (raise "No completed todos") : @complete
  end

  def give_up!
    # Marks all todos as complete
    update_list
    if @list.empty?
      raise "All todos already done!"
    else
      "No more todos!"
    end
  end
end

def update_list
  @list.each do |todo|
    if todo.done? == true
      @complete << todo
      @list.delete(todo)
    end
  end
end

=begin
write a method for updating todo list and complete list:
@list.each do |todo|
  if todo.done? == true
    @complete << todo
    @list.delete(todo)
  end
end
=end