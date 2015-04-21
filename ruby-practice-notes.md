# Notes from Ruby practice problems

## inject
* Iterating through hash values with inject
<code>hash.inject(...) { |collector, value| ... }</code> iterates through a hash where <code>value = (key, value)</code>.  Therefore, for the sake of calarity, its better to use the syntax.
<code>hash.inject(...) {|collector, key, value| ... }</code>

## modifier methods
* don't have to include self in instances like the one below
<code>
  class Something
    def sum1
      self.inject(:+)
    end

    def sum2 #same funcitonality
      inject(:+)
    end
</code>


## Symbol#to_proc
* ability to pass calls through map command without being so verbose. See example below:
<code>
  array.map(&:to_i)
</code>

The ampersand, tells the map function to expect a block to be passed in.  In ruby, <code>:to_i</code> is a symbol representing <code>to_i</code>, and symbols have an implicit method "to_proc".  When the called, the symbol is converted into a proc which is called by <code>map</code>.

## p vs puts
<code>p object</code> is equivalent to <code>puts object.inspect</code>


## sorting with regex selection
* Problem requires sorting twice with based on seperate parts of a string.  String lengths change, so its not optimal to use indecies.  Inputs of form <code>["name-yymm",...]</code> are given.

* .sort_by function is used in conjunction with regular expressions to pull out name and numbers for each sort.

<code>
regex = /[A-z]+/
array.sort_by {|x| x[regex] }
</code>

* ruby's sort_by method will automatically sort based on the values of a sub-array. The example code sorts by date(yymm) and then name:

<code>
array = ["name-yymm"]
array.sort_by { |item| item.split("-").reverse }
</code>


## Hashtag content algorithm
* Regex used to select words that start with any number of "#" but only contain alphabet characters.
<code>/[#+]/</code>  Starts with any number of "#" characters


## define_method
* can be used to create dynamic class methods based on variables.








