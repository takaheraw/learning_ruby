# 引数ハッシュ
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    @chainging = args[:chainring] || 40
    @cog = args[:cog] || 18
    @wheel = args[:wheel]
  end
end

# 引数デフォルト値
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    @chainging = args.fetch(:chainring, 40)
    @cog = args.fetch(:cog, 18)
    @wheel = args[:wheel]
  end
end

# 初期化を隔離する
module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel
    def initialize(chainging, cog, wheel)
      @chainging = chainging
      @cog = cog
      @wheel = wheel
    end
  end
end
module GearWrapper
  def self.gear(args)
    SomeFramework::Gear.new(
      args[:chainring],
      args[:cog],
      args[:wheel]
    )
  end
end
GearWrapper.gear(
  :chainring => 52,
  :cog => 18,
  :wheel => Wheel.new(26, 1.5)
).gear_inches