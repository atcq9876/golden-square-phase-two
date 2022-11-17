require 'todo'

describe "#task" do
  context "when task is a non-string value" do
    it "raises error" do
      non_string = Todo.new(5)
      expect{ non_string.task }.to raise_error "Please enter a valid todo"
    end
  end

  context "when task is an empty string" do
    it "raises error" do
      empty = Todo.new("")
      expect{ empty.task }.to raise_error "Please enter a valid todo"
    end
  end

  context "when task is a valid string" do
    it "returns string" do
      string = Todo.new("test")
      expect(string.task).to eq "test"
    end
  end
end

describe "#mark_done!" do
  context "if one undone todo" do
    it "marks todo as complete" do
      todo = Todo.new("Test")
      expect(todo.mark_done!).to eq "Task marked as done!"
    end
  end

  context "if todo already done" do
    it "raises error" do
      todo = Todo.new("Test")
      todo.mark_done!
      expect{todo.mark_done!}.to raise_error "This todo has already been completed"
    end
  end
end

describe "done?" do
  context "one done todo" do
    it "returns true" do
      todo = Todo.new("Test")
      todo.mark_done!
      expect(todo.done?).to eq true
    end
  end

  context "one non-done todo" do
    it "returns false" do
      todo = Todo.new("Test")
      expect(todo.done?).to eq false
    end
  end
end
