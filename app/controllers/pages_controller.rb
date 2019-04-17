class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :legal, :my_measures]

  def home
    @articles = BlogArticle.homepage.first(3)
  end

  def legal
  end

  def download_pdf
    send_file(
      "#{Rails.root}/public/documents/guide-de-mesure.pdf",
      filename: "guide-de-mesure.pdf",
      type: "application/pdf"
    )
  end
end
