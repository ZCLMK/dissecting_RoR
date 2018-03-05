class ShowcasesController < ApplicationController
  def index
    @showcase_items = Showcase.all
  end
end
