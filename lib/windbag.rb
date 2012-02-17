require "windbag/engine"
require "windbag/user_class"

module Windbag
  def self.global_channel
    Channel.find_or_create_by_name('global-notifications')
  end
end
