module Jekyll
  class RecentDate < Generator
    def generate(site)

    # This plugin adds a new 'sort_date' attribute to every document (posts and collection items) in the WHOLE SITE, which is set to the 'modified' if it exists, or the 'date' if the 'modified' is missing. And it makes that a string, because liquid.
      site.documents.each do |doc|
        doc.data['sort_date'] = (doc.data['modified'] || doc.data['date']).to_s
      end

    end
  end
end
