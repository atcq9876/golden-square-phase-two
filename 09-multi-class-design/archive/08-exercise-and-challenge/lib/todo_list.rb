class TodoList
  def initialize
    @list = []
    @complete = []
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
    raise "Please create a todo before adding it to your list." if todo == nil
    @list << todo
  end

  def incomplete
    # Returns all non-done todos
    update_list
    @list.empty? ? (raise "No incomplete todos") : @list
  end

  def complete
    # Returns all complete todos
    raise "No completed todos" if (@list.empty? && @complete.empty?)
    update_list
    @complete.empty? ? (raise "No completed todos") : @complete
  end

  def give_up!
    # Marks all todos as complete
    raise "No todos to give up on!" if (@list.empty? && @complete.empty?)
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
