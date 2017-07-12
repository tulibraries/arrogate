require 'guiding_light/harvest'

GuidingLight::Harvest.module_eval do
  def self.application_fields(solr_doc, libguide_doc)
    external_link_patterns.each do |type,shortname, pattern|
      link_count = libguide_doc.xpath("//a").map { |a| a["href"] }.select { |link| link =~ pattern }.count
      solr_doc["link_facet"] << "Has #{type} links" if  link_count > 0
      solr_doc["#{shortname}_links_count_i"] = link_count
    end
    solr_doc
  end

  def self.external_link_patterns
    [
      ["Summon", 'summon', /temple.summon.serialssolutions.com/],
      ["Diamond Permanent", 'diamond', /diamond.temple.edu\/record=/],
      ["Diamond Non-Permanent", 'diamond_other', /diamond.temple.edu\/(?!record=)/],
      ["Journal Finder", 'journal_finder', /vv4kg5gr5v.search.serialssolutions.com/]
    ]
  end
end
