# frozen_string_literal: true
##
# URL helper methods
module Blacklight::UrlHelperBehavior
  def url_for_document(doc, options = {})
    doc["url_fulltext_display"].first
  end

  # link_to_document(doc, 'VIEW', :counter => 3)
  # Use the catalog_path RESTful route to create a link to the show page for a specific item.
  # catalog_path accepts a hash. The solr query params are stored in the session,
  # so we only need the +counter+ param here. We also need to know if we are viewing to document as part of search results.
  # TODO: move this to the IndexPresenter
  def link_to_document(doc, field_or_opts = nil, opts = { :counter => nil })
    if field_or_opts.is_a? Hash
      opts = field_or_opts
    else
      field = field_or_opts
    end

    field ||= document_show_link_field(doc)
    label = index_presenter(doc).label field, opts
    link_to label, url_for_document(doc)
  end
end
