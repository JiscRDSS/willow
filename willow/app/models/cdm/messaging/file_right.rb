#Endpoint that has the same effective name in the mapping and the model. objectRights maps to :object_rights
module Cdm
  module Messaging
    class FileRight < MessageMapper
      def hash_value(_, object)
        {
          rightsStatement: [ 'not yet implemented' ],
          rightsHolder: [ 'not yet implemented' ],
          licence: [
            licenceName: 'not yet implemented',
            licenceIdentifier: 'not yet implemented'
          ],
          access: [
            accessType: 3,
            accessStatement: 'not yet implemented'
          ]
        }
      end
    end
  end
end
