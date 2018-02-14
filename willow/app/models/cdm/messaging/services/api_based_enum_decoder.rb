module Cdm
  module Messaging
    module Services
      class ApiBasedEnumDecoder
        class << self
          def call(section)
            self.new.call(section)
          end
        end

        def initialize(api_endpoint='')
          #Not Implemented. Possibly should be Singleton or cached
        end

        def call(section)
          raise StandardError, 'API based Enumeration decoder'
        end
      end
    end
  end
end
