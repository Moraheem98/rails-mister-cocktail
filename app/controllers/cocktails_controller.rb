class CocktailsController < ApplicationController
  # shows all cocktails
  def index
    @cocktails = Cocktail.all
  end
  # shows one cocktail
  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  private

  # these attributes must be present when a new cocktail is being craeted. (create method)
  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
