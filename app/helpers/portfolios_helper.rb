# frozen_string_literal: true

module PortfoliosHelper
  def image_generator(height:,width:)
    "https://www.fillmurray.com/#{height}/#{width}"
  end

  def portfolio_img img, type
    if img.model.main_image? || img.model.main_image?
      img
    elsif type == 'thumb'
      image_generator(height: '350', width: '200')
    elsif type == 'main'
      image_generator(height: '600', width: '400')
    end
  end
end