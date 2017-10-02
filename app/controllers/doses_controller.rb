class DosesController < ApplicationController
  def new
    set_cocktail
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    # @dose.ingredient = Ingredient.new(ingredient_params)
    @dose.cocktail = set_cocktail
    # @dose.ingredient = set_ingredient
    if @dose.save
      redirect_to(cocktail_path(@dose.cocktail))
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to(cocktail_path(@dose.cocktail))
  end

  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  # def ingredient_params
  #   params.require(:ingredient).permit(:name)
  # end

end
