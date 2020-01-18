require_relative 'lib/waiter'

stack = '-'
waiter = Waiter.new(stack)
flips = waiter.rearrange_stack
puts "#{stack} | Case #1: #{flips}"

stack = '-+'
waiter = Waiter.new(stack)
flips = waiter.rearrange_stack
puts "#{stack} | Case #2: #{flips}"

stack = '+-'
waiter = Waiter.new(stack)
flips = waiter.rearrange_stack
puts "#{stack} | Case #3: #{flips}"

stack = '+++'
waiter = Waiter.new(stack)
flips = waiter.rearrange_stack
puts "#{stack} | Case #4: #{flips}"

stack = '--+-'
waiter = Waiter.new(stack)
flips = waiter.rearrange_stack
puts "#{stack} | Case #5: #{flips}"

stack = '-+---+-+-'
waiter = Waiter.new(stack)
flips = waiter.rearrange_stack
puts "#{stack} | Case #6: #{flips}"

stack = '--+-++-++'
waiter = Waiter.new(stack)
flips = waiter.rearrange_stack
puts "#{stack} | Case #7: #{flips}"

stack = '-+-+-+-+-'
waiter = Waiter.new(stack)
flips = waiter.rearrange_stack
puts "#{stack} | Case #8: #{flips}"

stack = '+-+-+-+-+-'
waiter = Waiter.new(stack)
flips = waiter.rearrange_stack
puts "#{stack} | Case #9: #{flips}"

stack = '+-+-+-------+--+-'
waiter = Waiter.new(stack)
flips = waiter.rearrange_stack
puts "#{stack} | Case #10: #{flips}"

stack = '++--++--++--++--++--'
waiter = Waiter.new(stack)
flips = waiter.rearrange_stack
puts "#{stack} | Case #11: #{flips}"

stack = '++--++--++--++--++--+--+----+-++-+++++---+-++-+-'
waiter = Waiter.new(stack)
flips = waiter.rearrange_stack
puts "#{stack} | Case #12: #{flips}"

stack = '++--++--+-++--++--+-++--++--+-++--++--+-++--++--+-' \
        '++--++--+-++--++--+-++--++--+-++--++--+-++--++--+-'
waiter = Waiter.new(stack)
flips = waiter.rearrange_stack
puts "#{stack} | Case #13: #{flips}"