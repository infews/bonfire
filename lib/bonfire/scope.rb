require 'ostruct'

class Scope
  def self.build(options = {})
    OpenStruct.new(options)
  end
end
