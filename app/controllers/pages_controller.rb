class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  # def home
  # end

  def show
    render template: "pages/#{params[:page]}"
  end
  
  def method_name
         @articles = Article.order(created_at: :desc).limit(1)
  end

end
