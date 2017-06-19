# frozen_string_literal: true
class SolrDocument
  include Blacklight::Solr::Document
  include Blacklight::Gallery::OpenseadragonSolrDocument

  # Adds CurationConcerns behaviors to the SolrDocument.
  include CurationConcerns::SolrDocumentBehavior
  # Adds Sufia behaviors to the SolrDocument.
  include Sufia::SolrDocumentBehavior



  # self.unique_key = 'id'

  # Email uses the semantic field mappings below to generate the body of an email.
  SolrDocument.use_extension(Blacklight::Document::Email)

  # SMS uses the semantic field mappings below to generate the body of an SMS email.
  SolrDocument.use_extension(Blacklight::Document::Sms)

  # DublinCore uses the semantic field mappings below to assemble an OAI-compliant Dublin Core document
  # Semantic mappings of solr stored fields. Fields may be multi or
  # single valued. See Blacklight::Document::SemanticFields#field_semantics
  # and Blacklight::Document::SemanticFields#to_semantic_values
  # Recommendation: Use field names from Dublin Core
  use_extension(Blacklight::Document::DublinCore)

  # Do content negotiation for AF models.

  use_extension( Hydra::ContentNegotiation )

  def doi
    self[Solrizer.solr_name('doi', :stored_searchable)]
  end

  def other_title
    self[Solrizer.solr_name('other_title', :displayable)]
  end

  def creator_nested
    self[Solrizer.solr_name('creator_nested', :displayable)]
  end

  def date
    self[Solrizer.solr_name('date', :displayable)]
  end

  def rights_nested
    self[Solrizer.solr_name('rights_nested', :displayable)]
  end

  def relation
    self[Solrizer.solr_name('relation', :displayable)]
  end

  def subject
    self[Solrizer.solr_name('relation', :displayable)]
  end

  def admin_metadata
    self[Solrizer.solr_name('admin_metadata', :displayable)]
  end
end
