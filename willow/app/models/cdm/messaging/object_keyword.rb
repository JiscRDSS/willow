# Note: In the messaging for some unknown reason, this is objectKeywords rather than objectKeyword.
module Cdm
  module Messaging
    class ObjectKeyword < MessageMapper
      def value(object)
        object.object_keywords.to_a
      end
    end
  end
end