require 'todo_list'

describe "#add(todo)" do
  context "when no todos" do
    it "raises error" do
      list = TodoList.new
      todo = nil
      expect{ list.add(todo) }.to raise_error "Please create a todo before adding it to your list."
    end
  end
end

describe "#incomplete" do
  context "when no todos" do
    it "raises error" do
      list = TodoList.new
      expect{ list.incomplete }.to raise_error "No incomplete todos"
    end
  end
end

describe "#complete" do
  context "when no todos" do
    it "raises an error" do
      list = TodoList.new
      expect{ list.complete }.to raise_error "No completed todos"
    end
  end
end

describe "#give_up!" do
  context "when no todos" do
    it "raises an error" do
      list = TodoList.new
      expect{ list.give_up! }.to raise_error "No todos to give up on!"
    end
  end
end
