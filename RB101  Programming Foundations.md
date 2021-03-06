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
  
  - What if the last line was `c = a.uniq!`?
  
    - ```ruby
      a = [1, 2, 3, 3]
      b = a
      c = a.uniq!
      
      p a  # => [1, 2, 3]
      p b  # => [1, 2, 3]
      p c  # => [1, 2, 3]
      ```
  
      



# Variable References and Mutability of Ruby Objects

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

- Let’s assign `greeting` to a new variable:

  ```ruby
  >> whazzup = greeting 
  => "Hello"
  
  >> greeting 
  => "Hello" 
  
  >> whazzup 
  => "Hello" 
  
  >> greeting.object_id 
  => 70101471431160
  
  >> whazzup.object_id 
  => 70101471431160 
  ```
  - Internally, the situation now looks like this:
  
  - IMAGE
  
    -  This demonstrates that both `greeting` and `whazzup` not only reference a String with the same value, but are, in fact, references to the same String; `greeting` and `whazzup` are aliases for each other. 
  
    - We can show this by using one of the two variables to change the object:
  
    - ```ruby
      >> greeting.upcase!
      => "HELLO"
      
      >> greeting
      => "HELLO"
      
      >> whazzup
      => "HELLO"
      
      >> whazzup.concat('!')
      => "HELLO!"
      
      >> greeting
      => "HELLO!"
      
      >> whazzup
      => "HELLO!"
      
      >> greeting.object_id
      => 70101471431160
      
      >> whazzup.object_id
      => 70101471431160
      ```

![](/home/patrick/Desktop/greeting-is-reference.png)

- Reassignment doesn't change the object...it binds a new object to the variable



# Mutating and Non-Mutating Methods in Ruby

- Variables don't actually contain values, but instead serve as <u>references to objects</u>



### Mutating and Non-Mutating Methods

#### <u>Non-Mutating Methods</u>

- A method is said to be non-mutating with respect to an **argument** or its **calling object** if it doesn't modify it
- Most methods don't mutate either
  - Some mutate their caller but few mutate the arguments
- All methods are non-mutating with respect to **immutable objects** --- a method can't modify an immutable object
  - Thus, any method that operates on <u>numbers</u> and <u>boolean values</u> is guaranteed to be non-mutating with respect to that value

#### <u>Assignment is Non-Mutating</u>

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

  1. We pass `s` to `fix`; this **binds the** **String** represented represented by **"hello"** to `value`
  2. `s` and `value` are now **aliases** for the String
  3. We then call `#upcase!` which converts the String to uppercase --- a new String is not created --- the String that is referenced by both `s` and `value` now contain the value `"HELLO"`
  4. We then call `#concat` on `value`, which also **modifies** `value` instead of creating a new String --- The String now has a value of `"HELLO!"`, and both `s` and `value` **reference** that object
  5. Finally, we **return a reference to the String** and store it in `t`
     - The only time we create a new String is when we assign "hello" to `s`
     
     - The rest of the time, we work directly with that object, modifying it as needed
  
     - Thus, both `s` and `t` reference the same String and that String has the value `HELLO!` 
     
       
  
  Let’s modify the original code slightly:
  
- ```ruby
  def fix(value)
      value = value.upcase
      value.concat('!')
  end
  
  s = 'hello'
  t = fix(s)
  ```

  1. We pass `s` to `fix`, which **binds** the String object "hello" to `value`

  2. `s` and `value` are now aliases for String object

  3. We assign the return value of `value.upcase` back to `value`

  4. Unlike `#upcase!`, `#upcase` **does not modify the String referenced by `value`**; instead, it creates a **new copy** of the String referenced by value, **modifies** the copy, and then **returns a reference** to the copy

  5. We then bind `value` to the returned reference
  
- After the assignment, `value` references a completely new Sting - the String referenced by `#upcase`'s return value
  
6. `#concat` is called on `value` which **modifies** `value` 
  
7. A reference to `value` is returned from the method and stored in `t`
  
     

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



#### <u>Mutating Methods</u>

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



#### <u>Indexed Assignment is Mutating</u>

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

  - Here, we can see that we have mutated the Array `a` by assigning a new value to `a[1]`, but have not created a new Array. `a[1] = 9` isn’t assigning anything to `a`; it is assigning `9` to `a[1]`; that is, this assignment changes `a[1]` so that it references the new object `9`.
  
  - The indexed assignment does cause **a new reference to be made**, but it is the **collection element (e.g., (`a[1]`)** that is **bound to the new object** (<u>its object ID changes</u>), NOT the **collection (enclosing object)** itself (<u>the array's object id doesn't change</u>)
  
    

#### <u>Concatenation is Mutating</u>

- The `#<<` method used by collections like Arrays and  Hashes, as well as the String class, implements concatenation; this is  very similar to the `+=` operator

  - **However, there is a major difference; `+=` is non-mutating, but `#<<` is mutating. Lets look at an example that uses `String#<<`**

- ```ruby
  >> s = 'Hello'
  => "Hello"
  
  >> s.object_id
  => 70101471465440
  
  >> s << ' World'
  => "Hello World"
  
  >> sWe can also see that
  => "Hello World"
  
  >> s.object_id
  => 70101471465440
  
  ```

  - The `#>>` method is mutating **with respect to its caller (`s`) **, so the <u>object referenced by `s`</u> is modified, NO new objects are created
  
  - Thus, `s` still references the same object it did prior to the `#<<` call
  
    

#### <u>Setters are Mutating</u>

- With *indexed assignment*, the elements of a collection (or the characters of a String) are replaced
- with *setters*, the state of the object is modified, usually by modifying an instance variable.

Setter invocation looks like this:

```ruby
person.name = 'Bill'
person.age = 23
```

- It looks exactly like assignment (which is non-mutating), since these are setter calls, they **mutate the object bound to `person`**



### Refining the Mental Model

- Immutable objects *seem* to be passed by value, while mutable objects *seem* to be passed by reference

- though, we've shown that **assignment can break the binding between an argument name and the object it references**

  

### Conclusion

- Methods in Ruby can be mutating or non-mutating with respect to individual arguments, including the caller.
  - A method that does not modify its arguments or caller is <u>non-mutating</u>  with respect to those objects
  - a method that does modify some of them is <u>mutating</u> with respect to those modified objects.

- We've also learned that <u>assignment</u> in Ruby acts like a non-mutating method — it doesn’t modify any objects, but does alter the binding for the target variable 





# Object Passing in Ruby - Pass by Reference or Pass by Value



### What is Object Passing?

- When you call a method with some expression as an argument, that expression (object literal, variable name, or complex expression) is evaluated by Ruby and reduced, ultimately, to an **object** 
  - Ruby then makes that object **available inside the method.** This is called **passing the object to the method**, or *object passing*
- In addition to method arguments, the <u>caller (sometimes called the receiver</u> of a method call --- the <u>object</u> on which the method is called, can be thought of as an **implied argument**
- **Return values** - Just as much as arguments are passed to methods, <u>return values are passed by those methods back to the caller</u> (the object on which the method is called)
- Objects can be:
  - literals
  - named objects (variables + constants)
  - complex expressions
- Methods can include:
  - methods
  - blocks
  - procs
  - lambdas
  - operators
- Arguments can include:
  - actual arguments
  - the **caller of the method** (the object on which the method is called) (The caller of `String.gsub!` is `String`)
  - operator operands (**3** + **4**)
  - return values



#### Evaluation Strategies

- Every computer programming language uses some sort of *evaluation strategy* when passing objects.
  - This strategy determines <u>when expressions are evaluated</u>, and <u>what a method can do with the resulting objects.</u>

- Ruby uses <u>**STRICT EVALUATION exclusively**</u> - every expression is <u>evaluated</u> and <u>converted to an object</u> **before** it is <u>passed along to a method</u>
- Two most common strict evaluation strategies: 
  - pass by value
  - pass by reference

#### Pass by Value

- With pass by value, a copy of an object is created, and it is that copy that gets passed around
- Since it is merely a copy, it is impossible to change the original object

#### Pass by Reference

- A *reference* to an object is passed around
- This establishes an <u>alias</u> between the **argument** and the **original object:**
  - Both the argument + the original object refer to the **same location in memory**
  - If you modify the argument's state, you also modify the original object



### It's References all the way Down

- Ruby's **variables** don't contain objects, they contain **references to objects**
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
  - It appears to be using **pass by reference** when passing **immutable AND mutable objects**
-  “But, we can’t modify immutable objects! Isn’t that what pass by reference is all about?”
  - Pass by reference isn't limited to mutating methods - it can be used with immutable objects
  - There may be a reference passed, **but the reference isn't a guarantee that the object can be modified**



#### Pass by Reference Value

- Assignment throws in a monkey wrench in the statement that "Ruby is exclusively pass by reference"
  - In a pure pass by reference language, assignment would be a mutating operation, but it **isn't** because...
    - Ruby variables and constants aren't objects, but are **REFERENCES to objects**. Assignment merely changes which object is bound to a particular variable
    - This matters because variables were objects themselves, then assignment would change the state of the object, or mutate the object.
- While we can change which object is bound to a variable inside of a  method, *we can’t change the binding of the original arguments.* 
- We can  change the objects if the objects are mutable, but the *(original) references themselves are immutable* as far as the method is concerned.
  - Since pass by value passes copies of arguments into a method, Ruby appears to be <u>making copies of the references</u>, then **passing those copies to the method**
  - The method can use the **copied references** to <u>modify the referenced object</u>, but **since the reference itself is a copy, the original reference cannot be changed**
    - this is called *pass by reference value*, *pass by reference of the value*, or *pass by value of the reference*
  - In short, ruby is neither pass by value nor pass by reference, but instead employs a third strategy that blends the two strategies



<u>Examples</u>

- ```ruby
  def print_id number
    puts "In method object id = #{number.object_id}"
  end
  
  value = 33
  puts "Outside method object id = #{value.object_id}"
  print_id value
  
  # Outside method object id = 67
  # In method object id = 67
  ```

  - If Ruby was pass by value, then a copy of `value` with a different object id would be output by the method. 

  - **This proves that even with immutable objects like Integers, Ruby isn't pass by value.**

  - So what's happening?

    1. A reference (pointer to the same object) to `value` is made.
    2. Then, a **copy** of this reference is made a passed to the method.
    3. While this copy of the reference CAN modify the state of (or mutate) the referenced object `33`,  the **original** reference **cannot** be changed.
    4. Because a **copy of the original reference** is passed to the method, RATHER THAN A COPY OF THE ARGUMENT ITSELF, the object id stays the same.

    

- ```ruby
  def plus(x, y)
    x = x + y
  end
  
  a = 3
  b = plus(a, 2)
  puts a # 3
  puts b # 5
  ```

  1.  Internally, references (pointers to the same object) of  `a` and `2` are made
  2. **Copies of these references** (which also point to the same objects) are **passed to the method.** 
     - this binds the integers represented by `3` to `2` and `x` to `y` (they're aliases)
  3. We assign the return value of `x + y` back to `x`, which causes `x` (the copy of the original reference) to be bound to a **new** object (point to a **new** object)
  4. While the original references internally created in 1. cannot be changed, a copy of the reference is able to mutate the referenced object. In this case though, the referenced object is NOT mutated because the assignment in the method makes binds the **copy of the original reference** to a new variable.
     - This has no effect on the **original reference.**
  5. `x` (the copy of the original reference) is returned from the method, and then stored in `b`
  6. **Note**: at the end of the method, the original reference still points to the same (unchanged) object. Thus the value of `a` stays the same.

  

- ```ruby
  def uppercase(value)
    value.upcase!
  end
  
  name = 'William'
  uppercase(name)
  puts name               # WILLIAM
  ```

  1.  Internally, a reference to `name` is created.

  2. A **copy** of that reference, represented by `value`,  is passed to the method.

     - this binds the string represented by "william" to `value`. 

  3.  `value` (the copied referenced) is used by `#upcase!` (which mutates its caller) to mutate the referenced object.

  4. The method returns the modified (mutated) object.

     - While nothing was done to the original reference created in 1, it and the local variable `name` (and the copy of the original reference within the method) all point to the mutated object

  5. The `puts` method is invoked with the return value of `uppercase` (WILLIAM) as an argument, causing WILLIAM to be output, and returning `nil`

     

  

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





# <u>Lesson 4</u>




## Collections Basics

#### <u>Out of Bounds Indices</u>

- We know that strings and arrays are indexed collections and that we  can reference individual elements within the collection via their index.

- ```ruby
  str = 'abcde'
  arr = ['a', 'b', 'c', 'd', 'e']
  
  str[2] # => "c"
  arr[2] # => "c"
  ```

- What if we try to reference using an index greater than `4`?

  - ```ruby
    str[5] # => nil
    arr[5] # => nil
    ```

    - Referencing an out-of-bounds index in this way returns `nil`. 
    - This is not necessarily a problem for a string, since we know that `nil` is an invalid return value; with an array, <u>`nil` could be a valid return value</u> since arrays can contain any other type of object, including `nil`.
    - **<u>How can we tell the difference between the valid return and the out-of-bounds reference?</u>**


#### <u>Fetch</u>

- <u>Array has a method called `#fetch`</u> which, according to the [Ruby docs](https://ruby-doc.org/core/Array.html#method-i-fetch):

  > Tries to return the element at position index, but throws an  IndexError exception if the referenced index lies outside of the array  bounds.

- `#fetch` throws an `IndexError` exception if the index is **out of bounds**. This is very helpful for catching indices that are out of bounds, but which method is better to use? `#[]` or `#fetch`? 

- `#[]` occurs most often in Ruby code, but it's **<u>actually better to use `#fetch` since it enforces the array boundaries.</u>** 

  - The key point here is to be careful when `#[]` returns `nil`. 

    ```ruby
    arr.fetch(2) # => nil
    arr.fetch(3) # => IndexError: index 3 outside of array bounds: -3...3
                 #        from (irb):3:in `fetch'
                 #        from (irb):3
                 #        from /usr/bin/irb:11:in `<main>'
    ```




#### **<u>Negative indices</u>**

- What if we use an index less than `0`?

  ```ruby
  str = 'ghijk'
  arr = ['g', 'h', 'i', 'j', 'k']
  
  str[-6]
  arr[-6]
  
  # => nil
  # => nil
  ```

  - These negative indices are also out of bounds.

  - We can confirm this by invoking `#fetch`.

    ```ruby
    arr.fetch(-6) # => IndexError: index -6 outside of array bounds: -5...5
                  #        from (irb):2:in `fetch'
                  #        from (irb):2
                  #        from /usr/bin/irb:11:in `<main>'
    ```

    

#### <u>Invalid Hash Keys</u>

- <u>`Hash` also has a `#fetch` method</u> which can be useful when trying to disambiguate valid hash keys with a `nil` value from invalid hash keys.

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

  - In the above example both the string `'c'` and the symbol `:d` are invalid keys; the string `'b'` and the symbol `:c` are valid keys

#### **<u>Conversion</u>**

- Hash has a `#to_a` method, which returns an array.

  - ```ruby
    hsh = { sky: "blue", grass: "green" }
    hsh.to_a # => [[:sky, "blue"], [:grass, "green"]]
    ```
    
  - Each sub-array is equivalent to a key-value pair from the initial hash.

- Just like `Hash` has a `#to_a` method, `Array` has a `#to_h` method

  - ```ruby
    arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]
    arr.to_h # => { :name => "Joe", :age => 10, :favorite_color => "blue" }
    ```


#### <u>Element Assignment</u>

- String Element Assignment

  ```ruby
  str = "joe's favorite color is blue"
  str[0] = 'J'
  str # => "Joe's favorite color is blue"
  ```

- Array Element Assignment

  ```ruby
  arr = [1, 2, 3, 4, 5]
  arr[0] += 1 # => 2
  arr         # => [2, 2, 3, 4, 5]
  ```

  - The statement `arr[0] += 1` in this example is shorthand for `arr[0] = arr[0] + 1`.
  - This combines **array element reference** and **array element assignment** and is another example of Ruby's *syntactical sugar*.

- Hash Element Assignment

  ```ruby
  hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
  hsh[:apple] = 'Fruit'
  hsh # => { :apple => "Fruit", :carrot => "Produce", :pear => "Produce", :broccoli => "Produce" }
  ```

  - The hash key is used instead of assigning a value using an index



## Looping

- In Ruby, a simple loop is created by calling the `Kernel#loop` method and <u>passing a block to it.</u>

  - Any code within the block will be executed each time the loop performs an iteration

  - Because the `loop` method is in the `Kernel` module, it's available everywhere, just like `puts` and `gets`.

    ```ruby
    loop do
      puts 'Hello!'
      break
    end
    ```

  

  #### <u>**Next**</u>

  Besides `break`, Ruby also provides the `next` keyword to help us control loops. When `next` is executed, it tells the loop to skip the rest of the current iteration and begin the next one.

  ```ruby
  counter = 0
  
  loop do
    counter += 1
    next if counter.odd?
    puts counter
    break if counter > 5
  end
  
  2
  4
  6
  => nil
  ```

  

  #### **<u>How to iterate over a Hash:</u>**

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

- Summary: Looping comprises four basic elements: a <u>loop</u>, a <u>counter</u>, a <u>way to retrieve the current value</u>, and a <u>way to exit the loop</u>




--------------------------------------------------------------------------------------------------------------------------------------

### Introduction to PEDAC Process

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



<<<<<<< HEAD
## Selection and Transformation

- <u>Selection</u> is picking certain elements out of the collection depending on some criterion 
- <u>Transformation</u> refers to manipulating every element in the collection
- Selection and transformation both utilize the basics of looping: a loop, a counter, a way to retrieve the current value, and a way to exit the  loop. I
  - In addition, selection and  transformation require *some criteria*; 
  - selection uses this  criteria to determine which elements are selected
  - transformation  uses this criteria to determine how to perform the transformation.

##### Looping to Select and Transform 

- Selecting all `g` characters out of a string

  ```ruby
  alphabet = 'abcdefghijklmnopqrstuvwxyz'
  selected_chars = ''
  counter = 0
  
  loop do
      current_char = alphabet[counter]
      
      if current_char == 'g'
          selected_chars << current_char # appends current_char into 
      end
      
      counter += 1
      break if counter == alphabet.size 
  end
  
  selected_chars # => "g"
  ```

  - The `if` condition is what determines which values are selected and which ones are ignored; this is the *selection criteria*. 

  ```ruby
  # Transformation
  fruits = ['apple', 'banana', 'pear']
  transformed_elements = []
  counter = 0
  
  loop do
      current_element = fruits[counter]
      
      transformed_elements << current_element + 's'	# appends transformation
      
      counter += 1
      break if counter == fruits.size
  end
  
  transformed_elements # => ["apple", "bananas", "pears"]
  ```

  - Since we're applying the transformation to every element in the array, we don't need an `if` condition, but the entire line is the *transformation criteria*.
  - **When performing transformation, it's always important to pay  attention to whether the original collection was mutated or if a new  collection was returned.**

- <u>Selection with Hashes</u> - Now we want select the key-value pairs where the value is `Fruit` 

  ```ruby
  produce = {
  	'apple' => 'Fruit',
      'carrot' => 'Vegetable',
      'pear' => 'Fruit',
      'broccoli' => 'Vegetable'
  }
  
  def select_fruit(produce_list)
      items = produce.keys
      fruit_hash = {}
      counter = 0
  
      loop do
        break if counter == items.size
        current_item = items[counter]
  
        if produce[current_item] == 'Fruit'
          fruit_hash[current_item] = 'Fruit'
        end
  
        counter += 1
      end
      
      fruit_hash
  end
  
  select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
  ```

  - Notice that the original argument `produce_list` is not mutated
  - a new hash is returned by the method (as opposed to an array or string)

- <u>Implementing a method called `double_numbers!` that **mutates its argument**</u>

  ```ruby
  def double_numbers!(number_array)
      counter = 0
      loop do
          break if counter == number_array.size
          
          current_element = number_array[counter]
          number_array[counter] = current_element * 2 
          
          counter += 1
      end
      
      number_array
  end
  ```

  - You can check if the method mutated its argument by checking the .object_id of the original array and the result of the method (the mutated array)
  - **<u>Rather than returning a new array, this method returns a reference to the (mutated) original array</u>**

- <u>Try coding a solution that doubles the numbers that have odd indices</u>

  ```ruby
  def double_odd_indices(numbers_array)
      doubled_array = []
      counter = 0
      
      loop do
          break if counter == numbers_array.size
          
          current_element = numbers_array[counter]
          current_element *= 2 if counter.odd?
          doubled_array << current_element
          
          counter += 1
      end
      
      doubled_array
  end
  ```

#### More Flexible Methods

- Let's update our `double_numbers` method to not only be able  to double the values in an array, but to multiply by any number. For  example, let's create a method called `multiply` that can take an additional argument to determine the *transformation criteria*.

  ```ruby
  def multiply(number_array, multiplier)
      multiplied_numbers = []
      counter = 0
      
      loop do
          break if number_array.size == counter
          
          multiplied_numbers << number_array[counter] *= multiplier        
          counter += 1 
      end
      
      multiplied_numbers
  end
  ```

- Common mistake - Trying to chain methods on empty collections or `nil` is dangerous and results in a lot of broken programs



## <u>METHODS</u>

--------------------------------------------------------------------------------------------------------------------------------------

#### `each`

- The `each` method is functionally equivalent to using `loop` and represents a simpler way of accomplishing the same task. 

- ```ruby
  [1, 2, 3].each do |num|
    puts num
  end
  ```

  - `each` is a method that's being called on the array. The method **takes a block**, which is the `do...end` part
  - The code within the block is executed for each iteration
  - In this case the code within the block is `puts num` which means each element in the array will be output by the `puts` method
  - #### **How does the block know what `num` is?** 
    
    - For each iteration, `each` sends the value of the current element to the block in the form of an argument.
  -  In this block, the argument to the block is `num` and it represents the value of the current element in the array.
  
- Hashes, however, need two arguments in order to represent both the key and the value per iteration. Calling `each` on a hash looks a little different, since the block has two arguments:

- ```ruby
  hash = { a: 1, b: 2, c: 3 }
  
  hash.each do |key, value|
    puts "The key is #{key} and the value is #{value}"
  end
  ```

- Once `each` is done iterating, it **<u>*returns the original collection*</u>**

#### `select`

- ```ruby
  [1, 2, 3].select do |num|
    num.odd?
  end
  ```
- To perform selection, `select` evaluates the **return value of the block**

  - The block returns a value on each iteration, which then gets evaluated by `select`. 

- When evaluating the block's *return value*, `select` only cares about its *truthiness*. Everything in Ruby is considered "truthy" except for `nil` and `false`.

- ```ruby
  [1, 2, 3].select do |num|
    num + 1
  end
  ```

  - For instance, the return value of the block in the above example will always be a "truthy" value. 

- The next follow up question is, what will the return value of `select` be?

  -  `select` performs selection based on the truthiness of the block's return value.
  - If the block's return value is always "truthy", then all of the elements will be selected
  - **When an element is selected, it's placed in a *new collection*.** 
    - In the above example, once `select` is done iterating, it *returns a new collection* containing all of the selected elements, because the **<u>selection criteria</u>** -- the **<u>block's return value</u>** -- is **<u>truthy</u>** for every element in the  array.

- When working with `select`, it's important to always be aware of the *return value* of the block. 

  - For example, if we place the statement `puts num` on the last line within the block, how will that affect the return value of `select`?

  - ```ruby
    [1, 2, 3].select do |num|
      num + 1
      puts num
    end
    
    1
    2
    3
    # => []
    ```

    - `select` will now **<u>return an empty array</u>**. Why is that? 
    - Since `puts num` is now the last evaluated expression in the block, it is the return  value of this expression which determines the return value of the block. 

#### `map`

- Similar to `select`, <u>`map` also considers the return value of the block</u>. The main difference between these two methods is that `map` uses the **return value of the block** to perform **transformation** instead of selection.****

- ```ruby
  [1, 2, 3].map do |num|
    num * 2
  end
  
  # => [2, 4, 6]
  ```

  - In this example, the return value of the block is the product of `num` and `2`
  - `map` then takes this value and places it in a **new collection**. 
  - This process is repeated for each element in the original collection. 

- What happens if we write some code in the block that's not a transformation instruction?

- ```ruby
  [1, 2, 3].map do |num|
    num.odd?
  end
  ```

  - The key to remember here is that **<u><u>*`map` always performs transformation based on the return value of the block*.**</u>
  - In this case, the <u>return value of the block</u> will be a <u>boolean</u>.
    - This means that the collection returned by `map` will be an <u>array of booleans</u> `[true, false, true]`

- What will the return value of `map` be in the following example?

- ```ruby
  [1, 2, 3].map do |num|
    num.odd?
    puts num
  end 		
  ```

  - By looking at the last expression within the block, we know that the return value of the block will always be `nil`.
  -  `map` doesn't care about truthiness, and takes this return value as the transformation criteria.
    - Therefore, the collection returned by `map` is a **new array of `nil`s.** **<u>`[nil, nil, nil]`</u>**

- What if the only statement within the block is a string? What will the return value of `map` be?

- ```ruby
  [1, 2, 3].map do |num|
    'hi'
  end
  ```

  - Since `'hi'` is the only statement within the block, the **return value of the block is `'hi'`,** which `map` will use as the transformation criteria. 
    - Therefore, the above code will return an array where each element is `'hi'`. **<u>`["hi", "hi", "hi"]`</u>**

#### Enumerable (side note)

- `Array` and `Hash` both have an `each` method which is specific to them and defines how the items in those collections are iterated over.
- The `select` and `map` (and other) methods are actually defined in a module called **Enumerable** and are made available to the `Array` and `Hash` classes.
- The important thing to understand at this stage is that **certain collection types have access to specific methods for a reason**. 
  - For example `String` doesn't use the `Enumerable` module and so you cannot call `select` or `map` on a string 
    - (as we have already seen however we can easily convert a string to an array by calling `String#split` if we want access to the Enumerable methods of `Array`).

### <u>Summary</u>

- | Method   | Action         | Considers the return value of the block? | Returns a new collection from the method? | Length of the returned collection |
  | -------- | -------------- | ---------------------------------------- | ----------------------------------------- | --------------------------------- |
  | `each`   | Iteration      | No                                       | No, it returns the original               | Length of original                |
  | `select` | Selection      | Yes, its truthiness                      | Yes                                       | Length of original or less        |
  | `map`    | Transformation | Yes                                      | Yes                                       | Length of original                |

- Important to note: **`each` always returns the original collection** 

  - In the case of `each`, the return value of the block is simply ignored.

--------------------------------------------------------------------------------------------------------------------------------------



## MORE METHODS

#### Enumerable#any?

- ```ruby
  [1, 2, 3].any? do |num|
      num > 2
  end
  # => true
  ```

  - There are two return values that we need to be aware of here:
    1. the <u>return value</u> of the **method** 
    2. the <u>return value</u> of the **block**. 
  - `any?` looks at the <u>*truthiness* of the **block's** return value</u> in order to determine what the <u>**method's** return value</u> will be.
  - If the **block returns a "truthy" value** for any element in the collection, then the **method will return `true`.**

- `any?` can also be used with a hash. The only difference is that the block requires two parameters in order to access the key and  the value.

- ```ruby
  { a: "ant", b: "bear", c: "cat" }.any? do |key, value|
    value.size > 4
  end
  # => false
  ```

  - The above code returns a boolean, signifying whether any value in the hash is greater than 4.

#### Enumerable#include?

- `include?` **doesn't take a block**, but it does require **one argument.**

  - It returns `true` if the argument exists in the collection and `false` if it doesn't.

  - ```ruby
    [1, 2, 3].include?(1)
    # => true
    ```

- When called on a hash, `include?` **only checks the keys**, not the values.

- ```ruby
  { a: "ant", b: "bear", c: "cat" }.include?("ant")
  # => false
  
  { a: "ant", b: "bear", c: "cat" }.include?(:a)
  # => true
  ```

  - In fact, `Hash#include?` is essentially an alias for...

    - ##### `Hash#key?` 

    - ##### `Hash#has_key?`. 

      - In practice, Rubyists would usually prefer these methods over `include?` as they make the intention more explicit.

  - **<u>If we wanted to find out if a value exists within a hash</u>**, we could use...

    - ##### `Hash#value?` 

    - ##### `Hash#has_value?`  

      - Example: `hash.has_value?('cat')`. 

    - These methods have an advantage over, say, calling the `Hash#values` method and then chaining `include?` in that there is one less method to call: `hash.values.include?('cat')`.

#### Enumerable#partition

- `partition` divides up elements in the current collection into two collections, depending on the block's return value

- ```ruby
  [1, 2, 3].partition do |num|
    num.odd?
  end
  # => [[1, 3], [2]]
  ```

  - The **return value is a nested array**, with the <u>inner arrays separated</u> based on the <u>return value of the block</u>. 

- The most idiomatic way to use `partition` is to parallel assign variables to capture the divided inner arrays:

  - ```ruby
    odd, even = [1, 2, 3].partition do |num|
      num.odd?
    end
    
    odd  # => [1, 3]
    even # => [2]
    ```

- Even if the collection is a hash, the return value of `partition` will always be an array.

  - ```ruby
    long, short = { a: "ant", b: "bear", c: "cat" }.partition do |key, value|
      value.size > 3
    end
    # => [[[:b, "bear"]], [[:a, "ant"], [:c, "cat"]]]
    ```

  - To transform these arrays back into a hash, we can invoke **<u>`Array#to_h`</u>**.

  - ```ruby
    long.to_h # => { :b => "bear" }
    short.to_h  # => { :a => "ant", :c => "cat" }
    ```



-----------------------

### Practice Problems: Methods and More Methods

##### 3) What is the return value of `reject` in the following code? Why?

```ruby
[1, 2, 3].reject do |num|
  puts num
end
```

- Answer: `[1, 2, 3]`
  - Since `puts` always returns `nil`, you might think that no values would be selected and an empty array would be returned. 
  - The important thing to be aware of here is how `reject` treats the return value of the block
    - `reject` returns a new array containing items where the block's return value is "falsey". 
    - In other words, if the return value was `false` or `nil` the element would be selected.

##### 4) What is the return value of `each_with_object` in the following code? Why?

```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```

- Answer:  `{ "a" => "ant", "b" => "bear", "c" => "cat" }`
  1. When we invoke `each_with_object`, **we pass in an object (`{}` here)** as an **argument**. 
  2. That <u>object is then passed into the block</u> and its <u>updated value is returned</u> at the <u>end of each iteration.</u> 
  3. Once `each_with_object` has iterated over the calling collection, it **returns the initially given object**, which now contains all of the updates.

##### 5) What does `shift` do in the following code? How can we find out?

```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```

- Answer: `[:a, "ant"]`
  - `shift` destructively removes the first key-value pair in `hash` and returns it as a two-item array. 

##### 6) What is the return value of the following statement? Why?

```ruby
['ant', 'bear', 'caterpillar'].pop.size
```

- Answer: 11
  - `pop` destructively removes the last element from the calling array and returns it.

##### 7) What is the **block**'s return value in the following code? How is it determined? Also, what is the return value of `any?` in this code and what does it output?

```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```

- **Block's return value - `[true]`** 
  - This is determined on the first iteration
- **Method's return value - `true`**
  - Since the `Array#any?` method returns `true` if the block ever returns a value other than `false` or `nil`, and the block returns `true` on the first iteration, we know that `any?` will return `true`.
  - `any?` <u>stops iterating after this point</u> since there is no need to evaluate the remaining items in the array; therefore, `puts num` is only ever invoked for the first item in the array: `1`.

##### 8) How does `take` work? Is it destructive? How can we find out?

```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
```

- `[1, 2]`
  - take(n) → new_ary
  - Returns first `n` elements from the array.
  - <u>Non-destructive</u> (because a new array is returned)

##### 9) What is the return value of `map` in the following code? Why?

```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

- `[nil, "bear"]`
  - If we look at the `if` condition (`value.size > 3`), we'll notice that it evaluates to `true` when the length of `value` is greater than `3`. 
    - In this case, the only value with a length greater than `3` is `'bear'`.
    - This means that for the first element, `'ant'`, the condition evaluates to `false` and `value` isn't returned.
  - When none of the conditions in an `if` statement evaluates as `true`, the `if` statement itself returns `nil`. 

##### 10) What is the return value of the following code? Why?

```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```

- `[1, nil nil]`

  - We can determine the block's return value by looking at the return value of the last statement evaluated within the block. 

    - For the first element, the `if` condition evaluates to `false`, which means `num` is the block's return value for that iteration. 

    - For the rest of the elements in the array, `num > 1` evaluates to `true`, which means `puts num` is the last statement evaluated, which in turn, means that the block's return value is `nil` for those iterations.

      

---------------------------------------

### Practice Problems: Additional Practice





-----------------------------------------------------------------------------

### QUIZ - Lesson 4

1. What happens if we try to initialize a Hash that contains duplicate keys?

   Example:

   ```ruby
hsh = {a: 100, b: 200, c: 300, a: 400}
   ```

   **The value for the second occurrence of the duplicate key overwrites the value for the first occurrence.** **The hash is created and a warning is raised but the hash does not contain *all* of the key-value pairs; the first occurrence is overwritten by the second.**

   

   ------------------------------------

   

2. Identify all of the code implementations that correctly meet the following set of requirements.

   > Given an array of strings representing integers, iterate through all  of the items in the array. If the integer value of the string is odd add it to a new array of odd integer strings. Once iteration is complete  the new array should contain all of the odd integer strings from the  original array.

   - [ ] ```ruby
     numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
     odd_numbers = []
     number = 0
     
     until number == numbers.size
       odd_numbers << numbers[number] if number.to_i.odd?
     
       number += 1
     end
     ```

     - A isn't correct b/c.. The issue here is using the counter `number` in the `if` condition. You could fix this bug by changing the line to:

     - ```ruby
       odd_numbers << numbers[number] if numbers[number].to_i.odd?
       ```

   - [x] ```ruby
     numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
     odd_numbers = []
     
     for number in numbers
       if number.to_i.odd?
         odd_numbers.push(number)
       end
     end
     ```

   - [x] ```ruby
     numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
     odd_numbers = []
     counter = 0
     
     loop do
       number = numbers[counter].to_i
     
       odd_numbers << numbers[counter] unless number.even?
     
       counter += 1
       break if counter == numbers.size
     end
     ```

   - [x] ```ruby
     numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
     odd_numbers = []
     
     numbers.each do |number|
       odd_numbers << number if number.to_i.odd?
     end
     ```

     

     ---------------

     

3. Identify all of the code implementations that correctly meet the following set of requirements.

   > Given an array of integers, for each integer output all integers from `1` to that integer; e.g. if the integer was `5`, you would output `1`, `2`, `3`, `4`, `5`.

   - [x] ```ruby
     numbers = [7, 3, 5, 2, 1, 8, 4]
     counter = numbers.size
     
     loop do
       number = numbers[-counter]
       for num in 1..number
         puts num
       end
     
       break if counter == 1
       counter -=1
     end
     ```

   - [ ] ```ruby
     numbers = [7, 3, 5, 2, 1, 8, 4]
     counter = 0
     
     loop do
       number = numbers[counter]
       counter = 0
     
       loop do
         counter += 1
         puts counter
     
         break if counter >= number
       end
     
       counter += 1
       break if counter >= numbers.size
     end
     ```

     - Incorrect: B. The issue here is that we've used the same variable name `counter` to track iteration for both the inner loop and the outer loop; because `counter` increments to `7` on the first iteration of the inner loop, the outer loop is only run once.

   - [x] ```ruby
     numbers = [7, 3, 5, 2, 1, 8, 4]
     
     for number in numbers
       counter = 0
     
       loop do
         counter += 1
         puts counter
     
         break if counter >= number
       end
     end
     ```

   - [x] ```ruby
     numbers = [7, 3, 5, 2, 1, 8, 4]
     
     numbers.each do |number|
       counter = 0
       number.times do
         counter += 1
         puts counter
       end
     end
     ```

     

   ------------

   

4. This method takes a string in standard sentence case and *should* return it in snake case:

   ```ruby
   sentence = 'The sky was blue'
   snake(sentence) # => 'the_sky_was_blue'
   ```

   but it contains an error.

   Identify the line of code that is causing the error.

   ```ruby
   def snake(str)
     words = str.split
     current_word = 1
   
     loop do
       words[current_word].downcase!
   
       current_word += 1
       break if current_word >= words.size
     end
   
     words.join('_')
   end
   ```

   **Answer:**

   ```
   current_word = 1
   ```

   

   -----------------

   

5. This method takes a string in standard sentence case and *should* return it in camel case:

   ```ruby
   sentence = 'The sky was blue'
   camel(sentence) # => 'TheSkyWasBlue'
   ```

   but it contains an error.

   Identify the line of code that is causing the error.

   ```ruby
   def camel(str)
     words = str.split(' ')
     counter = 0
   
     while counter > words.size
       words[counter] = words[counter].capitalize
   
       counter = counter + 1
     end
   
     words.join
   end
   ```

   **Answer:**

   ```ruby
   while counter > words.size
   ```

   **B. The problem is the conditional in the `while` loop. This should use `<` for comparison instead of `>`. As it stands, the loop never gets executed because `counter` is assigned to `0` and so is never greater than `words.size`.**

   

   ----------------------

   

6. This method takes a string in standard sentence case and *should* return it in upper snake case:

   ```ruby
   sentence = 'The sky was blue'
   upper_snake(sentence) # => 'THE_SKY_WAS_BLUE'
   ```

   but it contains an error.

   Identify the line of code that you need to fix in order to make this code work properly.

   ```ruby
   def upper_snake(str)
     words = str.split
     current_word = 0
   
     loop do
       current_word += 1
       break if current_word == words.size
   
       words[current_word].upcase!
     end
   
     words.join('_')
   end
   ```

   **Answer:**

   ```ruby
   current_word += 1
   ```

   **The problem here is not the line itself but the *positioning* of the line. Because we increment our `current_word` counter *before* the line that calls `upcase!`, the first word in the string does not get upcased (or if there is only a single word we break out of the loop straight away). This can be fixed  by moving the line `current_word += 1` to the bottom of the loop.**

   

   -------------------

   

7. <u>Read the below statements regarding `each` and identify all the statements which are correct. You may assume that the block doesn't terminate the method prematurely.</u>

   - A  If you call `each` with a block on an array that contains seven elements, the block will always execute seven times.

     - False because If you mutate the object used to call `each` from within your block, the block may run fewer than 7 times.

   - B  When `each` is called with a block on a hash, it returns an array.

     - False because  The `Hash#each` method returns the hash that it was called on.

   - **C  When `each` is called with a block on an array, it returns the array object that it was called on.**

     - When called with a block, the `Array#each` method returns the array itself. Without a block a returns an Enumerator.

   - D  When called with a block, the `Array#each` method considers the truthiness of the block's return value.

     - The `Array#each` method ignores the return value of the block.

       

   ------------

   

8. <u>*Read* the below statements regarding `select` and identify all the statements which are correct.</u>

   A  If `select` was called with a block that returned a falsey value on every iteration, `select` would return `nil`

   - If the block's return value is evaluated as `false` on every iteration, the return value would be an empty collection of the type `select` was called on.

   **B  When `select` is called with a block, it evaluates the truthiness of the block's return value.**

   C  If `select` was called on an array with a block that returned a truthy value on each iteration, the original array would be returned.

   - The return value in this case would be a **new** array containing all of the *items* from the original array.

   **D  When `select` is called with a block on a hash it returns a new hash.**

   

   ------------

   

9. <u>Read the below statements regarding `map` and identify all the statements which are correct. Assume that the block does not mutate the array.</u>

   A  If `map` was called with a block that returned `nil` on every iteration, it would return an empty array.

   - The return value in this situation would be an array containing `nil`s; one `nil` for each item in the original array.

   **B  If `map` was called with a block on an array containing five items, the return value would be an array containing five items.**

   **C  `Enumerable#map` and `Enumerable#collect` perform the same function.**

   D  When `map` is called with a block on a hash it returns a new hash.

   - <u>When `map` is called with a block on a hash, the return value of the method is an array.</u>

     

   --------------------

   

10. Identify all the code samples which **are** examples of selection.

    - [ ] ```ruby
      arr = [1, 2, 3, 4, 5]
      counter = 0
      
      new_arr = []
      
      loop do
        num = arr[counter]
        if num >= 3
          new_arr << 0
        else
          new_arr << num * 2
        end
      
        counter += 1
        break if counter == arr.size
      end
      ```

      - This is <u>transformation rather than selection</u>; `new_arr` contains the same number of elements as `arr` but some of the values have been multiplied by `2`.

    - [x] ```ruby
      hsh = {a: 'apple', b: 'pear', c: 'orange', d: 'kiwi', e: 'banana'}
      counter = 0
      
      new_hsh = {}
      
      for letter, fruit in hsh
        new_hsh[letter] = fruit if fruit.size > 4
      end
      ```

      - In both of these examples, the new collection contains a <u>sub-section of the original collection.</u>

    - [x] ```ruby
      def some_method(words)
        arr = []
        counter = 0
      
        loop do
          word = words[counter]
          arr << word if word.size < 4
      
          counter += 1
          break if counter == words.size
        end
      
        arr
      end
      
      poem = %w(April is the cruelest month)
      some_method(poem)
      ```

      - In both of these examples, the new collection contains a sub-section of the original collection.

    - [ ] ```ruby
      num_arr = [2, 4, 7, 8, 11, 15]
      counter = 0
      
      until counter == num_arr.size
        puts num_arr[counter] + 1
      
        counter += 1
      end
      ```

      - This is neither selection nor transformation, just iteration through `num_arr` with a value being output for each element in the array.

        

        ------------------------------

        

11. Identify all the code samples which are **not** examples of transformation.

    - [ ] ```ruby
      def star_method(stars)
        arr = []
        stars.each do |star|
          arr.push(star.upcase)
        end
        arr
      end
      
      stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
      stars_2 = star_method(stars_1)
      ```

      - These *are* transformation. In both cases `stars_2` contain altered versions of the strings in `stars_1`.

    - [x] ```ruby
      def star_method(stars)
        arr = []
        counter = 0
      
        until counter == stars.size
          star = stars[counter]
          arr << star if star.size > 4
      
          counter += 1
        end
        arr
      end
      
      stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
      stars_2 = star_method(stars_1)
      ```

      - This is selection, rather than transformation; `stars_2` contains a sub-set of the elements in `stars_1`.

    - [x] ```ruby
      def star_method(stars)
        for star in stars
          star.downcase
        end
      end
      
      stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
      stars_2 = star_method(stars_1)
      ```

      - This is <u>neither selection nor transformation</u>. Although we call `downcase` on each element in `stars`, the way that the method is implemented means that <u>nothing in our `stars_1` or `stars_2` arrays is selected or transformed</u>. As with `each`, the return value of a `for` loop in Ruby (and therefore of our method) is simply the object it was called on, in this case the `stars_1` array that we passed to the method.
      - To transform both arrays, you would have to use `star.downcase!`

    - [ ] ```ruby
      def star_method(stars)
        arr = []
        counter = 0
      
        until counter == stars.size do
          arr << stars[counter][0, 3]
      
          counter += 1
        end
        arr
      end
      
      stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
      stars_2 = star_method(stars_1)
      ```

      - These *are* transformation. In both cases `stars_2` contain altered versions of the strings in `stars_1`.

        

    ---------------

    

12. Within the code below, identify the method represented by `some_method`:

    ```ruby
    ['a', 'b', 'c'].some_method do |item|
      puts item
    end
    # => []
    ```

    A  `each`

    - `each` would return the original array.

    **B  `select`**

    - **`puts item` returns `nil` which is evaluated as falsey, therefore using `select` would return an empty array.**

    C   `map`

    - `map` would return an array of `nil`s `[nil, nil, nil]`.

    D  `None of the Above`

    

    -------------------------

    

13. Within the code below, identify the method represented by `some_method`:

    ```ruby
    [1, 2, 3, 4, 5].some_method do |num|
      num + 1
    end
    # => []
    ```

    A  `each`

    - `each` would return the original array.

    B  `select`

    - `select` would return a new array containing all the items from the original array `[1, 2, 3, 4, 5]`.

    C   `map`

    - `map` would return an array with each integer incremented by 1 `[2, 3, 4, 5, 6]`.

    **D  `None of the Above`**

    - **None of `each`, `select` or `map` would return an empty array with the given block. If `reject` was used here then an empty array would be returned.**

      

    ---------

    

14. Within the code below, identify the method represented by `some_method`:

    ```ruby
    ['green', 'blue', 'red'].some_method do |word|
      puts word
      word.upcase
    end
    # => ['GREEN', 'BLUE', 'RED']
    ```

    A  `each`

    - `each` would return the original array.

    B  `select`

    - `select` would return a new array, containing all of the (lowercased) strings from the original array.

    **C   `map`**

    - **`map` returns a new array, with each element determined by  the return value of the block, in this case an upper case version of  each string from the original array.**

    D  `None of the Above`

    

    ----------------

    

15. Within the code below, identify the method represented by `some_method`:

    ```ruby
    {a: 1, b: 2, c: 3, d: 4, e: 5}.some_method do |_, num|
      plus_one = num + 1
      puts "#{num} plus 1 is #{plus_one}"
    end
    # => {:a => 1, :b => 2, :c => 3, :d => 4, :e => 5}
    ```

    **A  `each`**

    - **The `Hash#each` method returns the calling object, i.e. the hash that `each` was called on.**

    B  `select`

    - `select` would return an empty hash, since the call to `puts` returns `nil` and this is the last expression evaluated in the block.

    C   `map`

    - `map` would return an array of `nil`s; as with **B**, `puts` is the last expression evaluated in the block, and `map` returns an array.

    D  `None of the Above`

    

    ------------------------

    

16. Carefully examine the following code example.

    ```ruby
    pets = ['cat', 'parrot', 'dog', 'fish']
    pets.map do |pet|
      pet.size == 3
    end
    ```

    Based on your observations of the code example, select all statements below which are true.

    

    - [x] **A  The method called on the `pets` array considers the return value of the block.**

      - **The return value of the block, which will be `true` or `false`, *is* considered and in fact is used to populate a *new* array that is returned by the call to `map`.**

      - ```ruby
        [true, false, true, false]
        ```

    - [ ] B  The method called on the `pets` array will return the original array.
    - [ ] Calling`Array#map` with a block returns a *new* `Array`.

    - [x] **C  The method called on the `pets` array will return a new array.**

      - **The return value of the block, which will be `true` or `false`, *is* considered and in fact is used to populate a *new* array that is returned by the call to `map`.**

      - ```ruby
        [true, false, true, false]
        ```

    - [ ] D  The method called on the `pets` array will return only the items from the array which meet the criteria set in the block.

      -  This would be a <u>description of *selection*</u> but `map` performs *transformation*, in this case replacing each array item with a boolean.

        

      ---------

      

17. ```ruby
    flavors = ['chocolate', 'strawberry', 'mint', 'vanilla']
    flavors.reject { |flavor| puts flavor }
    ```


*Based* on your observations of the code example, select all statements below which are true.

- [ ] A The method called on the `flavors` array will return an empty array.

- [ ] B The method called on the `flavors` array ignores the return value of the block. 

- [ ] C The method called on the `flavors` array returns a reference to the original array. 
  - The array returned by `reject` it is a *new* array however, and not the original `flavors` array.

- [x] **D The method called on the `flavors` array considers only the truthiness of the block's return value.**
  - **Like `Array#select`, `Array#reject` is only interested in the *truthiness* of the block's return value, though in the case of `reject` it returns the items for which the block is *not* `true`, or in other words is *falsy*.**

<u>I selected C & D but C is wrong.</u>

**A**, **B**, & **C**. ```Array#reject` *does* consider the return value of the block; since in this case the return value will be `nil` in each case, this will always be evaluated as *falsy* and so the array that is returned contains all of the flavor strings. The array returned by `reject` it is a *new* array however, and not the original `flavors` array.



---------



18.  Identify all of the code implementations that correctly meet the following set of requirements.

    > Given an array `numbers` which contains both odd and even integers; create two new arrays, `odd_numbers` which contains the odd integers from the original array and `even_numbers` which contains the even integers.

    - [x] ```ruby
      numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
      
      odd_numbers = numbers.select do |number|
                      number.odd?
                    end
      
      even_numbers = numbers.select do |number|
                      number.even?
                    end
      ```

    - [x] ```ruby
      numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
      odd_numbers = []
      even_numbers = []
      
      numbers.each do |number|
        if number.even?
          even_numbers << number
        elsif number.odd?
          odd_numbers << number
        end
      end
      ```

    - [x] ```ruby
      numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
      odd_numbers = []
      even_numbers = []
      
      for number in numbers
        next if number.odd?
        even_numbers << number
      end
      
      for number in numbers
        next unless number.odd?
        odd_numbers << number
      end
      ```

    - [ ] ```ruby
      numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
      odd_numbers, even_numbers = numbers.partition do |number|
                                    number.even?
                                  end
      ```

      - This gets the two new arrays the wrong way around in the parallel assignment. This is because `Enumerable#partition` returns an array containing two sub-arrays, <u>the *first* of which contains the elements for which the block evaluates to `true`.</u> Since the condition in this case evaluates whether each number is even, we should assign `even_numbers` to the first sub-array and `odd_numbers` to the second.

        

    -----------

    

19. Identify all of the code implementations that correctly meet the following set of requirements.

    > Given the following hash which contains keys representing countries  and values representing the capital cities of those countries, return a  new hash containing only the key-value pairs where the country begins  with the letter 'B'.

    ```ruby
    countries_and_capitals = {
      'France' => 'Paris',
      'Belgium' => 'Brussels',
      'Morocco' => 'Rabat',
      'Barbados' => 'Bridgetown',
      'Peru' => 'Lima',
      'Bolivia' => 'La Paz',
      'Brazil' => 'Brasilia'
    }
    ```

    

    - [ ] ```ruby
      countries_and_capitals.select { |_, country| country[0] == 'B' }
      ```

      - Although our second block parameter is called `country` it is actually referring to the hash *value* in each iteration, which in this case are the capitals.

    - [x] ```ruby
      countries_and_capitals.each_with_object({}) do |(k, v), obj|
        obj[k] = v if k.chr == 'B'
      end
      ```

    - [x] ```ruby
      def select_countries(hsh)
        sub_set = {}
        hsh.each_key do |country|
          if country[0] == 'B'
            sub_set[country] = hsh[country]
          end
        end
        sub_set
      end
      
      select_countries(countries_and_capitals)
      ```

    - [ ] ```ruby
      def begins_with_b(string)
        string[0] == 'B'
      end
      
      countries_and_capitals.find_all do |country, capital|
        begins_with_b(country)
      end
      ```

      - This code returns a <u>nested array rather than a hash</u>; though if we refactored our code slightly to call `to_h` on this return value then the code would fulfill the requirements.

        

      -------------

      

20. Your team is asked to refactor some legacy code used by the marketing team. One of the requirements of the project is to change the  implementation from using basic looping structures to using iterative  methods instead.

    Sample data:

    ```ruby
    mailing_campaign_leads = [
      {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
      {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
      {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
      {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
    ]
    ```

    ```ruby
    counter = 0
    
    loop do
      break if counter == mailing_campaign_leads.size
      full_name = mailing_campaign_leads[counter][:name]
      names = full_name.split
    
      names_counter = 0
      loop do
        break if names_counter == names.size
        name = names[names_counter]
        names[names_counter] = name.capitalize
    
        names_counter += 1
      end
    
      capitalized_full_name = names.join(' ')
      mailing_campaign_leads[counter][:name] = capitalized_full_name
    
      counter += 1
    end
    
    usable_leads = []
    counter = 0
    
    loop do
      break if counter == mailing_campaign_leads.size
      last_login = mailing_campaign_leads[counter][:days_since_login]
      subscribed_to_list = mailing_campaign_leads[counter][:mailing_list]
    
      if last_login < 60 && subscribed_to_list
        usable_leads << mailing_campaign_leads[counter]
      end
    
      counter += 1
    end
    ```

    The team comes up with four options to replace the legacy  code, which you then discuss during a code review. Select all the  options which replicate the functionality of the legacy code.

​	

- [ ] ```ruby
  mailing_campaign_leads.map do |lead|
    lead[:name].capitalize!
  end
  
  mailing_campaign_leads.select! do |lead|
    lead[:days_since_login] < 60 && lead[:mailing_list]
  end
  ```

  - This only capitalizes the first name in the name string. You might also note that this is not really an appropriate use of `map`, and `each` would be a better choice here.

- [ ] ```ruby
  mailing_campaign_leads.each do |lead|
    names = lead[:name].split
    names.map! { |name| name.capitalize }
    lead[:name] = names.join(' ')
  end
  
  usable_leads = mailing_campaign_leads.keep_if do |lead|
    lead[:days_since_login] <= 60 && lead[:mailing_list]
  end
  ```

  - This performs an incorrect comparison in the conditional, using `<=` instead of `<`; although this error isn't surfaced by the test data it could have an impact in production.

- [ ] ```ruby
  mailing_campaign_leads.each do |lead|
    names = lead[:name].split
    lead[:name] = names.map { |name| name.capitalize }.join(' ')
  end
  
  usable_leads = mailing_campaign_leads.reject do |lead|
    last_login = lead[:days_since_login]
    subscribed_to_list = lead[:mailing_list]
    last_login > 59 && !subscribed_to_list
  end
  ```

  - When evaluating our `usable_leads`, we want to check that the customer's last login was less than 60 days ago and also that they are  subscribed to our mailing list. Because this solution uses `reject` rather than `select` it is only eliminating leads where neither of those things are true rather than just one of them. This could be fixed by using `||` instead of `&&` in the conditional.

- [x] ```ruby
  mailing_campaign_leads.each do |lead|
    names = lead[:name].split
    names.map! { |name| name.capitalize }
    lead[:name] = names.join(' ')
  end
  
  usable_leads = mailing_campaign_leads.select do |lead|
    lead[:days_since_login] < 60 && lead[:mailing_list]
  end
  ```



---------------



## <u>Lesson 5: Advanced Ruby Collections</u>

### <u>Sorting</u>

##### What is sorting?

- Sorting is setting the order of the items in a collection according to a certain criterion.

```ruby
[2, 5, 3, 4, 1].sort # => [1, 2, 3, 4 ,5]
```

- Sorting is essentially carried out by *comparing* the items in a collection with each other, and ordering them based on the result of that comparison. *Comparison is at the heart of how sorting works*.
- When we call `sort` on an array though, it doesn't know  whether that array contains integers, strings, or some other type of  object; so how does it know how to order the elements in the array?
  - The answer is that it uses a method to determine this; the `<=>` method (sometimes referred to as the "spaceship" operator).

#### The `<=>` Method

- Any object in a collection that we want to sort **must** implement a `<=>` method. This method performs *comparison* between two objects of the same type and returns a `-1`, `0`, or `1`, depending on whether the first object is less than, equal to, or  greater than the second object; if the two objects cannot be compared  then `nil` is returned.

- ```ruby
  2 <=> 1 # => 1
  1 <=> 2 # => -1
  2 <=> 2 # => 0
  'b' <=> 'a' # => 1
  'a' <=> 'b' # => -1
  'b' <=> 'b' # => 0
  1 <=> 'a' # => nil
  ```

  **The ASCII Table**

  - Uppercase letters come before lowercase letters
  - Digits and (most) punctuation come before letters

<u>Sort</u> <u>Method</u>

- We can also call `sort` with a block; this gives us more  control over how the items are sorted. The block needs **two arguments**  passed to it (the two items to be compared) and the **return value of the  block** has to be `-1`, `0`, `1` or `nil`.

- ```ruby
  [2, 5, 3, 4, 1].sort do |a, b|
    a <=> b
  end
  # => [1, 2, 3, 4, 5]
  ```

- In the below example, by switching the order in which the items are compared the new array returned is in descending order.

  - ```ruby
    [2, 5, 3, 4, 1].sort do |a, b|
      b <=> a
    end
    # => [5, 4, 3, 2, 1]
    ```

#### The `sort_by` method

- `sort_by` is similar to `sort` but is usually called with a block. The code in the block determines how the items are compared.

- ```ruby
  ['cot', 'bed', 'mat'].sort_by do |word|
    word[1]
  end
  # => ["mat", "bed", "cot"]
  
  ```

  - Here we are sorting using the character at index `1` of each string, so only the characters `'a'`, `'e'` and `'o'` are compared and the strings ordered according to the comparison of  those characters. The other characters in the strings are ignored  entirely.
  
- When calling `sort_by` on a hash, two arguments need to be passed to the block - the key and the value.

- **The last argument evaluated in the block should be the thing by which we want to sort**

- ```ruby
  people = { Kate: 27, john: 25, Mike:  18 }
  people.sort_by do |_, age|
    age
  end
  # => [[:Mike, 18], [:john, 25], [:Kate, 27]]
  
  ```

  - You may have noticed that one of the names, `:john`, is not capitalized. Since strings are compared in 'ASCIIbetical' order, `:john` will come after `:Kate` and `:Mike`, which may not be what we want.

  - We can use the `Symbol#capitalize` method on each name within the block so that when the keys are compared they are all capitalized.

  - ```ruby
    people.sort_by do |name, _|
      name.capitalize
    end
    # => [[:john, 25], [:Kate, 27], [:Mike, 18]]
    ```

- **`sort_by` always returns an array, even when called on a hash**, so the result here is a new array with the key-value pairs as  objects in nested arrays. If we need to convert this back into a hash we can call `Array#to_h` on it.

  > Note: `Array#sort` and `Array#sort_by` have a equivalent destructive methods `Array#sort!` and `Array#sort_by!`. With these methods, rather then returning a new collection, the same  collection is returned but sorted. These methods are specific to arrays  and are not available to hashes

### Summary

- Comparison is at the heart of sorting. When sorting collections, you  need to know if the objects you want to sort on implement a `<=>` method and how that method is defined.
- Methods other than `sort` and `sort_by` also use comparison as the basis for how they work.
  - `min` `max` `minmax` `min_by` `max_by` `minmax_by`



#  Nested Data Structures

#### Referencing collection elements

- Each inner array still has its own index even though they're both inside of an array.

```ruby
arr = [[1, 3], [2]]
arr[0] # => [1, 3]
arr[0][1] # => 3
```

#### Updating collection elements

- ```ruby
  arr = [[1, 3], [2]]
  arr[1] = "hi there"
  arr                     # => [[1, 3], "hi there"]
  ```

  - The `arr[1] = "hi there"` is a **destructive action** that permanently changed the second element in the `arr` array; it replaced the entire `[2]` inner array with the string `"hi there"`.

<u>Insert an additional element into an inner array</u>

- ```ruby
  arr = [[1], [2]]
  
  arr[0] << 3
  arr # => [[1, 3], [2]]
  ```

#### Other nested structures

- Hashes can be nested within an array as well

- ```ruby
  arr = [{ a: 'ant' }, { b: 'bear' }]
  
  arr[0][:c] = 'cat'
  arr # => [{ :a => "ant", :c => "cat" }, { :b => "bear" }]
  ```

- As we know, arrays can contain any type of Ruby object. This means that arrays can hold multiple different objects at the same time, including  nested data structures

#### Variable reference for nested collections

```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr # => [[1, 3], [2]]
```

- The local variables `a` and `b` are pointing to `Array` objects. When we place the local variables as elements in an array, it looks like the same as adding the actual `Array` objects that they're pointing to into the array. And that's true to a  certain extent, but there are some edge cases we need to think about.

- More importantly, we need to establish a working mental model of how the addition of variable reference affects the data in our nested collections.

- <u>For example, what happens if we modify `a` after placing it in `arr`?</u>

  ```ruby
  a = [1, 3]
  b = [2]
  arr = [a, b]
  arr # => [[1, 3], [2]]
  
  a[1] = 5
  arr # => [[1, 5], [2]]
  ```

  - **The value of `arr` changed because `a` still points to the *same `Array` object* that's in `arr`. When we modified it by replacing `3` with `5`, we were modifying the `Array` object.**

![](/home/patrick/Desktop/variables-pointing-to-objects.png)

- <u>What if we modify the first array in `arr`? Is it different than modifying `a` directly?</u>

- ```ruby
  arr[0][1] = 8
  arr # => [[1, 8], [2]]
  a   # => [1, 8]
  ```

  - **It produces the same result as modifying `a` directly.** Why is that?
  -  **In both cases, we're modifying the *object* that `a` and `arr[0]` point to; we now have two ways to reference the *same object***. 
    - In the first example, the object is being modified through `a`. 
    - In the second example, the object is being modified through `arr[0]`.
  
- ### <u>Remember that **variables are pointers to physical space in memory**</u>

  

### Shallow Copy

- Ruby provides two methods that let us copy an object, including collections: `dup` and `clone`. Both of these methods create a *shallow copy* of an object.
  - This means that only the **object that the method is called on is copied**. 
  - <u>If the object contains **other objects** - like a nested array</u> - then those **objects will be *shared* (between the two collections), NOT copied**. This has major impact to nested collections.

- `dup` allows **<u>objects within the copied</u>** object to be <u>modified</u>.

  - ```RUBY
    arr1 = ["a", "b", "c"]
    arr2 = arr1.dup
    arr2[1].upcase!
    
    arr2 # => ["a", "B", "c"]
    arr1 # => ["a", "B", "c"]
    
    ```

- `clone` works the same way.

  - ```ruby
    arr1 = ["abc", "def"]
    arr2 = arr1.clone
    arr2[0].reverse!
    
    arr2 # => ["cba", "def"]
    arr1 # => ["cba", "def"]
    ```

-  You may have noticed that in both of the above examples <u>*both* `arr1` and `arr2` are changed.</u>

  - It's important to understand that the reason this happens is because **the destructive methods** (`String#upcase!` and `String#reverse!`) **were called on the <u>object *WITHIN* the array</u>** **rather than the array itself.**

  - Since, as we've already covered, **<u>those objects are *shared* (between the two arrays)</u>**, even if you mutate that object by referencing it from within a particular array or other collection, **<u>it is the OBJECT you are affecting RATHER than the collection.</u>**

    

  Consider the following examples:

- ```ruby
  # Example 1
  
  arr1 = ["a", "b", "c"]
  arr2 = arr1.dup
  arr2.map! do |char|
    char.upcase
  end
  
  arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]
  ```

  - In the first example <u>`arr2` is changed but `arr1` is not</u>. Here, we call the destructive method `Array#map!` on `arr2`; <u>this method modifies the array</u>, replacing each element of `arr2` with a new value. Since we are <u>**changing the Array, not the elements (objects) within it**, **`arr1` is left unchanged.**</u>
    - `map!` will modify the Array `arr2` and `arr2` only, the shared objects aren't modified.
  
- ```ruby
  # Example 2
  
  arr1 = ["a", "b", "c"]
  arr2 = arr1.dup
  arr2.each do |char|
    char.upcase!
  end
  
  arr1 # => ["A", "B", "C"]
arr2 # => ["A", "B", "C"]
  ```
  
  - In the second example, <u>both `arr1` and `arr2` are changed.</u> Here, we call the <u>destructive `String#upcase!`</u> method on **each *element* of `arr2`.** However, every **<u>element of `arr2`</u>** is a **<u>reference to the object referenced by the corresponding element in `arr1`</u>**. 
  
    - Thus, when `#upcase!` mutates the element in `arr2`, `arr1` is also affected; we **change the Array elements (the shared objects)**, **not the Array itself**.
  
    - `char.upcase!` will ONLY modify the objects shared between `arr1` and `arr2`, which is why they're both modified. 
  
      

### Freezing Objects

- The <u>main difference</u> between `dup` and `clone` is that **`clone` PRESERVES THE FROZEN STATE OF THE OBJECT**   ( CP - clone preserves - acronym for... you know... )

  - ```ruby
    arr1 = ["a", "b", "c"].freeze
    arr2 = arr1.clone
    arr2 << "d"
    # => RuntimeError: can't modify frozen Array
    ```

- `dup` does **NOT** preserve the frozen state of the object

  - ```ruby
    arr1 = ["a", "b", "c"].freeze
    arr2 = arr1.dup
    arr2 << "d"
    
    arr2 # => ["a", "b", "c", "d"]
    arr1 # => ["a", "b", "c"]
    ```

    - With `dup` we don't get an error because the frozen state of the object isn't preserved - the object can be modified.

- What is **freezing**? In Ruby, objects can be frozen in order to **prevent them from being modified.**

  - ```ruby
    str = "abc".freeze
    str << "d"
    # => RuntimeError: can't modify frozen String
    ```

- **<u>Only mutable objects can be frozen</u> because immutable objects, like integers, are already frozen.**

  - We can check if an object is frozen with the `frozen?` method:

    ```ruby
    5.frozen? # => true
    ```

  

- > What does `freeze` actually freeze? `freeze` **ONLY** freezes the object it's called on. If the object it's called on **CONTAINS OTHER OBJECTS**, those objects **WON'T BE FROZEN**.
  >
  > - For example, if we have a nested array the nested objects can still be modified after calling `freeze`.
  >
  > - ```ruby
  >   arr = [[1], [2], [3]].freeze
  >   arr[2] << 4
  >   arr # => [[1], [2], [3, 4]]
  >   
  >   arr << 4
  >   # can't modify frozen Array: [[1], [2], [3, 4]] (FrozenError)
  >   ```
  
  

### Deep Copy

- <u>Deep Copy</u> = deep freeze **objects within objects**
- In Ruby, there's no built-in or easy way to create a deep copy
- It is important therefore to really be aware of how exactly `freeze`, `dup`, and `clone` work and the side effects they have.
  - When working with collections, especially nested collections, one of the key things to be aware of is the level within the collection at which  you are working



#  Working with Blocks

<u>Evaluating Code:</u>

- What is the type of action being performed (method call, block, conditional, etc..)?

- What is the **object that action is being performed on**?

- What is the **side-effect** of that action (e.g. output or destructive action)?

- What is the return value of that action?

- Is the return value used by whatever instigated the action?

  

#### Example 1

```ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]
```

- The `Array#each` method is being called on the multi-dimensional array `[[1, 2], [3, 4]]`. Each inner array is passed to the block in turn and assigned to the local variable `arr`. The `Array#first` method is called on `arr` and returns the object at index `0` of the current array - in this case the integers `1` and `3`, respectively. The `puts` method then outputs a string representation of the integer. `puts` returns `nil` and, since this is the last evaluated statement within the block, the return value of the block is therefore `nil`. `each` doesn't do anything with this returned value though, and since the return value of `each` is the calling object - in this case the nested array `[[1, 2], [3, 4]]` - this is what is ultimately returned.

- | Line | Action                | Object                                   | Side Effect                                 | Return Value                             | Is Return Value Used?                        |
  | :--: | --------------------- | ---------------------------------------- | ------------------------------------------- | ---------------------------------------- | -------------------------------------------- |
  |  1   | method call (`each`)  | The outer array                          | None                                        | The calling object `[[1, 2], [3, 4]]`    | No, but shown on line 6                      |
  | 1-3  | block execution       | Each sub-array                           | None                                        | `nil`                                    | No                                           |
  |  2   | method call (`first`) | Each sub-array                           | None                                        | Element (object) at index 0 of sub-array | Yes, used by `puts`                          |
  |  2   | method call (`puts`)  | Element (object) at index 0 of sub-array | Outputs string representation of an Integer | `nil`                                    | Yes, used to determine return value of block |



#### Example 2

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]
```

| Line | Action                | Object                               | Side Effect                                   | Return Value                    | Is Return Value Used?                        |
| :--: | --------------------- | ------------------------------------ | --------------------------------------------- | ------------------------------- | -------------------------------------------- |
|  1   | method call (`map`)   | The outer array                      | None                                          | New array `[nil, nil]`          | No, but shown on line 6                      |
| 1-3  | block execution       | Each sub-array                       | None                                          | `nil`                           | Yes, used by `map` for transformation        |
|  2   | method call (`first`) | Each sub-array                       | None                                          | Element at index 0 of sub-array | Yes, used by `puts`                          |
|  2   | method call (`puts`)  | Element at index 0 of each sub-array | Outputs a string representation of an Integer | `nil`                           | Yes, used to determine return value of block |



#### Example 3

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# 1
# 3
# => [1, 3]
```

| Line | Action                | Object                               | Side Effect                                   | Return Value                    | Is Return Value Used?                        |
| :--: | --------------------- | ------------------------------------ | --------------------------------------------- | ------------------------------- | -------------------------------------------- |
|  1   | method call (`map`)   | The outer array                      | None                                          | New array `[1, 3]`              | No                                           |
| 1-4  | block execution       | Each sub-array                       | None                                          | Integer at index 0 of sub-array | Yes, used by `map` for transformation        |
|  2   | method call (`first`) | Each sub-array                       | None                                          | Element at index 0 of sub-array | Yes, used by `puts`                          |
|  2   | method call (`puts`)  | Element at index 0 of each sub-array | Outputs a string representation of an Integer | `nil`                           | No                                           |
|  3   | method call (`first`) | Each sub-array                       | None                                          | Element at index 0 of sub-array | Yes, used to determine return value of block |

- The block's return value (integer returned by arr.first) is then used by `map` to perform the transformation, replacing the inner array with an integer. Finally, `map` returns a new array with two integers in it.



#### Example 4

```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

# 18
# 7
# 12
# => [[18, 7], [3, 12]]
```

| Line | <u>Action</u>         | <u>Object</u> (object that action is being performed on) | <u>Side Effect</u> (output or destructive action) | <u>Return Value</u> (of that action)                         | <u>Is Return Value Used</u>? (by whatever instigated the action) |
| :--- | --------------------- | -------------------------------------------------------- | ------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 1    | variable assignment   | n/a                                                      | None                                              | `[[18, 7], [3, 12]]`                                         | No                                                           |
| 1    | method call (`each`)  | the outer array (`[[18, 7], [3, 12]]`)                   | None                                              | `[[18, 7], [3, 12]]` (the calling object)                    | Yes, used by variable assignment to `my_arr`                 |
| 1-7  | outer block execution | each sub-array                                           | None                                              | Each sub-array                                               | No (`each` doesn't use the return value)                     |
| 2    | method call (`each`)  | each sub-array                                           | None                                              | The calling object, which is the sub-array in the current iteration | Yes, used to determine the return value of the outer block   |
| 2-6  | inner block execution | Element of the sub-array in that iteration               | None                                              | `nil`                                                        | **No** (`each` doesn't use the return value)                 |
| 3    | comparison (`>`)      | Element of the sub-array in that iteration               | None                                              | Boolean                                                      | Yes, evaluated by `if`                                       |
| 3-5  | conditional (`if`)    | Element of the sub-array in the current iteration        | None                                              | `nil`                                                        | Yes, used to determine the return value of the inner block   |
| 4    | method call (`puts`)  | Element of the sub-array in the current iteration        | Outputs a string representation of an integer     | `nil`                                                        | Yes, used to determine the **return value of the conditional statement if the condition is met** |

- 4 return values to pay attention to:
  - return value of both calls to `each`
  - return value of both blocks
- In this case we're using `each`, which **ignores the return value of the block**. This lets us quickly see that the value of `my_arr` will be the array that `each` was called on.



#### Example 5

```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# => [[2, 4], [6, 8]]
```

| Line | <u>Action</u>                                       | <u>Object</u> (object that action is being performed on) | <u>Side Effect</u> (output or destructive action) | <u>Return Value</u> (of that action)          | <u>Is Return Value Used</u>? (by whatever instigated the action) |
| :--- | --------------------------------------------------- | -------------------------------------------------------- | ------------------------------------------------- | --------------------------------------------- | ------------------------------------------------------------ |
| 1    | method call (`map`)                                 | Original array (outer array) (`[[1, 2], [3, 4]]`)        | None                                              | New (transformed) array (`[[2, 4], [6, 8]]`)) | No                                                           |
| 1-5  | outer block execution                               | Each sub-array                                           | None                                              | New transformed array                         | Yes, used by **top-level** `map` transformation              |
| 2    | method call (`map`)                                 | Each sub-array                                           | None                                              | New transformed **(sub?)-array**              | **Yes, used to determine the outer block's return value**    |
| 2-4  | inner block execution                               | Element within each sub-array                            | None                                              | An integer                                    | **Yes, used by inner `map` for transformation**              |
| 3    | method call (` * `) with integer `2` as an argument | Element within each sub-array                            | None                                              | An integer                                    | Yes, used to determine inner block's return value            |



#### Example 6

```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
    hash.all? do |key, value|
        value[0] == key.to_s
    end
end
# => [{ :c => "cat" }]
```

| Line | <u>Action</u>         | <u>Object</u> (object that action is being performed on)     | <u>Side Effect</u> (output or destructive action) | <u>Return Value</u> (of that action)         | <u>Is Return Value Used</u>? (by whatever instigated the action) |
| :--- | --------------------- | ------------------------------------------------------------ | ------------------------------------------------- | -------------------------------------------- | ------------------------------------------------------------ |
| 1    | method call `select`  | Array of hashes `[{ a: 'ant', b: 'elephant' }, { c: 'cat' }]` | None                                              | `[{:c => 'cat'}]`                            | No                                                           |
| 1-5  | outer block execution | Each hash in the array                                       | None                                              | **Boolean** - `false` and then `true`        | Yes, `select` will use the <u>truthiness of the outer block's return value</u> |
| 2    | method call `all?`    | Each hash in the array                                       | None                                              | **Boolean** - `false` and then `true`        | Yes, used to determine the <u>outer block's return value</u> |
| 2-4  | inner block execution | Each **key/value pair** in a hash                            | None                                              | **Boolean** - `true` `false` and then `true` | Yes, used to determine the <u>return value of `all?`</u> *(Note: hash.all? will only return true if the inner block never returns false or nil)* |
| 3    | comparison  (`==`)    | Each **key/value pair** in a hash                            | None                                              | Boolean                                      | Yes, used to determine inner block's return value            |
| 3    | method call (`to_s`)  | Each **key** of a key/value pair in a hash                   | None                                              | String representation of the key             | Yes, used in comparison operation                            |
|      |                       |                                                              |                                                   |                                              |                                                              |

- `all?` - enumerable method used to check if <u>all the strings inside an array have a specific size</u>
  - returns `true` or `false`
- `all?` will return `true` if the block passed to it never returns a value of `false` or `nil` for every key/value pair in the hash
  - We're using `value[0] == key.to_s` to test whether **ALL keys** match the first letter of all their associated values
  - only hash that meets this criteria is `{:c => 'cat'}`, and the return value is an array.
- If we used `any?`...
  - **Both** hashes would meet that criteria 
  - Return value would be `[{:a=>"ant", :b=>"elephant"}, {:c=>"cat"}]`



#### Example 7

- Say for example we have an array of nested arrays which contain <u>numeric strings</u> and we want to <u>sort the outer array</u> so that the **inner arrays are ordered** according to the ***numeric value*** of the strings they contain 

- ```ruby
  arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
  ```

- We know that we want to sort at the level of the outer array, **but we can't simply call `sort` on it.** When sorting nested arrays it is important to understand that there are **two** sets of comparison happening:

  1.  Each of the inner arrays is compared with the other inner arrays.
  2. The way those inner arrays are compared is by <u>comparing the *elements* within them</u> ([the documentation](http://ruby-doc.org/core/Array.html#method-i-3C-3D-3E) refers to this as comparing in an 'element-wise' manner)

- Because the elements in the arrays are strings, **by calling `sort` it is string order** which will ultimately **determine array order**:

  ```ruby
  arr.sort # => [["1", "8", "11"], ["1", "8", "9"], ["2", "12", "15"], ["2", "6", "13"]]
  ```

  - Since strings are compared character by character **this doesn't give us a *numerical* comparison**. In order to achieve this we have to **<u>perform some transformation on the inner arrays prior to comparing them.</u>**
    - <u>Note: In the above code they're being compared **CHARACTER BY CHARACTER, NOT NUMBER BY NUMBER**. 

    - So with "12", the "1" and next array's "6" get compared as opposed to the whole "12" at once.</u>

      

- **<u>THE SOLUTION</u>: <u>Transform the inner array elements to integers:</u>**

  ```ruby
  arr.sort_by do |sub_arr|
  	sub_arr.map do |num|
          num.to_i
      end
  end
  # => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]
  ```

- The key here is understanding that when we carry out transformation within a `sort_by` block, the **<u>transformed elements are what are then used to perform the  comparison</u>**. **As long as what is returned by the block is comparable** *(in this case, the outer block returns the transformed sub-arrays)*, we can perform whatever transformation we need to within the block -  including nesting other method calls within it.



#### Example 8

- It can be tricky to work with different objects in nested array if you want to <u>only select nested elements based on certain criteria</u>

- For example, take the 2-element array below, where we only want to select integers greater than 13 but strings less than 6 characters.

  - The trick here is that the elements are in a **two layer nested array data structure**.

- ```ruby
  [[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
      arr.select do |item|
          if item.to_s.to_i == item 		# if it's an integer
              item > 13
          else
              item.size < 6
          end
      end
  end
  ```

- At first you might think to reach for the `select` method to perform selection, but since we're working with a nested array, that won't work

- We first need to **access the nested arrays before we can select the value we want**

  - In order to select the specified values in the requirement, we need to first determine if an element is an integer; there are lots of ways to do this, we just went with the imperfect `item.to_s.to_i == item` test.

- One of the **main reasons `map` is used** in this example is <u>not only to iterate over the array and access the nested arrays</u>, but to **return a new array containing the selected values**. If we used `each` instead we wouldn't have the desired return value, and would need an extra variable to collect the desired results.

  

#### Example 9

- This example contains a **triple-level nested array**. Take your time and  try to break down each component. Hint: the <u>top-level array is a  2-element array</u>.

```ruby
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]

```

- **<u>partition()</u>** -- The **partition()** of **enumerable** is an inbuilt method in [Ruby](https://www.geeksforgeeks.org/ruby-programming-language-introduction/) returns two arrays, one containing the <u>elements of the enumerable which return true</u>, while the other contains the elements which returns false. It returns an enumerator if no block is passed.

- There are a total of 6 places where a return occurs: 3 methods (`map`, `each`, and `partition`) and 3 blocks (one for each method).

- If we understand `each`, we know that it doesn't care about the block's return value and it always returns the calling object. Therefore, just by looking at line 2, we can already say that the **return value of `map`** will be a **new array that matches the value of the calling object**

  - This is because line 2's `each` will determine the return value of the outermost block. The outermost block's return value (which will be the original calling object), in turn, determines `map`'s return value. Thus, `map`'s return value will be a new array that matches the value of the calling object.

    

#### Example 10

- Let's say we have the following data structure of nested arrays and we  want to increment every number by 1 <u>without changing the data structure.</u>

- ```ruby
  [[[1, 2], [3, 4]], [5, 6]].map do |arr|
    arr.map do |el|
      if el.to_s.size == 1    # it's an integer
        el + 1
      else                    # it's an array
        el.map do |n|
          n + 1
        end
      end
    end
  end
  
  ```

| Line | <u>Action</u>                                       | <u>Object</u> (object that action is being performed on)     | <u>Side Effect</u> (output or destructive action) | <u>Return Value</u> (of that action)                         | <u>Is Return Value Used</u>? (by whatever instigated the action) |
| :--- | --------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 1    | method call `map`                                   | Calling object (original object) `[[[1, 2], [3, 4]], [5, 6]]` | None                                              | New transformed array `[[[2, 3], [4, 5]], [6, 7]]`           | No                                                           |
| 1-11 | outer block execution                               | The two inner arrays of the outer array ``[[1, 2], [3, 4]]` and `[5, 6]` | None                                              | 2 new transformed sub-arrays `[[2, 3], [, 5]]` and `[6, 7]`  | Yes, used to determine return value of `map`                 |
| 2    | method call `map`                                   | The two inner arrays of the outer array ``[[1, 2], [3, 4]]` and  `[5, 6]` | None                                              | 2 new transformed sub-arrays `[[2, 3], [4, 5]]` and `[6, 7]` | Yes, used to determine return value of the outer block       |
| 2-10 | inner block execution                               | Each element of the two sub-arrays                           | None                                              | **An Integer?**                                              | Yes, used to determine return value of `map` non line 2      |
| 3    | comparison `==`                                     | Element of the sub-array                                     | None                                              | Boolean                                                      | Yes, evaluated by `if` statement                             |
| 3-9  | conditional `if`                                    | Each element of the 2 sub-arrays                             | None                                              | **Integer** (regardless of whether the elements of the sub-arrays are <u>arrays themselves</u> or <u>integers</u> | Yes, used to determine return value of inner block           |
| 3    | method call `to_s`                                  | Each element of the 2 sub-arrays                             | **None**                                          | String representation of element                             | Yes, used by each element of  the sub-arrays                 |
| 3    | method call `size`                                  | Each element of the 2 sub-arrays                             | **None**                                          | An integer                                                   | Yes, used by each element of  the sub-arrays                 |
| 4    | method call ( `+` ) with integer `1` as an argument | **Integer** **element** of the sub-array                     | None                                              | An integer                                                   | Yes, used to determine return value of `if` statement        |
| 6    | method call `map`                                   | Sub-array that is a nested array (composed of array elements)`[[1, 2], [3, 4]]` | None                                              | New transformed array `[[2, 3], [4, 5]]`                     | Yes, used to determine the return value of the inner block   |
| 6-8  | inner INNER block execution                         | **Integer element** of the nested sub-array                  | None                                              | **An integer**                                               | Yes, used to determine return value of `map` on line 6       |
| 7    | method call ( + ) with integer `1` as an argument   | **Integer element** of the nested sub-array                  | None                                              | An integer                                                   | Yes, used to determine return value of `if` statement        |
|      |                                                     |                                                              |                                                   |                                                              |                                                              |

  - **<u>Final Return Value</u>**: `[[[2, 3], [4, 5]], [6, 7]]`  

    

    ### Mutating Collections While Iterating

    <u>*Do not mutate the collection that you're iterating through.*</u>  Since iteration is the basis of selection and transformation, that  implies don't mutate the collection while you're performing selection or transformation or pretty much any action on the collection.

    What NOT to do:

    ```ruby
    # The method remove_evens! should delete all even numbers from the array passed in as the argument.
    
    def remove_evens!(arr)
      arr.each do |num|
        if num % 2 == 0
          arr.delete(num)
        end
      end
      arr
    end
    
    p remove_evens!([1,1,2,3,4,6,8,9])
    # expected return value [1, 1, 3, 9]
    # actual return value [1, 1, 3, 6, 9]
    ```

  - The `Array#delete` method is destructive, and is changing the contents of `arr` during iteration.

  - One way you could fix the code above is to **create a shallow copy of the array** and **iterate through it while mutating the original array.**

    ```ruby
    def remove_evens!(arr)
      cloned_arr = arr.dup
      cloned_arr.each do |num|
        if num % 2 == 0
          arr.delete(num)
        end
      end
      arr
    end
    ```





# Lesson 6

### <u>Pry</u>

- Using `binding.pry` 

  - A **binding** is something that contains references to any variables that were in scope at the point where it was created

  - The state of the program at the point of its execution ??

  - **pry** interrupts the program execution and ***pries open*** the binding so that we can have a look around

  - The binding have access to variables in its scope on lines below it...?

    - "Not having access to variable assignments that come below it"'

  - ```ruby
    def my_method(num)
        a = 1
        binding.pry
        b = 2
    end
    
    c = 3
    
    In pry...
        a => 1
    	b => nil  --- Although it can access the variable, it can't access the assignment of 2
    	c => NameError because it's outside the scope of the method, the binding can't acces the variable
    ```

- Important: DON'T puts binding.pry at the bottom of a block or at the bottom of a method, or else the block/method will return `nil`

- **Pry is also good for debugging looping structures, because you can exit the pry session and you'll get to the NEXT loop's pry session**

  



## METHOD DESCRIPTION AND EXAMPLES

1. `String#each_char` 

   - Passes [each](https://apidock.com/ruby/String/each) character in *str* to the given block, or returns an enumerator if no block is given.

     ```ruby
     "hello".each_char {|c| print c, ' ' }
     ```

     *produces:*

     ```ruby
     h e l l o
     ```

2. `Array#unshift`

   - Prepends objects to the front of `self,` moving other elements upwards. See also [Array#shift](https://apidock.com/ruby/Array/shift) for the opposite effect.

     ```ruby
     a = [ "b", "c", "d" ]
     a.unshift("a")   #=> ["a", "b", "c", "d"]
     a.unshift(1, 2)  #=> [ 1, 2, "a", "b", "c", "d"]
     ```

3. `Integer#divmod`

   - returns the integer quotient and modulus after performing the division.

     ```ruby
     11.divmod(3)        #=> [3, 2]
     11.divmod(-3)       #=> [-4, -1]
     11.divmod(3.5)      #=> [3, 0.5]
     (-11).divmod(3.5)   #=> [-4, 3.0]
     11.5.divmod(3.5)    #=> [3, 1.0]
     ```
     
     ```ruby
     DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
     
     def integer_to_string(number)
         result = ''
         loop do
             number, remainder = number.divmod(10)
             # e.g. 432, 1 = 4321.divmod(10)
             result.prepend(DIGITS[remainder])
             # ''.prepend(DIGITS[1]) => ''.prepend('1')=> '1'
             breaks if number == 0
             # 0, 1 = 1.divmod(10)
         end
         result
     end
     
     integer_to_string(4321) == '4321'
     integer_to_string(0) == '0'
     integer_to_string(5000) == '5000'
     
     # NOTE: String#prepend is a MUTATING METHOD, this is bc there is no non-mutating form of prepend
     ```
     
     

4. `Integer#times`

   - Iterates the given block `int` times, passing in values from zero to int - 1.

     ```ruby
     5.times {|i| print i, " " }   #=> 0 1 2 3 4
     ```

   - Another example - adding two cards from deck to player_cards and dealer_cards.

     ```ruby
     deck = [['A', '2'], ['B', '3'], ... ]]
     player_cards = []
     dealer_cards = []
     
     2.times do
         player_cards << deck.pop
         dealer_cards << deck.pop
     end
     ```
   
5. `reduce` or `inject`

   - The `reduce` method can be used to take an array and reduce it to a single value.

   - Combines all elements of an array by applying a binary operation (In [mathematics](https://en.wikipedia.org/wiki/Mathematics), a **binary operation** or **dyadic operation** is a calculation that combines two elements (called [operands](https://en.wikipedia.org/wiki/Operands)) to produce another element)

     - This operation is specified by a block:

       ```ruby
       sum = numbers.reduce { |sum, number| sum + number }
         sum / numbers.count
       ```

     - or symbol:

       ```ruby
       numbers.reduce(:+)
       ```

6. Float division

   - 4 ways to do Float division

   ```ruby
   # foo and bar are both Integer values.
   
   # Coerce both operands to Float.
   foo.to_f / bar.to_f
   # Coerce only left one.
   foo.to_f / bar
   # Coerce only the right one.
   foo / bar.to_f
   # Use the dedicated fdiv method.
   foo.fdiv(bar)
   
   ```

7. `String#delete`

   - Returns a **copy** of *str* (new string) with all characters in the intersection of its arguments deleted.

   - `String#delete` to return a **new** `String` with all spaces removed from it.

     ```ruby
     'hi there mate'.delete(' ')
     # ==> 'hitheremate'
     ```

8. `String#delete!`

   - Mutates the original string

5. `<=>` 

   - **Spaceship operator**

   - It compares the left side against the right side, then returns +1 if the left side is greater than the right, -1 if the left side is smaller  than the right, and 0 if the values are the same. 

   - This is often useful when you need to know whether a number is positive, negative, or zero.

     ```ruby
     def signed_integer_to_string(number)
       case number <=> 0
       when -1 then "-#{integer_to_string(-number)}"
       when +1 then "+#{integer_to_string(number)}"
       else         integer_to_string(number)
       end
     end
           
     signed_integer_to_string(4321) == '+4321'
     signed_integer_to_string(-123) == '-123'
     signed_integer_to_string(0) == '0'
     ```

6. `Enumerable#reduce/inject`

   ```ruby
   numbers = [1, 2, 3, 4]
   
   sum = numbers.reduce { |sum, number| sum + number }
   # OR
   sum = numbers.reduce(:+)
   ```

7. `&:`

   - Shorthand that can allow you to use `map` (iterate and change the return value) **without using a block**

     ```ruby
     def sum(integer)
         integer.to_s.chars.map(&:to_i).reduce(:+)
     end
     
     # Same as...
     
     def sum2(integer)
         sum = 0
         str_digits = number.to_s.chars
         
         str_digits.each do |str_digit|
             sum += str_digit.to_i
         end
         
         sum
     end
     ```

   - <u>Example 2</u> - Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

     ```ruby
     def word_cap2(words)
       words.split.map(&:capitalize).join(' ')
     end
     
     # Same as...
     
     def word_cap(string)
       new_word_array = string.split.map do |word|
         word = word.capitalize
       end
       new_word_array.join(' ')
     end
     ```

   

   
8. **STRIPPING NON-ALPHABETIC CHARACTERS FROM STRING**

   - Using `gsub`

   ```ruby
   string = 'wer,,^WER'
   string.gsub!(/[^a-z]/i, '')
   # => "werWER"
   
   # Meaning: Matches the case-insensitive letters that are NOT a-z, replaces them with '' (nothing)
   # Note: ^ --> not 
   # Note: /i --> case insensitive
   ```

   - Using `delete`

   ```ruby
   word =' rhwer,,,2e'
   word.delete!('^A-Za-z')
   
   => "rhwere"
   ```

   

9. `Array#reverse_each` 

   - reverse_each is like each, except it processes the elements in reverse order. Note that unlike each, reverse_each only applies to Arrays.

     ```ruby
     def reverse2(array)
       result_array = []
       array.reverse_each { |element| result_array << element }
       result_array
     end
     
     p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
     ```

10. `Array#|`

    - This is a method that gives the set union of two arrays, so the result contains no duplicates

      ```ruby
      def merge2(array_1, array_2)
        array_1 | array_2
      end
      
      p merge2([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
      ```

11. `Array#slice`

    - `slice` takes two arguments: the first one is the starting index and the second one is the length of the slice. 

      ```ruby
      def halvsies(array)
        middle = (array.size / 2.0).ceil
        first_half = array.slice(0, middle)
        second_half = array.slice(middle, array.size - middle)
        [first_half, second_half]
      end
      
      halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
      ```

12. `Array#find_index/index`

    -  `find_index` returns the **index number of the found element**, which will always have a truthy value, or `nil` if no such element is present

    - It can scan an array for the first element that has the specified value

      ```ruby
      a = [1, 2, 3]
      a.find_index(2)
      
      # => 1
      ```

13. ###   <u>**Round result to 3 decimal places**</u>

    - Use : `result = 234.42345`
    - `format('%.3f', result)`

    ```ruby
    def show_multiplicative_average2(numbers)
      product = 1.to_f
      numbers.each { |number| product *= number }
      average = product / numbers.size
      puts "The result is #{format('%.3f', average)}"
    end
    
    show_multiplicative_average2([3, 5])                # => The result is 7.500
    show_multiplicative_average2([6])                   # => The result is 6.000
    show_multiplicative_average2([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
    ```

14. `Array#delete`

    - Mutates the array, **<u>which is why there is no array#delete!</u>**

    - ```ruby
      a = [1, 2, 3]
      a.delete(1)
      # => a = [2, 3]
      
      a.delete(1)
      # => NOMETHOD ERROR
      ```

      



>>>>>>> 83ec7157a96f4eba5305512f2159c065f0bbb902






## Assignment: Twenty-One Extra Features

- @variables are called instance variables in ruby. Which means you can access these variables in ANY METHOD inside the class



<u>Outlook PW</u>

pziegler9@outlook.com

nfF745dpWHiE8sH

---------------------------------------

<u>offensive security account</u> password: gWzMq3cML7KZFgK

pziegler9@gmail.com

username: mr_thoughtless