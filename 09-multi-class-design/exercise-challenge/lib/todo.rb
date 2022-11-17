class Todo
  def initialize(task) # creates a todo (takes string)
    raise "Please enter a task" if task == "" || (!task.is_a? String)
    @task = task
  end
end