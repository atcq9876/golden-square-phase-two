require 'todo_list'

describe "#incomplete" do
  context "with no diary entries" do
    it "raises error" do
      todo_list = TodoList.new
      expect{todo_list.incomplete}.to raise_error "No todos have been added yet!"
    end
  end
end

describe "#complete" do
  context "with no diary entries" do
    it "raises error" do
      todo_list = TodoList.new
      expect{todo_list.complete}.to raise_error "No todos have been added yet!"
    end
  end
end
