class Todo
  def initialize(task) # task is a string
    @task = task
    @complete = []
  end

  def task
    # Returns the task as a string
    if (!@task.is_a? String) || (@task == "")
      raise "Please enter a valid todo"
    else
      @task
    end
  end

  def mark_done!
    # Marks the todo as done
    # Returns nothing
    raise "This todo has already been completed" if @complete.include?(@task)
    @complete << @task
    "Task marked as done!"
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
    @complete.include?(@task)
  end
end
