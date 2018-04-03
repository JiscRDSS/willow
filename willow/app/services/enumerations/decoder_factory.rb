# This class builds classes to return numeric enumeration values from json enumerations of the form:
#
#     "sectionName": [
#       'value1',
#       'value2',
#       'value3'
#     ]
#
# by setting a constant to the return value for the EnumDecoder.call('sectionName')
# or by subclassing the EnumDecoder.call('sectionName') (This returns a class, so it is entirely appropriate to subclass)
#
# i.e.
# ::Cdm::Messaging::Enumerations::SectionName = ::Enumerations::Decoder.call('sectionName')
#
# which in this case would be the equivalent of creating the following class
#
# module Cdm
#   module Messaging
#     module Enumerations
#       class SectionName
#         class << self
#           def value1
#             1
#           end
#
#           def value2
#             2
#           end
#
#           def value3
#             3
#           end
#         end
#       end
#     end
#   end
# end
#
# Since we don't actually care about the case of the string names, only their symbolic representation and indexes, no
# translation checks other than conversion to symbols needs to be done. The JSON.parser also contains a symboliser
# which may be more efficient than calling underscore.downcase.intern, but I'd prefer to be more explicit until properly
# testing the Json parser version.
#
module Enumerations
  module DecoderFactory
    class << self
      private
      def default_options
        {
          file: ::Enumerations::Decoders::File,
          api: ::Enumerations::Decoders::Api,
          taxonomy: ::Taxonomies::DecoderFactory
        }
      end

      def define_class_for(section, decoder, options)
        Class.new do
          define_singleton_method(:call) do
            options[decoder].(section)
          end

          options[decoder].(section).each_with_index do | object |
            define_singleton_method(object.underscore.downcase.intern) do
              options[:taxonomy].(section, decoder).send(object.underscore.downcase.intern)
            end
          end
        end
      end

      public
      def call(section, decoder=:file, options=default_options)
        define_class_for(section, decoder, options)
      end

      def sections(decoder=:file, options=default_options)
        options[decoder].sections
      end
    end
  end
end
