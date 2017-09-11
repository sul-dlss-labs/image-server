# frozen_string_literal: true

ActiveSupport::Cache::Store.logger = begin
  path = 'log/cache.log'
  f = File.open(path, 'a')
  f.binmode
  f.sync = Rails.application.config.autoflush_log
  logger = ActiveSupport::Logger.new f
  logger.level = :debug
  logger.formatter = Rails.application.config.log_formatter
  logger = ActiveSupport::TaggedLogging.new(logger)
  logger
end
