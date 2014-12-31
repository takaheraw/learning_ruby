class MyClass
  def my_method
    @v = 1
  end
end
obj = MyClass.new
obj.my_method
p obj.class
p obj.instance_variables
p obj.methods.grep(/my/)

p Class.superclass       # => Module
p Module.superclass      # => Object
p String.superclass      # => Object
p Object.superclass      # => BasicObject
p BasicObject.superclass # => nil


module MyModule
  MyConstant = '外部の定数'

  class MyClass
    MyConstant = "内部の定数"
  end
end
p MyModule::MyClass::MyConstant
p MyModule.constants


class MySubClass < MyClass
end
obj = MySubClass.new
obj.my_method
p MySubClass.ancestors # => [MySubClass, MyClass, Object, Kernel, BasicObject]

module M
  def my_method
    'M#my_method()'
  end
end
class C
  include M
end
class D < C; end
p D.ancestors # => [D, C, M, Object, Kernel, BasicObject]

class MyClass
  def testing_self
    @var = 10
    my_method()
    self
  end

  def my_method
    @var = @var + 1
  end
end
obj = MyClass.new
p obj.testing_self # => #<MyClass:0x007f9c83028d58 @var=11>

p self       # => main
p self.class # => Object

class MyClass
  self # => MyClass
end


module Printable
  def print

  end

  def prepare_cover

  end
end

module Document
  def print_to_screen
    prepare_cover
    format_for_screen
    print
  end

  def format_for_screen

  end

  def print

  end
end

class Book
  include Document
  include Printable
end
p Book.ancestors # => [Book, Printable, Document, Object, Kernel, BasicObject]
