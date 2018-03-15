class ShowcasesController < ApplicationController
  def index
    @showcase_items = Showcase.all
  end

  def new
    @showcase_item = Showcase.new
  end

  def create
    @showcase_item = Showcase.new(params.require(:showcase).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @showcase_item.save
        format.html { redirect_to showcases_path, notice: 'Votre contribution au portfolio a bien été sauvegardée .' }
      else
        format.html { render :new }
      end
    end
  end

    def edit
      @showcase_item = Showcase.find(params[:id])
    end

     def update
      @showcase_item = Showcase.find(params[:id])
    respond_to do |format|
      if @showcase_item.update(params.require(:showcase).permit(:title,:subtitle, :body))
        format.html { redirect_to showcases_path, notice: 'Modification enregistrée.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
      @showcase_item = Showcase.find(params[:id])
  end

  def destroy
    @showcase_item = Showcase.find(params[:id])
    @showcase_item.destroy

    respond_to do |format|
      format.html { redirect_to showcases_url, notice: 'Supprimé' }
    end

  end

end
