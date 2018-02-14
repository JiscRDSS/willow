require 'singleton'
module Cdm
  module Messaging
    module Services
      class FileBasedEnumDecoder
        include Singleton
        class << self
          public
          def call(section)
            instance.call(section)
          end

          def sections
            instance.sections
          end

          private
          def instance
            @__instance__ ||= new
          end
        end

        public
        def call(section)
          @__cache__[section] && @__cache__[section]['enum']
        end

        def sections
          @__cache__.keys.map{ |x| x.underscore.downcase.intern }
        end

        private
        def initialize(filename="#{Rails.root.to_s}/config/rdss-message-api-enumeration.json")
          @__cache__ = JSON.parse(File.read(filename))['definitions']
        end
      end
    end
  end
end
