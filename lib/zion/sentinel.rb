require 'zip'

module Zion
  class Sentinel < Zion::Source
    FILE_NAME = '/tmp/sentinels.zip'

    def get_data
      data = hack_matrix({ source: 'sentinels' })
      File.write(FILE_NAME, data)
    end
  end
end