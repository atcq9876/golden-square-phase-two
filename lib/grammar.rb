=begin
Exercise two
1. Describe the Problem
As a user, so that I can improve my grammar
I want to verify that a text starts with a capital letter and
ends with a suitable sentence-ending punctuation mark.

2. Design the Method Signature
check_grammar(string) 

- checks if string begins with capital letter and ends
in suitable sentence ending puncutation mark
- return string (This sentence is grammatically correct/ or not)

3. Create Examples as Tests
Make a list of examples of what the method will take and return.

check_grammar('') => false done

check_grammar('Hello') => false 

check_grammar('hello.') => false

check_grammar('hello') => false 

check_grammar('Hello?') => true

check_grammar('Hello.') => true

4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.
=end

# .?!

def check_grammar(string)
  return false if string.empty? 
  string[0].upcase == string[0] and ['!','?','.'].include?(string[-1]) ? true : false
end
