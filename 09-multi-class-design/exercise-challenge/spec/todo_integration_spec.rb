require 'todo_list'
require 'todo'

describe "integration" do
  describe "#incomplete and preceding methods" do
    context "with two incomplete tasks" do
      it "returns both incomplete tasks" do
        todo_1 = Todo.new("Buy groceries")
        todo_2 = Todo.new("Clean car")
        todo_list = TodoList.new
        todo_list.add(todo_1)
        todo_list.add(todo_2)
        expect(todo_list.incomplete).to eq [todo_1, todo_2]
      end
    end

    context "with one incomplete and one complete task" do
      it "returns the one incomplete task" do
        todo_1 = Todo.new("Buy groceries")
        todo_2 = Todo.new("Clean car")
        todo_list = TodoList.new
        todo_list.add(todo_1)
        todo_list.add(todo_2)
        todo_list.mark_done!(todo_1)
        expect(todo_list.incomplete).to eq [todo_2]
      end
    end

    context "with two completed tasks only" do
      it "fails" do
        todo_1 = Todo.new("Buy groceries")
        todo_2 = Todo.new("Clean car")
        todo_list = TodoList.new
        todo_list.add(todo_1)
        todo_list.add(todo_2)
        todo_list.mark_done!(todo_1)
        todo_list.mark_done!(todo_2)
        expect{todo_list.incomplete}.to raise_error "No todos to complete!"
      end
    end
  end

  describe "#complete and preceding methods" do
    context "with two completed tasks" do
      it "returns both completed tasks" do
        todo_1 = Todo.new("Buy groceries")
        todo_2 = Todo.new("Clean car")
        todo_list = TodoList.new
        todo_list.add(todo_1)
        todo_list.add(todo_2)
        todo_list.mark_done!(todo_1)
        todo_list.mark_done!(todo_2)
        expect(todo_list.complete).to eq [todo_1, todo_2]
      end
    end

    context "one completed and one incomplete task" do
      it "returns the completed task" do
        todo_1 = Todo.new("Buy groceries")
        todo_2 = Todo.new("Clean car")
        todo_list = TodoList.new
        todo_list.add(todo_1)
        todo_list.add(todo_2)
        todo_list.mark_done!(todo_1)
        expect(todo_list.complete).to eq [todo_1]
      end
    end

    context "two incomplete tasks" do
      it "raises error" do
        todo_1 = Todo.new("Buy groceries")
        todo_2 = Todo.new("Clean car")
        todo_list = TodoList.new
        todo_list.add(todo_1)
        todo_list.add(todo_2)
        expect{todo_list.complete}.to raise_error "No complete todos!"
      end
    end
  end
end
