class TodoList
  def initialize # creates empty array for todo list
    @todo_list = []
    @completed = []
  end

  def add(task) # adds instance of DiaryEntry to todo list
    @todo_list << task
  end

  def mark_done!(todo) # marks a todo as completed
    @completed << todo
    @todo_list.delete(todo)
  end

  def incomplete # returns all incomplete todos
    raise "No todos have been added yet!" if (@todo_list.empty? && @completed.empty?)
    @todo_list.empty? ? (raise "No todos to complete!") : @todo_list
  end

  def complete # returns all complete todos
    raise "No todos have been added yet!" if (@todo_list.empty? && @completed.empty?)
    @completed.empty? ? (raise "No complete todos!") : @completed
  end
end