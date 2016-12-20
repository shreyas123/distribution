require 'zip'

module Zion
  class Sentinel < Zion::Source
    FILE_NAME = 'sentinels.zip'

    def get_data
      data = hack_matrix({ source: 'sentinels' })
    end
  end
end