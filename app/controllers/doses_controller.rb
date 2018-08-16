class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(safe_params)

    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      @errors_message = @dose.errors.messages
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def safe_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
