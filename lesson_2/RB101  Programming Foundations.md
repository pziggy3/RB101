# RB101:  Programming Foundations 

##  <u>Lesson 2: Small Programs</u>

<u>A Note on Style</u>

- Parentheses are optional when invoking a method in Ruby 
- Kernel.puts() or Kernel.gets()
  - show that 'puts' and 'gets' are module methods 
  - only done for instructional purposes 

<u>Truthiness</u> 

- A boolean is an object whose only purpose is to convey whether it is 'true' or 'false'

- Short Circuiting: The `&&` and `||` operators exhibit a behavior called *short circuiting* which means it will stop evaluating expressions once it can guarantee the return value

- Ruby considers everything to be 'truthy' other than `false` and `nil`  

  - this includes integers 

  - 0 is truthy in Ruby, unlike in JavaScript 

  - you can use assignment in a conditional or logical operator 

    - ```ruby
      if name = find_name 
          puts "got a name"
      else 
          puts "couldn't find it"
      end 
      ```

    - However, writing like code like this is dangerous - it's better to do it like this 

    - ```ruby
      name = find_name
      
      if name && name.valid?
      	puts "great name!"
      else
          puts "eithr couldn't find name or it's invalid"
      end
      ```

      - `if name` checks that `name` is not `nil` 

    

    Walk-Through: Calculator 

    - If conditions don't create a block, so variables created inside the if condition are visible outside of it 
    - In other words, local variables initialized within an `if` can be accessed outside of the `if` 

    

    Pseudocode 

    - `A ||=B` assigns B to A if A is nil or false

    

    <u>Refactored Calculator</u> 

    - When we write Ruby that's not in a class, we write within an object `main`, which is an instance of `Object`
    - The `Kernel` module is automatically loaded by `Object`, giving us access to all of its methods 

    

    <u>Debugging Techniques</u>

    1. Line By Line - patience
    2. Rubber Duck Debugging - carry a rubber duck, explain the code to the duck line-by-line, to the duck.
    3. Go for a walk - only effective if you first spend time loading the problem into your brain 

    

    Precedence 

    - An operator that has higher precedence than another is said to **bind** more tightly to its operands 
      - In the expression `3 + 5 *7`, the `*` operator binds more tightly to its operands, `5` and `7`, than does the `+` operator. Thus, `+` binds to `3` and the return value of `5 * 7` instead of `3` and `5` 
    - Tap Method
      - Object instance method 
      - passes the calling object into a BLOCK, then returns that object 
      - Used for printing objects inside the block
      - Another use is to debug intermediate objects in method chains 

    

Assignment : Calculator Bonus Features 

- ```ruby
  def integer?(input)
      Integer(input) rescue false
  end 
  ```

  - The trailing rescue is a "code smell" --- don't fall into a habit of suppressing errors this way
  - A **code smell** is any characteristic in the source code of a program that possibly indicates a deeper problem  --- usually not bugs, not technically incorrect and do not prevent the program from functioning --- may indicate weaknesses in design that may slow down development or increase the risk of bugs or failures in the future



### <u>Scope</u>

- A variable's scope determines where in a program a variable is available for use

  - A variable's scope is defined by where the variable is initialized or created

- In Ruby, variable scope is defined by a **block**

  - A  **block** is a piece of code following a method invocation, usually delimited by either curly braces `{}` or `do/end`

    - Be aware that not all `do/end` pairs imply a block, **it has to follow a method invocation**

    - A block is *part of* the method invocation

      

*Variables and Blocks*

​	**Example 1: ** outer scope variables can be accessed by inner scope

- ```ruby
  a = 1
  
  loop do
      puts a
      a = a + 1
      break
  end
  
  puts a
  ```

  - The inner scope can access outer scope variables
  - You can *change* variables from an inner scope and have that change affect the outer scope
    - This means that when we instantiate variables in an inner scope, we have to be very careful that we're not accidentally re-assigning an existing variable in an outer scope 

**Example 2:** inner scope variables cannot be accessed in outer scope

- ```ruby
  loop do # the block following the invocat. of the 'loop' method creates an inner scope
      b = 1
      break
  end
  
  puts b	# => NameError: undefined local variable or method 'b' for main:Object
  ```

  - Here, `main` is the outer scope and does not have a `b` variable.
  - Remember that where a variable is initialized determines its scope.
    - In the above example, `b` is initialized in an inner scope

**Example 3**: peer scope do not conflict

- ```ruby
  2.times do
      a = 'hi'
      puts a 		# 'hi' <= this will be printed out twice due to the loop
  end
  
  loop do
      puts a	   # => NameError: undefined local variable or method 'a' for main: Object
      break
  end
  
  puts a 		   # => NameError: undefined local variable or method 'a' for main: Object
  ```

  - Executing the code `puts a` on lines 7 and 11 throws an error bc the initial `a = 'hi` is scoped within the block of code that follows the `times` method invocation 
  - Peer blocks cannot reference variables initialized in other blocks
    - This means that we could use the same variable name `a` in the block of code that follows the `loop` method invocation -- it's not the same variable as in the first block

**Example 4:** variable shadowing

- ```ruby
  [1, 2, 3].each do |n|
      puts n
  end
  ```

  - The block is the `do...end`, and the block parameter is captured between the `|` symbols 
    - In the above example, the block parameter is `n`, which represents each element as the `each` method iterates through the array

- ```ruby
  n = 10
  
  [1, 2, 3].each do |n|
  	puts n				# => 1 2 3
  end
  ```

  - We have a variable named `n` in the outer scope, and because the inner scope has access to the outer scope, we essentially have two local variables in the inner scope with the same name
    - when this happens, it's called **variable shadowing**
    - **it prevents access to the outer scope local variable**

  - The `puts n` will use the block parameter `n` and disregard the outer scoped local variable

  - ```ruby
    n = 10
    
    1.times do |n|
        n = 11
    end
    
    puts n				# => 10
    ```

    - **variable shadowing also prevents us from making changes to the outer scoped `n`**

    - Avoid variable shadowing by choosing long + descriptive variables names

      

*Variables and Method Definitions*

- While a block (regardless of whether it follows a method invocation) has a scope that "leaks", a **method's** scope is entirely self-contained

- A method definition has no notion of "outer" or "inner" scope 

  - You must explicitly pass in any parameters to a method definition

    

**Example 1:** a method definition can't access local variables in another scope

- ```ruby
  a = 'hi'
  
  def some_method
  	puts a
  end
  
  # invoke some method
  some_method    # => NameError: undefined local variable or method 'a' for main: Object
  ```

**Example 2**: a method definition can access objects passed in 

- ```ruby
  def some_method(a)
      puts a
  end
  
  some_method(5) # => 5
  ```

  - The integer `5` is passed into `some_method` as an argument, assigned to the method parameter, `a`, and thus made available to the method body as a local variable

- **Local variables that are not initialized inside a method definition must be defined as parameters**



*Blocks within Method Definitions

- ```ruby
  def some_method
      a = 1
      5.times do
          puts a 
          b = 2
      end 
      
      puts a 
      puts b
  end 
  
  some_method # => NameError: undefined local variable or method 'b' for main:Object
  ```

  - The rules of scope for a method invocation **with a block** remain in full effect even if we're working inside a method definition
  - In this case, b is initialized in an inner scope and isn't accessible outside that scope, even if it's inside a method



*CONSTANTS*

- the scoping rules for constants is not the same as local variables

- ```ruby
  USERNAME = 'Batman'
  
  def authenticate
      puts "Logging in #{USERNAME}"
  end
  
  authenticate 	# => Logging in Batman
  ```

  - This would produce an error if USERNAME was a local variable, since local variables are not accessible instead method definitions unless they are defined as parameters

- ```ruby
  FAVORITE_COLOR = 'taupe'
  
  1.times do
  	puts "I love #{FAVORITE_COLOR}!"	# I love taupe!
  end
  ```

  - Constants and a method invocation with a block
  - Behaves the same way as local variables, in that a local variables defined in an outer scope are accessible in an inner scope

- ```ruby
  loop do
      MY_TEAM = "Phoenix Suns"
      break
  end
  
  puts MY_TEAM	# => Phoenix Suns
  ```

  - Initializing a constant in an inner scope
  - The constant is accessible **outside** the inner scope, which is very different from local variables
    - Constants are said to have **lexical scope** --- important for OOP



### More Variable Scope

1. Method definition

   - When we define a Ruby method using the `def` keyword

   - ```ruby
     def greeting
     	puts "Hello"
     end
     ```

     

2. Method invocation

   - When we call a method, whether an existing method from the Ruby Core API/core Library/ or a method we created using the `def` keyword

   - ```ruby
     greeting 	#  calling the greeting method outputs "Hello"
     ```

     - Methods can also be called with blocks

     - ```ruby
       [1, 2, 3].each { |num| puts num }
       ```

       

- A block is *part* of the method invocation 

  - In fact, *method invocation* following by curly braces or `do...end` is how you define a block in Ruby

- The block acts as an argument to the method

- When invoking a method with a block, we aren't just limited to executing code within the block --- depending on the method definition, the method can use the *return value* of the block to perform some other action, for example:

  - ```ruby
    a = "hello"
    
    [1, 2, 3].map { |num| a }		# => ["hello", "hello", "hello"]
    ```

    - the `Array#map` method is defined in such a way that it uses the return value of the block to perform transformation on each element in an array
    - In the above example, `#map` **doesn't have direct access to `a`** but it can use the value of `a` to perform transformation on the array, since **the block *can* access `a` and returns it to `map`** 
    - In other words, methods (map) can access local variables (a) through interactions with blocks

*Review*

- Methods definitions *cannot* directly access local variables initializes outside of the method definition, **nor** can local variables initializes outside of the method definition be reassigned from within it
- A block *can* access local variables initialized outside of the block and can reassign those variables 
- Methods can access local variables passed in as arguments, and now we've seen that methods **can access local variables through interaction with blocks**
- **Method definition** - sets a certain scope for any local variables in terms of the parameters that the method definition has, what it does with those parameters, and also how it interaction (if at all) with a block
- **Method invocation** - using the scope set by the method definition 
  - If the method is defined to use a block, then the scope of the block can provide additional flexibility in terms of how the method invocation interacts with its surroundings



*Summary*

- Method invocation followed by `{..}` or `do..end` defines a **block**, the block is ***part of*** the method invocation

- Method definition *sets* a scope for local variables in terms of parameters and interaction with blocks
- Method invocation *uses* the scope set by the method definition



### Pass by Reference vs Pass by Value

- Ruby exhibits a combination of behaviors from both "pass by reference" as well as "pass by value"

- Some people call this *pass by value of the reference* or *call by sharing*

- > when an operation within the method mutates the caller, it will affect the original object

- Which operations mutate the caller?

  - ```ruby
    def add_name(arr, name)
        arr = arr + [name]
    end
    
    names = ['bob', 'kim']
    add_name(names, 'jim')
    puts names.inspect 				# => ["bob", "kim"]
    ```

    - When we use `+` to concatenate two arrays together, it is **returning a new array** and not mutating the original
    - It doesn't change the `names` array

  - ```ruby
    def add_name(arr, name)
        arr = arr << name
    end
    
    names = ['bob', 'kim']
    add_name(names, 'jim')
    puts names.inspect				# => ["bob", "kim", "jim"]
    ```

    - When we use `<<` to append a new value into an array, it is **mutating the original array** and not returning a new array



#### Variables as Pointers

- Variables are <u>pointers to physical space in memory</u>

- Variables = labels we create to refer to some physical memory address

- ```ruby
  a = "hi there"
  b = a
  a = "not here"
  ```

  - ![](/home/patrick/Desktop/variables_pointers1.jpg)
  - `a = "not here"` reassigned the variable `a` to a completely different address in memory -- it's now pointing to an entirely new string 
    - this is what the `=` operator does 
  - It's also important to understand that different memory space can in fact hold the **same value**, but they are still **different places in emory**
  - For example, if the last line in the above code was `a = "not here"`, `a` and `b` would still point to `different` addresses in memory, they they just would have the same value
  
- ```ruby
  a = "hi there"
  b = a
  a << ", Bob"
  ```

  - ![](/home/patrick/Desktop/variables_pointers2.jpg)
  - this resulted in **mutating the caller** and **modifying the existing string**, which is also pointed to by the variable `b`
  - This explains why `b` reflects the changes to `a`, they're both pointing to the same string
  
- > Some operations mutate the address space in memory, but other simply change the variable to point to a different address space

- If you call a method that *mutates the caller,* it will *change the value in that address space*, and any variables also pointing there will be affected

- > Pay attention to whether your variables are pointing to the same object (space in memory), or if they are dealing with copies that occupy different address space in memory

- ```ruby
  a = [1, 2, 3, 4]
  b = a 
  c = a.uniq
  
  a << 5 			# a = [1, 2, 3, 4, 5]  b = [1, 2, 3, 4, 5]  c = [1, 2, 3, 4]
  ```

  - `c` doesn't change because it is a copy of `a` that occupies different address space in memory
  - `b` changes because it is pointing to the same object (space in memory) as `a` -- and the object itself changes 



### Variable References and Mutability of Ruby Object

#### Variables and References

- An object is a bit of data that some sort of state -- sometimes called a value -- and associated behavior.

- They can be assigned to variables, like this:

  - ```ruby
    greeting = 'Hello'
    => "Hello"
    ```

    - This tells Ruby to associate the name `greeting` with the **String object** whose **value** is "Hello"
    - `greeting` is said to **reference** the String object
    - The variable `greeting` is also **bound** to the String object
    - The string object represented by the literal "Hello" is assigned to a variable that has the name `greeting` --- causes the variable `greeting` to **reference** the String object whose value is "Hello"
    - It does so by **storing the object id of the String**

![](/home/patrick/Desktop/greeting-is-reference.png)

- Reassignment doesn't change the object...it binds a new object to the variable



### Mutating and Non-Mutating Methods in Ruby

- Variables don't actually contain values, but instead serve as <u>references to objects</u>



#### Mutating and Non-Mutating Methods

<u>Non-Mutating Methods</u>

- A method is said to be non-mutating with respect to an **argument** or its **calling object** if it doesn't modify it
- Most methods don't mutate either
  - Some mutate their caller but few mutate the arguments
- All methods are non-mutating with respect to **immutable objects** --- a method can't modify an immutable object
  - Thus, any method that operates on <u>numbers</u> and <u>boolean values</u> is guaranteed to be non-mutating with respect to that value

<u>Assignment is Non-Mutating</u>

- Assignment tells to Ruby to bind an object to a variable

  - This means that assignment doesn't change an object - it **connects the variable to a new object**
  - `=` acts like a non-mutating method even if it isn't an actual method

- ```ruby
  def fix(value)
  	value.upcase!
      value.concat('!')
      value
  end
  
  s = 'hello'
  t = fix(s)
  ```

  1. We pass `s` to `fix`; this **binds the** **String** represented represented bsy **"hello"** to `value`
  2. `s` and `value` are now **aliases** for the String
  3. We then call `#upcase!` which converts the String to uppercase --- a new String is not created --- the String that is referenced by both `s` and `value` now contain the value `"HELLO"`
  4. We then call `#concat` on `value`, which also **modifies** `value` instead of creating a new String --- The String now has a value of `"HELLO!"`, and both `s` and `value` **reference** that object
  5. Finally, we **return a reference to the String** and store it in `t`
     - The only time we create a new String is when we assign "hello" to `s`
     - The rest of the time, we work directly with that object, modifying it as needed
     - Thus, both `s` and `t` reference the same String and that String has the value `HELLO!` 

- ```ruby
  def fix(value)
      value = value.upcase
      value.concat('!')
  end
  
  s = 'hello'
  t = fix(s)
  ```

  1. We assign the return value of `value.upcase` back to `value`
  2. Unlike `#upcase!`, `#upcase` **does not modify the String referenced by `value`**; instead, it **creates a new copy of the String referenced by value...**
  3. ...**modifies** the copy, and then **returns a reference to the copy**
  4. We then bind `value` to the returned reference
     - `s` and `t` now reference different objects, and the String referenced by `s` has not been modified
     - After the assignment, `value` references a completely new Sting - the String referenced by `#upcase`'s return value

![](/home/patrick/Desktop/using-assignment.png)

- Assignment always binds the <u>target variable</u> on the **left hand side** of the `=` to the <u>object</u> <u>referenced</u> by the **right hand side**

- Assignment operators like `*= += %=`

  - These all cause the **target** to **reference a *possibly* different object**

    - We say possible because:

    - ```ruby
      >> def fix(value)
      --   value = value.upcase!
      --   value.concat('!')
      -- end
      => :fix
      
      >> s = 'hello'
      => "hello"
      
      >> s.object_id
      => 70363946430440
      
      >> t = fix(s)
      => "HELLO!"
      
      >> s
      => "HELLO!"
      
      >> t
      => "HELLO!"
      
      >> s.object_id
      => 70363946430440
      
      >> t.object_id
      => 70363946430440
      
      ```

      - Although we assigned a reference to `value`, we end up with both `s` and `t` referring to the same object
        - The reason for this: `String#upcase!` returns a **reference to its caller, `value`**
        - The **reference** returned by `String#upcase!` is the **same** (albeit modified) **String that we started with**
        - So the assignment effectively **rebinds `value`** **back to the object it was previously bound to**
        - So nothing is changed by the assignment

  - None of these operations mutate their operands

- ```ruby
  >> s = 'Hello'
  => "Hello"
  
  >> s.object_id
  => 70101471465440
  
  >> s += ' World'
  => "Hello World"
  
  >> s
  => "Hello World"
  
  >> s.object_id
  => 70101474966820
  
  ```

  - We're **not** modifying `s` - we are actually **creating a brand-new String** with a <u>new object id</u>, then binding `s` to that new object

- > Setting methods for class instance variables and indexed assignment are **not** the same as assignment 
  >
  > Setter methods + indexed assignment usually **mutate the calling object**



### Mutating Methods

- A method is said to be mutating with respect to an **argument** or **its caller** if it modifies it
  - Note: "Caller" refers to the function that calls another function (the callee) 
  - Note: "Argument" is a value, or reference to a value, passed to a function

```ruby
>> s = '   hey   '
=> "   hey   "

>> s.object_id
=> 70101479494960

>> s.strip!
=> "hey"

>> s.object_id
=> 70101479494960

```

- The `String#strip!` method (that removes leading + trailing whitespace from a String object) **mutates the original String object**
  - `s` references the **same object both before and after `#strip`** is called (same object IDs)
  - Only the **state of the object** has been changed
- Many methods that mutate their caller use `!`, but not always: the `String#concat` doesn't include a `!`



### Indexed Assignment is Mutating

- ```ruby
  str[3] = 'x'
  array[5] = Person.new
  hash[:age] = 25
  ```

  - `#[]` modifies the original object (String, Array, or Hash), but **doesn't change the binding of each variable**
  - It does not create a new object like regular assignment does

- ```ruby
  >> a = [3, 5, 8]
  => [3, 5, 8]
  
  >> a.object_id
  => 70240541515340
  
  >> a[1].object_id
  => 11
  
  >> a[1] = 9
  => 9
  
  >> a[1].object_id
  => 19
  
  >> a
  => [3, 9, 8]
  
  >> a.object_id
  => 70240541515340
  
  ```

  - The indexed assignment does cause **a new reference to be made**, but it is the **collection element (e.g., (`a[1]`)** that is **bound to the new object** (<u>its object ID changes</u>), NOT the **collection (enclosing object)** itself (<u>the object id doesn't change</u>)

### Concatenation is Mutating

- The `#<<` method used by collections like Arrays and  Hashes, as well as the String class, implements concatenation; this is  very similar to the `+=` operator

  - **However, there is a major difference; `+=` is non-mutating, but `#<<` is mutating. Lets look at an example that uses `String#<<`**

- ```ruby
  >> s = 'Hello'
  => "Hello"
  
  >> s.object_id
  => 70101471465440
  
  >> s << ' World'
  => "Hello World"
  
  >> s
  => "Hello World"
  
  >> s.object_id
  => 70101471465440
  
  ```

  - The `#>>` method is mutating **with respect to its caller (`s`) **, so the <u>object referenced by `s`</u> is modified, NO new objects are created
  - Thus, `s` still references the same object it did prior to the `#<<` call

#### Setters are Mutating

- With *indexed assignment*, the elements of a collection (or the characters of a String) are replaced
- with *setters*, the state of the object is modified, usually by modifying an instance variable.

Setter invocation looks like this:

```ruby
person.name = 'Bill'
person.age = 23
```

- It looks exactly like assignment (which is non-mutating), since these are setter calls, they **mutate the object bound to `person`**



#### Refining the Mental Model

- Immutable objects *seem* to be passed by value, while mutable objects *seem* to be passed by reference

- though, we've shown that **assignment can break the binding between an argument name and the object it references**

  

#### Conclusion

- Methods in Ruby can be mutating or non-mutating with respect to individual arguments, include the caller(???)
  - A method that does not modify its arguments or caller is non-mutating  with respect to those objects
  - a method that does modify some of them is mutating with respect to those modified objects.

- We've also learned that assignment in Ruby acts like a non-mutating method — it doesn’t modify any objects, but does alter the binding for the  target variable





# Object Passing in Ruby - Pass by Reference or Pass by Value



### What is Object Passing?

- When you call a method with some expression as an argument, that expression is evaluated by Ruby and reduced, ultimately, to an object
  - can be an object literal, variable name, or complex expression
- Ruby then makes that object **available inside the method**
- This is called **passing the object to the method**, or *object passing*
- In addition to method arguments, the <u>caller (sometimes called the receiver</u> of a method call --- the <u>object</u> on which the method is called, can be thought of as an **implied argument**
- **Return values** - passed by methods back to the caller (the object on which the method is called)
- Objects
  - literals
  - name objects (variables + constants)
  - complex expressions
- Methods
  - methods
  - blocks
  - procs
  - lambdas
  - operators
- Arguments
  - actual arguments
  - the **caller of the method** (the object on which the method is called)
  - operator operands (**3** + **4**)
  - return values



#### Evaluation Strategies

- Ruby uses **strict evaluation exclusively** - every expression is evaluated and converted to an object before it is passed along to a method
- Two most common strict evaluation strategies: pass by value + pass by reference

#### Pass by Value

- With pass by value, a copy of an object is created, and it is that copy that gets passed around
- Since it is merely a copy, it is impossible to change the original object

#### Pass by Reference

- A *reference* to an object is passed around
- This establishes an <u>alias</u> between the **argument** and the **original object:**
  - Both the argument + the original object refer to the **same location in memory**
  - If you modify the argument's state, you also modify the original object



### It's References all the way Down

- Ruby's **variables** don't contain object, they contain **references to objects**
- Even if we pass a literal to a method Ruby will...
  1.  convert that literal to an object
  2. (internally) create a **reference to the object**



What happens when we pass an immutable object?

```ruby
def print_id number
  puts "In method object id = #{number.object_id}"
end

value = 33
puts "Outside method object id = #{value.object_id}"
print_id value
name = 'johnson'

['kim', 'joe', 'sam'].each do |name|
  # uh-oh, we cannot access the outer scoped "name"!
  puts "#{name} #{name}"
end
// Outside method object id = 67
// In method object id = 67
```

- The object (a number) is immutable, but `number` and `value` reference the same object (as shown by the same object ids)
- <u>This implies that pass by value is **NOT** employed for immutable objects, or else `number` would be a copy of `value` with a different object id</u>
- It appears to be using **pass by reference** when passing immutable AND mutable objects
-  “But, we can’t modify immutable objects! Isn’t that what pass by reference is all about?”
  - Pass by reference isn't limited to mutating methods - it can be used with immutable objects
  - There may be a reference passed, **but the reference isn't a guarantee that the object can be modified**



#### Pass by Reference Value

- Assignment throws in a monkey wrench in the statement that "Ruby is exclusively pass by reference"
  - In a pure pass by reference language, assignment would be a mutating operation, but it **isn't** because...
    - **Ruby variables and constants aren't objects, but are REFERENCES to objects**
    - **Assignment merely changes which object is bound to a particular variable**
  - While we can change which object is bound to a variable inside of a  method, we can’t change the binding of the original arguments. We can  change the objects if the objects are mutable, but the **references  themselves are immutable** as far as the method is concerned.
  - Since pass by value passes <u>copies</u> of arguments into a method, Ruby appears to be <u>making copies of the references</u>, then **passing those copies to the method**
  - The method can use the references to <u>modify the referenced object</u>, but **since the reference itself is a copy, the original reference cannot be changed**
    - *pass by reference value*, *pass by reference of the value*, or *pass by value of the reference*
  - In short, ruby is neither pass by value nor pass by reference, but  instead employs a third strategy that blends the two strategies



### Rock Paper Scissors Assignment

- Cyclomatic Complexity in Rubocop - how many paths a code can flow through in a method -- lots of conditionals, lots of possible paths that our code can take
  - Refactor method to retain the rules but not be as complex - create 2 methods and have the old method employ a new one



### Coding Tips 2

- Should a method return or display?

- **"Side effects"** - A method with side effects is either <u>displaying something to the output</u> or <u>mutating an object</u>

- The below methods have side effects

- ```ruby
  # side effect: displays something to the output
  # returns: nil
  
  def total(num1, num2)
    puts num1 + num2
  end
  
  # side effect: mutates the passed-in array
  # returns: updated array
  
  def append(target_array, value_to_append)
    target_array << value_to_append
  end
  ```

- Method with no side effects:

- ```ruby
  # side effect: none
  # returns: new integer
  
  def total(num1, num2)
    num1 + num2
  end
  ```



> In general, if a method has both side effects and a meaningful return  value, it's a red flag. Try to avoid writing methods that do this, as it will be very difficult to use these methods in the future.



##### Name methods appropriately

- If you have some methods that output values, then preface those methods with `display_` or `print_`.
- a method should do one thing, and be named appropriately. If you can  treat a method as a "black box", then it's a well designed method.
  - You should be able to use a method called `total` and understand that it returns a value
  -  a method called `print_total` returns nil
  - On the other hand, if there's a method called `total!`, then it's a sign that there is some side effect somewhere.

##### Don't mutate the caller during iteration

```ruby
words = %w(scooby doo on channel two)
words.each {|str| str << '!'}
puts words.inspect        # => ["scooby!", "doo!", "on!", "channel!", "two!"]
```

- This is mutating the elements in the array
- We **aren't** mutating the `words` object --- that is, we **aren't adding to or removing elements from `words`**
  - Instead, we're **mutating each element in the `words` array**

```ruby
words = %w(scooby doo on channel two)
words.each {|str| words.delete(str)}
puts words.inspect        # => ["doo", "channel"]
```

- We expect an an empty array or nil, but we get ^that

- This is **mutating the collection while iterating through it**

- > Don't mutate a collection while iterating through it.

  - You can, however, **mutate the individual elements within that collection, just not the collection itself**

##### 

##### Variable Shadowing

- Variable shadowing occurs when you choose a local variable in an inner scope that shares the same name as an outer scope

  - **It prevents you from accessing the outer scope variable from an inner scope**

  - ```ruby
    name = 'johnson'
    
    ['kim', 'joe', 'sam'].each do |name|
      # uh-oh, we cannot access the outer scoped "name"!
      puts "#{name} #{name}"
    end
    ```

    

#### Don't use assignment in a conditional



#### Use underscore for unused parameters

- Suppose you have an array of names, and you want to print out a string  for every name in the array, but you don't care about the actual names. 

- In those situations, use an underscore to signify that we don't care  about this particular parameter.

- ```ruby
  names = ['kim', 'joe', 'sam']
  names.each { |_| puts "got a name!" }
  
  Output:
  got a name!
  got a name!
  got a name!
  => ["kim", "joe", "sam"]
  ```

- if you have an unused parameter when there are multiple parameters:

  - ```ruby
    names.each_with_index do |_, idx|
      puts "#{idx+1}. got a name!"
    end
    
    Output:
    1. got a name!
    2. got a name!
    3. got a name!
    => ["kim", "joe", "sam"]
    ```

    