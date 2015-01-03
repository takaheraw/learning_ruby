class SimpleLogger
  attr_accessor :level

  ERROR   = 1
  WARNING = 2
  INFO    = 3

  def initialize
    @log = File.open('log.txt', 'w')
    @level = WARNING
  end

  @@instance = SimpleLogger.new

  def self.instance
    return @@instance
  end

  def error(msg)
    @log.puts(msg)
    @log.flush
  end

  def warning(msg)
    @log.puts(msg) if @level >= WARNING
  end

  def info(msg)
    @log.puts(msg) if @level >= INFO
  end

  private_class_method :new
end

logger = SimpleLogger.instance
logger.error('error')
logger.warning('warning')
logger.info('info')
