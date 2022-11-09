=begin

1. Describe the Problem
Put or write the user story here. Add any clarifying notes you might have.

As a user, so that I can keep track of my tasks
I want to check if a text includes the string #TODO.

2. Design the Method Signature

check_todo(text)

text is a string
returns bool

3. Create Examples as Tests
Make a list of examples of what the method will take and return.

check_todo('') => false done

check_todo('hello') => false done

check_todo('#TODO') => true done 

check_todo('eat #TODO chocolate') => true

4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

=end

def check_todo(text)
  text.include? '#TODO'
end