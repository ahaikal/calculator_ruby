class CalculatorController < ApplicationController
  def index
  end

  def create
    @string = calculator_params[:string]
    if @string.present?
      @value = Operator.new.calculate(@string)
      render :index
    else
      @notice = 'String is required'
      render :index
    end
  end

  private

  def calculator_params
    params.require(:calculator).permit(:string)
  end
end
