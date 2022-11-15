require 'todo_list'
require 'todo'

describe "integration" do
  describe "TodoList's #add(todo)" do
    context "when one instance of Todo added" do
      it "adds todo to list" do
        list = TodoList.new
        todo = Todo.new("Buy groceries")
        expect(list.add(todo)).to eq [todo]
      end
    end

    context "when two instances of Todo added" do
      it "adds both todos to list" do
        list = TodoList.new
        todo_1 = Todo.new("Buy groceries")
        todo_2 = Todo.new("Clean car")
        list.add(todo_1)
        expect(list.add(todo_2)).to eq [todo_1, todo_2]
      end
    end
  end

  describe "TodoList's #incomplete" do
    context "when list consists of one non-done todo" do
      it "returns said one non-done todo" do
        list = TodoList.new
        todo = Todo.new("Buy groceries")
        list.add(todo)
        expect(list.incomplete).to eq [todo]
      end
    end

    context "when list consists of one done todo" do
      it "returns error message" do
        list = TodoList.new
        todo = Todo.new("Buy groceries")
        list.add(todo)
        todo.mark_done!
        expect{ list.incomplete }.to raise_error "No incomplete todos"
      end
    end

    context "when list consists of one non-done and one done todo" do
      it "returns the one non-done todo" do
        list = TodoList.new
        todo_1 = Todo.new("Buy groceries")
        todo_2 = Todo.new("Clean car")
        list.add(todo_1)
        list.add(todo_2)
        todo_1.mark_done!
        expect(list.incomplete).to eq [todo_2]
      end
    end
  end


  describe "TodoList's #complete" do
    context "when list consists of one non-done todo" do
      it "returns error message" do
        list = TodoList.new
        todo = Todo.new("Buy groceries")
        list.add(todo)
        expect{list.complete}.to raise_error "No completed todos"
      end
    end
    
    context "when list consists of one done todo" do
      it "returns said one done todo" do
        list = TodoList.new
        todo = Todo.new("Buy groceries")
        list.add(todo)
        todo.mark_done!
        expect(list.complete).to eq [todo]
      end
    end

    context "when list consists of one done and one non-done todo" do
      it "returns the one done todo" do
        list = TodoList.new
        todo_1 = Todo.new("Buy groceries")
        todo_2 = Todo.new("Clean car")
        list.add(todo_1)
        list.add(todo_2)
        todo_2.mark_done!
        expect(list.complete).to eq [todo_2]
      end
    end
  end


  describe "TodoList's #give_up!" do
    context "when list consists of one non-done todo" do
      it "returns completion message" do
        list = TodoList.new
        todo = Todo.new("Buy groceries")
        list.add(todo)
        expect(list.give_up!).to eq "No more todos!"
      end
    end

    context "when list consists of one done todo" do
      it "returns error message" do
        list = TodoList.new
        todo = Todo.new("Buy groceries")
        list.add(todo)
        todo.mark_done!
        expect{ list.give_up! }.to raise_error "All todos already done!"
      end
    end

    context "when list consists of one done and one non-done todo" do
      it "returns completion message" do
        list = TodoList.new
        todo_1 = Todo.new("Buy groceries")
        todo_2 = Todo.new("Clean car")
        list.add(todo_1)
        list.add(todo_2)
        todo_1.mark_done!
        expect(list.give_up!).to eq "No more todos!"
      end
    end

    context "when list consists of two done todos" do
      it "returns completion message" do
        list = TodoList.new
        todo_1 = Todo.new("Buy groceries")
        todo_2 = Todo.new("Clean car")
        list.add(todo_1)
        list.add(todo_2)
        expect(list.give_up!).to eq "No more todos!"
      end
    end
  end
end