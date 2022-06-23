require "byebug"

=begin
Write a method no_dupes?(arr) that accepts an array as an arg and returns an new array containing the elements that were not repeated in the array.
=end

def no_dupes?(arr)
    arr.tally.select {|k, v| v == 1}.keys

end

# Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

=begin
Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. The method should return true if an element never appears consecutively in the array; it should return false otherwise.
=end

def no_consecutive_repeats?(arr)
    arr.each_with_index {|ele, i| return false if arr[i] == arr[i + 1]}
    true
    
end

# Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

=begin
Write a method char_indices(str) that takes in a string as an arg. The method should return a hash containing characters as keys. The value associated with each key should be an array containing the indices where that character is found.

=end

def char_indices(str)
    newhash = Hash.new {|h, k| h[k] = []}

    str.each_char.with_index {|char, i| newhash[char] << i}

    newhash
end

# Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

=begin
Write a method longest_streak(str) that accepts a string as an arg. The method should return the longest streak of consecutive characters in the string. If there are any ties, return the streak that occurs later in the string.
=end

def longest_streak(str)
    i = 0
    j = 0

    longeststr = ""

    while (j <= str.length) # must catch the nil character case to get the final count
        if str[i] != str[j]
            longeststr = j - i >= longeststr.length ? str[i...j] : longeststr
            i = j
        end
        j += 1
    end

    longeststr

end

# Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'    

=begin
Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean indicating whether or not the number is a bi-prime. A bi-prime is a positive integer that can be obtained by multiplying two prime numbers.

For Example:

14 is a bi-prime because 2 * 7
22 is a bi-prime because 2 * 11
25 is a bi-prime because 5 * 5
24 is not a bi-prime because no two prime numbers have a product of 24
=end

def bi_prime?(num)
    return PrimeFactorize(num).length == 2
end

def PrimeFactorize(num)
    return [] if num == 1

    (2..num).each do |n|
        return [n] + PrimeFactorize(num/n) if num % n == 0
    end

end

# Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

=begin
A Caesar cipher takes a word and encrypts it by offsetting each letter in the word by a fixed number, called the key. Given a key of 3, for example: a -> d, p -> s, and y -> b.

A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence of keys is used. For example, if we encrypt "bananasinpajamas" with the key sequence [1, 2, 3], then the result would be "ccqbpdtkqqcmbodt":

# Message:  b a n a n a s i n p a j a m a s
# Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Result:   c c q b p d t k q q c m b o d t
Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args, returning the encrypted message. Assume that the message consists of only lowercase alphabetic characters.

=end
def ciphe(char, shift)
    letternumber = char.ord - "a".ord
    newletternumber = (letternumber + shift) % 26

    return (newletternumber + "a".ord).chr
end

def vigenere_cipher(str, arr)
=begin
    Input: string and array of integers
    Output: string

    Plan: Make helper function that substitutes each letter with the new letter

    ciphe(char, shift)

    Iterate through string. For each character, call helper function. shift will be
    arr[i % arr.length]

=end

    str.split('').map.with_index {|char, i| ciphe(char, arr[i % arr.length])}.join('')
end


# # Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

=begin
Write a method vowel_rotate(str) that accepts a string as an arg and returns the string where every vowel is replaced with the vowel that appears before it sequentially in the original string. The first vowel of the string should be replaced with the last vowel.

=end

def vowel_rotate(str)

=begin
    Input: string
    Output: string

    Plan: 
=end

    vowelsinorder  = str.scan(/[aeiou]/)
    vowelindex = -1

    str.split('').map do |char|
        if(!char.match?(/[aeiou]/))
            char
        else            
            vowelindex += 1
            vowelsinorder[vowelindex - 1]
        end
    end.join('')

end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"


class String

    def select(&prc)
        prc ||= Proc.new{|char| false} # this is not map, this is select. return boolean

        self.split('').select(&prc).join('')
    end
end

# Examples
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

=begin
Extend the string class by defining a String#map! method that accepts a block. The method should modify the existing string by replacing every character with the result of calling the block, passing in the original character and it's index. Do not use the built-in Array#map or Array#map! in your solution.
=end

class String

    def map!(&prc)
        self.each_char.with_index do |char, i|
            self[i] = prc.call(char, i)
        end

    end

end

# # Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

=begin
Write a method multiply(a, b) that takes in two numbers and returns their product.

You must solve this recursively (no loops!)
You must not use the multiplication (*) operator
=end

def multiply(a, b)
    return 0 if (a == 0 || b == 0)

    if(a > 0)
        return b + multiply(a - 1, b)
    else
        return - b + multiply(a + 1, b) # add a negative number of b's so flip sign of b to add
    end

end

# Examples
# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

=begin
The Lucas Sequence is a sequence of numbers. The first number of the sequence is 2. The second number of the Lucas Sequence is 1. To generate the next number of the sequence, we add up the previous two numbers. For example, the first six numbers of the sequence are: 2, 1, 3, 4, 7, 11, ...

Write a method lucasSequence that accepts a number representing a length as an arg. The method should return an array containing the Lucas Sequence up to the given length. Solve this recursively.
=end

def lucas_sequence(n)
    return [] if n == 0
    return [2] if n == 1
    return [2, 1] if n == 2
    # add arrays to concat. Notice that we only needed to reference the previous iteration, not
    # the previous two.
    return lucas_sequence(n-1) + [lucas_sequence(n - 1)[-2] + lucas_sequence(n - 1)[-1]]

end

# # Examples
# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

# prime_factorization is done already but named as PrimeFactorize