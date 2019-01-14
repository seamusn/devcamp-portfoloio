module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Seamus Narron's Portfolio"
    @seo_keywords = 'Seamus Narron Portfolio'
  end
end