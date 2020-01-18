require "rspec/autorun"
require_relative '../lib/waiter'
 
describe Waiter do
    include RSpec::Matchers

    it "rearranges a '-' pancake stack with one flip" do
        stack = '-'
        waiter = Waiter.new(stack)
        flips = waiter.rearrange_stack
        puts "Case #1: #{flips}"
        expect(flips).to equal(1)
    end

    it "rearranges a '-+' pancake stack with one flip" do
        stack = '-+'
        waiter = Waiter.new(stack)
        flips = waiter.rearrange_stack
        puts "Case #2: #{flips}"
        expect(flips).to equal(1)
    end

    it "rearranges a '+-' pancake stack with two flips" do
        stack = '+-'
        waiter = Waiter.new(stack)
        flips = waiter.rearrange_stack
        puts "Case #3: #{flips}"
        expect(flips).to equal(2)
    end

    it "rearranges a '+++' pancake stack with no flips" do
        stack = '+++'
        waiter = Waiter.new(stack)
        flips = waiter.rearrange_stack
        puts "Case #4: #{flips}"
        expect(flips).to equal(0)
    end

    it "rearranges a '--+-' pancake stack with three flips" do
        stack = '--+-'
        waiter = Waiter.new(stack)
        flips = waiter.rearrange_stack
        puts "Case #5: #{flips}"
        expect(flips).to equal(3)
    end

    it "rearranges a '-+---+-+-' pancake stack with seven flips" do
        stack = '-+---+-+-'
        waiter = Waiter.new(stack)
        flips = waiter.rearrange_stack
        puts "Case #6: #{flips}"
        expect(flips).to equal(7)
    end

    it "rearranges a '--+-++-++' pancake stack with five flips" do
        stack = '--+-++-++'
        waiter = Waiter.new(stack)
        flips = waiter.rearrange_stack
        puts "Case #7: #{flips}"
        expect(flips).to equal(5)
    end

    it "rearranges a '-+-+-+-+-' pancake stack with nine flips" do
        stack = '-+-+-+-+-'
        waiter = Waiter.new(stack)
        flips = waiter.rearrange_stack
        puts "Case #8: #{flips}"
        expect(flips).to equal(9)
    end

    it "rearranges a '+-+-+-+-+-' pancake stack with ten flips" do
        stack = '+-+-+-+-+-'
        waiter = Waiter.new(stack)
        flips = waiter.rearrange_stack
        puts "Case #9: #{flips}"
        expect(flips).to equal(10)
    end

    it "rearranges a '+-+-+-------+--+-' pancake stack with ten flips" do
        stack = '+-+-+-------+--+-'
        waiter = Waiter.new(stack)
        flips = waiter.rearrange_stack
        puts "Case #10: #{flips}"
        expect(flips).to equal(10)
    end

    it "rearranges a '++--++--++--++--++--' pancake stack with ten flips" do
        stack = '++--++--++--++--++--'
        waiter = Waiter.new(stack)
        flips = waiter.rearrange_stack
        puts "Case #11: #{flips}"
        expect(flips).to equal(10)
    end

    it "rearranges a '++--++--++--++--++--+--+----+-++-+++++---+-++-+-' pancake stack with 26 flips" do
        stack = '++--++--++--++--++--+--+----+-++-+++++---+-++-+-'
        waiter = Waiter.new(stack)
        flips = waiter.rearrange_stack
        puts "Case #12: #{flips}"
        expect(flips).to equal(26)
    end

    it "successfully rearranges if the stack size is equal to 100" do
        stack = '++--++--+-++--++--+-++--++--+-++--++--+-++--++--+-' \
        '++--++--+-++--++--+-++--++--+-++--++--+-++--++--+-'
        waiter = Waiter.new(stack)
        flips = waiter.rearrange_stack
        puts "Case #13: #{flips}"
        expect(flips).to equal(60)
    end

    it "raises an error if the stack size is less than 1" do
        stack = ''
        expect{ Waiter.new(stack) }.to raise_error(RuntimeError)
    end

    it "raises an error if the stack size is greater than 100" do
        stack = '++--++--++--++--++--+--+----+-++-+++++---+-++-+-++--++--++--++--++--+--+----+-++-+++++--' \
        '-+-++-+-++--++--++--++--++--+--+----+-++-+++++---+-++-+-++--++--++--++--++--+--+----+-++-+++++--' \
        '-+-++-+-++--++--++--++--++--+--+----+-++-+++++---+-++-+-'
        expect{ Waiter.new(stack) }.to raise_error(RuntimeError)
    end

    it "raises an error if the stack contains alpha chars other than + or -" do
        stack = '++--++-d-+'
        expect{ Waiter.new(stack) }.to raise_error(RuntimeError)
    end

    it "raises an error if the stack contains num chars other than + or -" do
        stack = '++-9-++--+'
        expect{ Waiter.new(stack) }.to raise_error(RuntimeError)
    end

    it "raises an error if the stack contains num chars other than + or -" do
        stack = '++--++$--+'
        expect{ Waiter.new(stack) }.to raise_error(RuntimeError)
    end
end