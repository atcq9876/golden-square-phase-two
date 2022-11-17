require 'todo'

describe "#initialize" do
  context "when passed an empty string" do
    it "raises error" do
      expect{todo = Todo.new("")}.to raise_error "Please enter a task"
    end
  end

  context "when passed a non-string value" do
    it "raises error" do
      expect{todo = Todo.new(5)}.to raise_error "Please enter a task"
    end
  end
end
