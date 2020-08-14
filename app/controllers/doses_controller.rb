class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id]) # finds the cocktail with its id
    @dose = Dose.new(doses_params) # creates a new cocktail only but ony iwth the strong params attritbutes being present
    @dose.cocktail = @cocktail # assigns the cocktail to the dose, sets the doses cocktail_id
    if @dose.save
      redirect_to @cocktail
    else
      render :new # stays on the pages, if inputs not entered
    end
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
