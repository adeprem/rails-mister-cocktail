class DosesController < ApplicationController
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = set_cocktail
    if @dose.save
      redirect_to(cocktail_path(@dose.cocktail))
    else
      render 'cocktails/show'
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
end
