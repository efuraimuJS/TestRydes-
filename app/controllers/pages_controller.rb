class PagesController < ApplicationController
  def home
    authorize User
  end
end
