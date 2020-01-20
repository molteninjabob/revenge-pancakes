require 'byebug'

class Waiter
    ####################################
    #
    # Rules for Flipping Pancakes
    #
    # Carefully lift up some number of pancakes (possibly all of them) from
    # the top of the stack, flip that entire group over, and then put the group 
    # back down on top of any pancakes that you did not lift up. When flipping 
    # a group of pancakes, you flip the entire group in one motion; you do not
    #  individually flip each pancake. Formally: if we number the pancakes 
    # 1, 2, ..., N from top to bottom, you choose the top i pancakes to flip. 
    # Then, after the flip, the stack is i, i­1, ..., 2, 1, i+1, i+2, ..., N. 
    # Pancakes 1, 2, ..., i now have the opposite side up, whereas pancakes 
    # i+1, i+2, ..., N have the same side up that they had up before.
    #
    #     For example, let's denote the happy side as + and the blank side as -­.
    # Suppose that the stack, starting from the top, is ­­+­. One valid way to 
    # execute the maneuver would be to pick up the top three, flip the entire 
    # group, and put them back down on the remaining fourth pancake (which would 
    # stay where it is and remain unchanged). The new state of the stack would 
    # then be ­++­. The other valid ways would be to pick up and flip the top one, 
    # the top two, or all four. It would not be valid to choose and flip the middle 
    # two or the bottom one, for example; you can only take some number off the top.

    # You will not serve the customer until every pancake is happy side up, 
    # but you don't want the pancakes to get cold, so you have to act fast! 
    # What is the smallest number of times you will need to execute the maneuver 
    # to get all the pancakes happy side up, if you make optimal choices?
    # 
    ####################################

    attr_reader :stack, :flips

    def initialize(stack)
        raise 'The size of the pancake stack must be between 1 and 100. Please try again.' if stack.length < 1 || stack.length > 100
        raise "Only the characters '+' and '-' are allowed in the stack. Please try again." unless stack.match /\A[+-]*\z/
        @stack = stack
        @flips = 0
    end

    def rearrange_stack
        # Every time we make a flip, we have to re-evaluate to see if there are any not facing up.
        # Keep looping until all pancakes are facing up (@stack does not include '-')
        loop do
            # if there are no '+' chars in the array, flip the entire stack
            flip(@stack.length) if !@stack.chars.include? '+'
            
            # if there are no '-' chars in the array, exit loop (all pancakes are smileys up!)
            return @flips if !@stack.chars.include? '-'

            # Loop through each pancake in the stack to see if they are all facing the same way
            @stack.chars.each_with_index do |char, index|
                next_pancake = @stack.chars[index + 1]
                
                # If the value of this pancake is not the same as the next, flip the stack at this position
                if next_pancake != char && !next_pancake.nil?
                    flip(index + 1)
                    break
                end
            end
        end
    end

    # Flip: 
    #   1. Separate the stack at the given position
    #   2. Change the value of each pancake(char) in the group being flipped
    #   3. Push the group back on to the front (top) of the stack in reverse order
    def flip(position)
        # Separate the stack at the given position
        group = @stack.chars.slice(0, position)
        @stack = @stack[position..-1]

        # Change the value of each pancake being flipped and prepend in reverse order
        group.each_with_index do |char, index|
            new_char = char == '+' ? '-' : '+'
            @stack.prepend(new_char)
        end

        # Increment the total # of flips
        @flips += 1
    end
end