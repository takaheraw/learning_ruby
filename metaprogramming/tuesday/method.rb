class MyClass
  def my_method1(my_arg)
    my_arg * 2
  end

  define_method :my_method2 do |my_arg|
    my_arg * 3
  end
end
obj = MyClass.new
obj.send(:my_method1, 5) # => 10
obj.send(:my_method2, 5) # => 15

class Lawyer
  def method_missing(method, *args)
    puts "#{method}(#{args.join(',')})を呼び出した"
    puts "(ブロックを渡した)" if block_given?
  end
end
bob = Lawyer.new
bob.talk_simple('a', 'b')
bob.talk_simple('c', 'd') do

end

class Roulette
  def method_missing(name, *args)
    person = name.to_s.capitalize
    super unless %w[Bob Frank Bill].include? person
    number = 0
    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end
    "#{person} got a #{number}"
  end
end
number_of = Roulette.new
puts number_of.bob
puts number_of.frank

require 'benchmark'

class String
  def method_missing(name, *args)
    name == :ghost_reverse ? reverse : super
  end
end

Benchmark.bm do |b|
  b.report 'Normal method' do
    1000000.times { "abc".reverse }
  end
  b.report 'Ghost method' do
    1000000.times { "abc".ghost_reverse }
  end
end
