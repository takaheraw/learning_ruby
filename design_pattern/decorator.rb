class SimpleWriter
  def initialize(path)
    @file = File.open(path, 'w')
  end

  def write_line(line)
    @file.print(line)
    @file.print("\n")
  end

  def pos
    @file.pos
  end

  def rewind
    @file.rewind
  end

  def close
    @file .close
  end
end


class WriteDecorator
  def initialize(writer)
    @writer = writer
  end

  def write_line
    @writer.write_line(line)
  end

  def pos
    @writer.pos
  end

  def rewind
    @writer.rewind
  end

  def close
    @writer.close
  end
end

class NumberingWriter < WriteDecorator
  def initialize(writer)
    super(writer)
    @line_number = 1
  end

  def write_line(line)
    @writer.write_line("#{@line_number}: #{line}")
    @line_number += 1
  end
end

writer = NumberingWriter.new(SimpleWriter.new('file.txt'))
writer.write_line('Hello world!')