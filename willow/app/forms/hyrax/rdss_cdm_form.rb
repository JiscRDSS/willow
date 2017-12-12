# Generated via
#  `rails generate hyrax:work RdssCdm`
module Hyrax
  class RdssCdmForm < Hyrax::Forms::WorkForm
    self.model_class = ::RdssCdm

    #
    self.terms -= [
      # These fields are not present in the RDSS CDM model, but 
      :label, 
      :relative_path, 
      :import_url, 
      :resource_type,
      :creator, 
      :contributor, 
      :description, 
      :keyword, 
      :license,
      :rights_statement,
      :publisher, 
      :date_created, 
      :subject, 
      :language, 
      :identifier, 
      :based_near, 
      :related_url, 
      :bibliographic_citation, 
      :source
    ]

    self.terms += [
      :title, 
      :object_description  
    ]
    self.required_fields += [
      :title
    ]
  end
end
