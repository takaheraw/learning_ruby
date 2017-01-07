class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel=nil)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end

end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end

end


class ObscuringReferences
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def diameters
    data.collect{|cell| cell[0] + (cell[1] * 2 )}
  end
end

class RevealingReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect{|cell| Wheel.new(cell[0], cell[1])}
  end

  def diameters
    wheels.collect{|wheel| diameter(wheel)}
  end

  def diameter(wheel)
    wheel.rim + (wheel.tire * 2)
  end
end

@wheel = Wheel.new(26, 1.5)
puts @wheel.circumference
puts Gear.new(52, 11, @wheel).gear_inches
puts Gear.new(52, 11).ratio
puts ObscuringReferences.new([[622, 20], [622, 33]]).diameters
puts RevealingReferences.new([[622, 20], [622, 33]]).diameters