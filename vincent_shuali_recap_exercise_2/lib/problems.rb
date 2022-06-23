# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    return num_1*num_2/greatest_common_factor(num_1, num_2)

end

def greatest_common_factor(num_1, num_2)
    (2..[num_1, num_2].min).each do |n|
        return n*greatest_common_factor(num_1/n, num_2/n) if (num_1 % n == 0 && num_2 % n == 0)
    end

    return 1
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigramsarray = (0..str.length - 1).map{|i| str[i..i+1]}
    bigramshasharray = bigramsarray.tally.to_a

    maxbigram = bigramshasharray.inject {|acc, curr| curr[1] > acc[1] ? curr : acc}
    maxbigram[0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse

        newhash = Hash.new

        self.each_pair {|k, v| newhash[v] = k}

        newhash

    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        sortedarray = self.sort

        i = 0
        j = sortedarray.length - 1

        count = 0

        while (i < j)
            if((sortedarray[i] + sortedarray[j] <=> num) == 1)
                j -= 1
            elsif((sortedarray[i] + sortedarray[j] <=> num) == 0)
                count += 1
                i += 1
                j -= 1
            else
                i += 1
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)

        prc ||= Proc.new {|e1, e2| e1 <=> e2}

        doneness = false

        maxbound = self.length - 1

        while(!doneness)
            doneness = true 
            (0...maxbound).each do |i|
                if(prc.call(self[i], self[i + 1]) == 1)
                    self[i], self[i + 1] = self[i + 1], self[i]
                    doneness = false
                end
            end
            maxbound -= 1

        end

        self

    end
end
