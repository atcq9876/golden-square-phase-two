class Todo
  def initialize(task) # task is a string
    @task = task
    @complete = []
  end

  def task
    # Returns the task as a string
  end

  def mark_done!
    # Marks the todo as done
    # Returns nothing
    @complete << @task
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
    @complete.include?(@task)
  end
end
