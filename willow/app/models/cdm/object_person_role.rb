module Cdm
  class ObjectPersonRole < ActiveFedora::Base
    include Cdm::Concerns::ModelExtensions
    property :role_type, predicate: ::RDF::Vocab::SIOC.has_function, multiple: false
  end
end