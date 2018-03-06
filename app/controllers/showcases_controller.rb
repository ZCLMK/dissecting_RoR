class ShowcasesController < ApplicationController
  def index
    @showcase_items = Showcase.all
  end

  def new
    @showcase_items = Showcase.new
  end

  def create
    @showcase_item = Showcase.new(params.require(:showcase).permit(:title, :subtile, :body))

    respond_to do |format|
      if @showcase_item.save
        format.html { redirect_to showcases_path, notice: 'Votre contribution au portfolio a bien été créee .' }
      else
        format.html { render :new }
      end
    end
  end

end
