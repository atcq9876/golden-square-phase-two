require 'class_todo'

describe ToDoList do
  describe "#add_to_to" do
    context "when list is empty and passed an empty string" do
      it "fails" do
        to_do_list = ToDoList.new
        expect { to_do_list.add_to_do("") }.to raise_error "Please add a task."
      end
    end

    context "when string is passed to method" do
      it "adds string to to_do_list and returns list" do
        to_do_list = ToDoList.new
        result = to_do_list.add_to_do("Buy groceries")
        expect(result).to eq "'Buy groceries' added to list."
      end
    end

    context "when method called twice and passed text both times" do
      it "returns list containing both tasks after second call" do
        to_do_list = ToDoList.new
        to_do_list.add_to_do("Buy groceries")
        result = to_do_list.add_to_do("Clean car")
        expect(result).to eq "'Clean car' added to list."
      end
    end

    context "when method called twice, first time passed text, second an empty string" do
      it "fails" do
        to_do_list = ToDoList.new
        to_do_list.add_to_do("Buy groceries")
        expect { to_do_list.add_to_do("") }.to raise_error "Please add a task."
      end
    end
  end

  describe "#see_to_dos" do
    context "when list is empty" do
      it "fails" do
        to_do_list = ToDoList.new
        expect { to_do_list.see_to_dos }.to raise_error "List is empty."
      end
    end

    context "when list contains one to do" do
      it "returns list of one to do" do
        to_do_list = ToDoList.new
        to_do_list.add_to_do("Buy groceries")
        expect(to_do_list.see_to_dos).to eq "To do list: Buy groceries."
      end
    end

    context "when list contains two to dos" do
      it "returns list of two to dos" do
        to_do_list = ToDoList.new
        to_do_list.add_to_do("Buy groceries")
        to_do_list.add_to_do("Clean car")
        expect(to_do_list.see_to_dos).to eq "To do list: Buy groceries, Clean car."
      end
    end

    context "when list contains two to dos and one is then completed" do
      it "returns the one remaining to do" do
        to_do_list = ToDoList.new
        to_do_list.add_to_do("Buy groceries")
        to_do_list.add_to_do("Clean car")
        to_do_list.complete_to_do("Buy groceries")
        expect(to_do_list.see_to_dos).to eq "To do list: Clean car."
      end
    end
  end

  describe "#complete_to_do" do
    context "when empty string is passed to method" do
      it "fails" do
        to_do_list = ToDoList.new
        expect { to_do_list.complete_to_do("") }.to raise_error "Please enter a completed task."
      end
    end

    context "when only to do on list is passed to method" do
      it "returns string stating all tasks complete" do
        to_do_list = ToDoList.new
        to_do_list.add_to_do("Buy groceries")
        result = to_do_list.complete_to_do("Buy groceries")
        expect(result).to eq "All tasks have now been completed."
      end
    end

    context "when two list contains two to dos and method is called" do
      it "removes completed task and notifies user" do
        to_do_list = ToDoList.new
        to_do_list.add_to_do("Buy groceries")
        to_do_list.add_to_do("Clean car")
        result = to_do_list.complete_to_do("Clean car")
        expect(result).to eq "'Clean car' completed."
      end
    end
  end
end