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

    

## SMALL EXERCISES

### Easy 1

##### <u>Odd</u>

- Remainder operators return negative results if the number on the left is negative, while modulo always returns a non-negative result if the  number on the right is positive

  - `-5 mod 2 == 1` | `-5 rem 2 == -1`

    

##### <u>digit_list.rb</u>



**<u>how-many.rb</u>**

- 



**<u>digit_list.rb</u>**







| Method                                                       | Description                                                  | Example                                                      |
| :----------------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| str.**chars**  ==> an_array                                  | Returns an array of characters in *str*.  This is a shorthand for `str.each_char.to_a` |                                                              |
| ary.**unshift**(obj, ...) ==> ary                            | Prepends objects to the front of `self`, moving other elements upwards | `a = [ "b", "c", "d" ]` `a.unshift("a")`  `#=> ["a", "b", "c", "d"]` |
| ary.**map** {\|item\| block} ==> new_ary                     | Invokes the given block once for each element of `self`. Creates a new array containing the values returned by the block. | `a = [ "a", "b", "c", "d" ]` `a.collect {|x| x + "!"}`           `#=> ["a!", "b!", "c!", "d!"]` |
| something.map(**&:to_i**)                                    | `something.map { |char| char.to_i }` For example, this would convert each element of `something` to integers. |                                                              |
| ary.**uniq** ==> new_ary ary.**uniq** {\|item\|...} ==> new_ary | Returns a new array by removing duplicate values in `self`. If a block is given, it will use the return value of the block for comparison. | `a = [ "a", "a", "b", "b", "c" ]` `a.uniq   # => ["a", "b", "c"]` |
| Array#**each**                                               | Calls the given block once for each element in `self`, passing that element as a parameter.  Returns the array itself. | `a = [ "a", "b", "c" ] a.each {|x| print x, " -- " }` Produces: a -- b -- c -- |
| ary.count ==> int                                            | Returns the number of elements.                              |                                                              |
| Array#join                                                   | which joins every element in an array using the given argument as the delimiter. | `["hi", "im", "pat"].join(' ') ==> "hi im pat"`              |
| [Enumerable#reduce](https://rubyapi.org/2.7/o/enumerable#method-i-reduce) | Combines all elements of *enum* by applying a binary operation, specified by a block or a symbol that names a method or operator. | `# Sum some numbers (5..10).reduce(:+)                             #=> 45 # Same using a block and inject (5..10).inject { |sum, n| sum + n }            #=> 45` |



#### Each vs. map

[`each`](https://ruby-doc.org/core/Enumerator.html#method-i-each) simply iterates over the given enumerable, running the block for each  value. It discards the return value of the block, and each simply  returns the original object it was called on:

```rb
[1, 2, 3].each do |x|
  x + 1
end  # => [1, 2, 3]
```

This is simply a nicer, more universal way of doing a traditional iterating `for` loop, and `each` is *much* preferred over `for` loops in Ruby

[`map`](https://ruby-doc.org/core/Enumerable.html#method-i-map), however, iterates over each element, using the return value of the  block to populate a new array at each respective index and return that  new array:

```rb
[1, 2, 3].map do |x|
  x + 1
end  # => [2, 3, 4]
```

**So it “maps” each element to a new one using the block given, hence the name “map”.** Note that neither `each` nor `map` themselves modify the original collection. This is a concise,  functional alternative to creating an array and pushing to it in an  iterative loop.



## Lesson 2 Quiz



1. ```ruby
   MyModule
   ```

   This is an example of..

   snake_case looks like this -- `my_variable`. It is created using all lower case letters and separating words with the underscore character.

   - [x] **<u>This is an example of CamelCase. `CamelCase` uses no spaces and capitalizes every word. In Ruby it is used for naming classes and modules.</u>**

     

   --------------

   

2. #### (#)This is a comment

   

   --------

   

3. Skip

   

   --------

   

4. #### There is an error in the code which means that it will always output `"Two"`. Identify the line responsible for the error.

   ```ruby
   a = 2
   b = rand(2)
   a *= b
   
   if a = 2
     puts 'Two'
   else
     puts 'Not Two'
   end
   ```

   - [x] <u>**`<u>if a = 2`**</u>

   **In Ruby, whenever you see a single `=` sign like this it's always variable assignment. Testing for equivalence is done using a double equals sign `==`. Although you can perform variable assignment in a conditional, this is  generally not recommended as it is unclear from your code whether you  are intending to perform assignment or if you intended to test for  equivalence and it is simply a typo.**

   **In this case the intention was to test for equivalence. Since the  assignment being performed in this case is to a an object that will be  evaluated as *truthy*, the `if` branch is always executed.**

   

   ---------

   

5. - [x] Pseudocode is a human-readable, high-level description of a program or  algorithm which helps us formulate a solution at the logical problem  domain level.

   - Pseudo-code allows us to outline a general approach to solving a coding  problem without actually writing any code. It effectively allows us to  load the problem into our brain first in order to be able to dissect it, understand it, and come up with an execution path to solve it. By using pseudocode we can perform this problem solving without having to worry  about the syntax and structure of the solution in code. Once we have  already solved the problem in pseudocode it is then a much simpler step  to translate the solution into code.

   ---------

   

6. Skip

7. Skip

   -----------

   

   

8. #### Given the following piece of pseudocode, which code implementation most closely matches it?

   ```text
   Given a sentence made up of several words, write a method to do the following.
   
   Iterate through the words one by one.
     - save the first word as the starting value.
     - starting with the next word iterate through all the remaining words in the sentence
     - for each iteration, compare the saved value with the current word.
     - if the word is longer or the same length as the saved value:
       - reassign the saved value as the current word
     - move on to the next word
   
   After iterating through the sentence, return the saved value.
   ```

   - [ ] A

   ```ruby
   def longest_word(sentence)
     words = sentence.split
     saved_word = words[0]
   
     words.each do |word|
       if word.length > saved_word.length
         saved_word = word
       end
     end
   
     saved_word
   end
   ```

   - [ ] B

   ```ruby
       def longest_word(sentence)
         words = sentence.split
         saved_word = words.shift
   
         words.each do |word|
           if saved_word.length < word.length
             saved_word = word
           end
         end
   
         saved_word
       end
   ```

   - [x] C

```ruby
    def longest_word(sentence)
      words = sentence.split
      saved_word = words.shift

      words.each do |word|
        if word.length >= saved_word.length
          saved_word = word
        end
      end

      saved_word
    end
```

- [ ] D

```ruby
    def longest_word(sentence)
      words = sentence.split
      saved_word = words[0]

      words.each do |word|
        if word.length >= saved_word.length
          saved_word = word
        end
      end

      saved_word
    end
```

**<u>C. These solutions are all fairly similar and some  only have subtle differences, but solution 'C' most closely matches what is specified in the pseudocode.</u>**

**D**. This solution is again very similar to solution C,  but it <u>begins iteration through the sentence at the first word rather  than the next one</u>. As mentioned in the explanation for solution A, this *shouldn't* affect the outcome but is not strictly what was specified.



----------



9. #### When something is truthy....

   - [x] It evaluates to `true` when used in a conditional.

   - [x] It is not `nil` or `false`.

   - [x] It returns `true` when preceded with a `!!`.

   - [ ] **It is NOT a boolean object**

     

   

10. ####  There is an error in the code below; identify what it is.

    ```ruby
    user_input = gets
    
    loop do
      name = user_input
      break
    end
    
    if user_input
      puts "Hello " + name
    end
    ```

    - [x] <u>**The local variable `name` is initialized within the block, and so is not available in the outer scope.**</u>

    **B**. In Ruby, variable scope is defined by a block, and  variables defined within the inner scope cannot be accessed in outer  scope. In the above code, the `do/ end` following invocation of the `loop` method defines the block and the local variable `name` is initialized within this block. When we then reference the variable  outside of the block in the conditional Ruby does not recognize it since it has not been initialized within this scope.

    

    ----------

    

    

11. #### What specifically do we mean when we refer to a variable's scope?

    - [x] We mean where in a program that variable is available for use.

    **C**. A variable's scope determines where in a program a  variable is available for use, in other words where it can be accessed.  There are a number of things which determine the scope of a variable,  such as the type of variable, where it was initialized and where you are trying to use it (e.g. within a method definition or a block following a method invocation).

    

    --------------

    

    

12. #### Select all of the statements which are true regarding local variable scope in Ruby.

    - [x] <u>**Methods define their own, self-contained, scope.**</u>
      
    - Methods define their own scope that is entirely  outside of the execution flow of a program; unlike blocks, local  variables initialized outside of a method are not accessible within it  unless specifically passed in as an argument to the method.
      
    - [ ] Each branch of an `if/ else` statement defines a separate, inner scope. These branches do not conflict.

    - [ ] Any code delimited by either curly braces `{}` or `do/end` defines a new scope.
      -  Blocks are delimited by either curly braces `{}` or `do/end`; however, code enclosed in this way does not **always** constitute a block. It is considered a block (and thereby creates a new scope for variables) if the `{}` or `do/end` immediately follows a method invocation. For example, following the `while` keyword with `do/end` <u>does not constitute a block</u>:

      ```ruby
      while true do
        a = 5
        break
      end
      
      > a # => 5
      ```

    - [x] <u>**Variables initialized in an outer scope can be accessed in an inner scope defined by a block, but not vice versa.**</u>
      
      - Blocks define a separate scope from the main program which can be thought of as an *inner scope*. Variables initialized in an outer scope can be accessed in an inner  scope; however, variables initialized in an inner scope cannot be  accessed in an outer scope.

    

    ---------

    

    

13. #### Which statement most accurately describes why the last line of the code below outputs `"hi"`?

    ```ruby
    def extend_greeting(greeting)
      greeting + " there"
    end
    
    greeting = "hi"
    extend_greeting(greeting)
    
    puts greeting
    ```

    <u>**Because the `String#+` method does not mutate the caller.**</u>

    

    

    -----------

    

    

14. Skip

    

    -------------------

    

    

15. #### Which of  the following behaviors does Ruby exhibit when passing an object as an  argument to a method call? Select all that apply.

    - [x] <u>**When an object is passed to a method call as an argument, the parameter assigned to it acts as a pointer to the original object.**</u>
      - In Ruby, variables are references to objects and do not contain objects  themselves. When an object is passed in as an argument to a method, the  method parameter is essentially acting as variable referencing that  object.
    - [x] <u>**Re-assigning a variable within a method doesn't affect the object that the variable is pointing to outside of the method.**</u>
      - In Ruby, re-assigning a variable has no effect on the object the  variable is bound to; it merely binds the variable to a different  object.
    - [ ] When an object is passed to a method call as an argument, a copy of the object is created and passed into the method.
      - This is not a behavior that Ruby exhibits. Ruby creates references to  objects when passing them as method arguments, rather than creating  copies of objects. (A copy would contain the same value but point to a different memory address/object)
    - [x] <u>**It is possible for an operation within the method to mutate the original object outside of the method.**</u>
      - In Ruby, if an object passed as a method argument is mutable, and the  operation used within the method is one that mutates the caller, then  the original object can be mutated.

    

    

    --------------------

    

    

    

16. ####  What do we mean when we talk about *variables as pointers* in Ruby? Select all answers that apply.

    - [ ] You can't have more than one variable pointing to the same memory address at the same time.

      - You can have multiple variables all pointing to the same space in memory, e.g.

        ```ruby
        a = "hello world!"
        b = a
        ```

        In this example `b` and `a` are both pointing to the space in memory that the `"hello world!"` string object occupies.

    - [x] <u>**Variables in Ruby act as labels we create to refer to physical space in memory.**</u>

      - Variables are essentially labels that act as pointers to some physical memory address in your computer

    - [ ] Using a method that *mutates the caller* points a variable to a different memory address.

      - Using a method that mutates the caller doesn't change the memory address that the variable is pointing to - this remains the same.
      - **So basically, after mutating the caller, the variable will still point to the same memory address, i.e. the variable will reference the same object before and after the mutation (same object ID). ONLY THE <u>STATE OF THE OBJECT</u> HAS BEEN CHANGED.**

    - [ ] Variables can only act as pointers if we pass them into a method as an argument.

      - Variables can act as pointers anywhere in Ruby code regardless of  whether you are going to pass them to a method; however, variables  initialized outside of a method can then only be accessed within a  method if passed to that method as an argument.

    ----------------------------

    

17. #### Why is the `name` method invoked instead of the local variable `name` on line 8 in the following example?

    ```ruby
    def name
      "George"
    end
    
    name = "Lisa"
    
    def display_name
      puts name
    end
    
    display_name
    ```

    - [ ] A: The `name` method is defined before the local variable `name` is initialized, so the method takes precedence.
      - When determining whether to invoke a method or reference a local  variable (due to both having the same name), Ruby doesn't take the order of definition or initialization into account.

    - [ ] B: Ruby tries to reference the local variable `name` first, but can't access it from within the method, so the `name` method is invoked instead.
      - <u>Ruby never tries to reference the local variable `name` because it's not within the method's scope.</u>

    - [x] C: **<u>Local variables that are initialized outside of a method can't be accessed from within the method definition.</u>**
      - The local variable `name` is initialized outside the `display_name` method definition, which means it's not within the method's scope. <u>Note that even if you pass a variable as an argument to a method, and the  parameter name is the same as the name of the local variable we passed  in as the argument, it will still be a different variable within a  method (just with the same name), but both variables will point to the  same object.</u> **The `name` method can be invoked from within `display_name`, though, because both methods are defined within the same scope**.
        - This is why the name method can be invoked but the local variable "name" cannot be

    - [ ] D: All of the above.

    --------------

    

18.  Do later

    ------------------

    

19. #### In the following example, why does Ruby reference the local variable `name` on line 8 instead of invoking the `name` method?

    ```ruby
    name = "Lisa"
    
    def name
      "George"
    end
    
    loop do
      puts name
      break
    end
    ```

    - [x] **<u>Local variables initialized outside of a block (in the outer scope) can  be accessed from within the block's inner scope. Inside the block, both  the local variable and the method are in scope, but by default Ruby  first references the local variable.</u>**

    - When a local variable is initialized in the outer scope, it can be  referenced from within the block's inner scope, but not vice versa. Even though the local variable and the method have the same name, <u>Ruby gives precedence to the local variable</u>.





# Lesson 3: Practice Problems

## Easy 1



1. "`numbers.uniq` returned a new `Array` object with unique elements, but it did not modify the `numbers` object"

   ```ruby
   numbers = [1, 2, 2, 3]
   numbers.uniq
   
   puts numbers  ==> #prints out  1  2  2  3 
   ```

   

2. `!!<some object>` is used to turn any object into their boolean equivalent. (Try it in irb)

   `!<some object>` is used to turn any object into the opposite of their boolean equivalent, just like the above, but opposite.'





## Lesson 4

##### Collections Basics

- `#fetch` throws an `IndexError` exception if the index is **out of bounds**. This is very helpful for catching indices that are out of bounds, but which method is better to use? `#[]` or `#fetch`? `#[]` occurs most often in Ruby code, but it's actually better to use `#fetch` since it enforces the array boundaries. The key point here is to be careful when `#[]` returns `nil`. 

  - ```ruby
    arr.fetch(2) # => nil
    arr.fetch(3) # => IndexError: index 3 outside of array bounds: -3...3
                 #        from (irb):3:in `fetch'
                 #        from (irb):3
                 #        from /usr/bin/irb:11:in `<main>'
    ```

    

- `Hash` also has a `#fetch` method which can be useful when trying to disambiguate valid hash keys with a `nil` value from invalid hash keys.

  - ```ruby
    hsh = { :a => 1, 'b' => 'two', :c => nil }
    
    hsh['b']       # => "two"
    hsh[:c]        # => nil
    hsh['c']       # => nil
    hsh[:d]        # => nil
    
    hsh.fetch(:c)  # => nil
    hsh.fetch('c') # => KeyError: key not found: "c"
                   #        from (irb):2:in `fetch'
                   #        from (irb):2
                   #        from /usr/bin/irb:11:in `<main>'
    hsh.fetch(:d)  # => KeyError: key not found: :d
                   #        from (irb):3:in `fetch'
                   #        from (irb):3
                   #        from /usr/bin/irb:11:in `<main>'
    ```

    

- Hash has a `#to_a` method, which returns an array.

  - ```ruby
    hsh = { sky: "blue", grass: "green" }
    hsh.to_a # => [[:sky, "blue"], [:grass, "green"]]
    ```



- Just like `Hash` has a `#to_a` method, `Array` has a `#to_h` method

  - ```ruby
    arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]
    arr.to_h # => { :name => "Joe", :age => 10, :favorite_color => "blue" }
    ```

    

- How to Loop over a **Hash**:

  - ```ruby
    number_of_pets = {
      'dogs' => 2,
      'cats' => 4,
      'fish' => 1
    }
    pets = number_of_pets.keys # => ['dogs', 'cats', 'fish']
    counter = 0
    
    loop do
      break if counter == number_of_pets.size
      current_pet = pets[counter]
      current_pet_number = number_of_pets[current_pet]
      puts "I have #{current_pet_number} #{current_pet}!"
      counter += 1
    end
    
    # Result:
    I have 2 dogs!
    I have 4 cats!
    I have 1 fish!
    ```



#### Introduction to PEDAC Process

1. P - Understand the Problem

   - Ask: **Do I need to return the same string object or an entirely new string?**

2. Data Structure / Algorithm

   - ```ruby
     # PROBLEM:
     
     # Given a string, write a method `palindrome_substrings` which returns
     # all the substrings from a given string which are palindromes. Consider
     # palindrome words case sensitive.
     
     # Test cases:
     
     # palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
     # palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
     # palindrome_substrings("palindrome") == []
     # palindrome_substrings("") == []
     ```

     - Write input, output, and rules (explicit requirements, implicit requirements)

     - ```ruby
       # input: string
       # output: string (not the same object) (verify with interviewer)
       # rules:
       	Explicit Requirements
       	- return all substrings that are a palindrome
       	- palindromes are CASE-SENSITIVE (returned substrings should maintain the         case that was in the input)
       	
       	Implicit Requirements
       	- the substrings are returned in an ARRAY
       	- empty strings should be return as an EMPTY ARRAY
       
       # Algorithm
       	- Outer loop: loop through each element of the array
               - Inner loop: loop through each substring starting with the outer l               loop's element
       	- # Algorithm:
       		#  - initialize a result variable to an empty array
       		#  - create an array named substring_arr that contains all of the
       		#    substrings of the input string that are at least 2 characters 				long.
       		#  - loop through the words in the substring_arr array.
       		#  - if the word is a palindrome, append it to the result
       		#    array
       		#  - return the result array
       ```





#### METHODS

- To perform selection, `select` evaluates the **return value of the block**

- When evaluating the block's *return value*, `select` only cares about its *truthiness*. Everything in Ruby is considered "truthy" except for `nil` and `false`.

- For each iteration, `each` sends the value of the current element to the block in the form of an argument. In this block

- Once `each` is done iterating, it *returns the original collection*

- Similar to `select`, `map` also considers the return value of the block. The main difference between these two methods is that `map` uses the return value of the block to perform transformation instead of selection.****

  - The key to remember here is that *`map` always performs transformation based on the return value of the block*.

  - ```ruby
    [1, 2, 3].map do |num|
      num.odd?
      puts num
    end   ===> Returns [nil, nil, nil]
    ```

- | Method   | Action         | Considers the return value of the block? | Returns a new collection from the method? | Length of the returned collection |
  | -------- | -------------- | ---------------------------------------- | ----------------------------------------- | --------------------------------- |
  | `each`   | Iteration      | No                                       | No, it returns the original               | Length of original                |
  | `select` | Selection      | Yes, its truthiness                      | Yes                                       | Length of original or less        |
  | `map`    | Transformation | Yes                                      | Yes                                       | Length of original                |

- 