class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = PowerGenerator.all
  end

  def simple_search
    if params[:simpleSearch].length > 1
      @power_generators = PowerGenerator.where('name like ?', "%#{params[:simpleSearch]}%")
      render :simple_search

    else
      flash[:notice] = 'O valor da busca deve conter mais de 1 caracter'
      redirect_to root_path
    end
  end

  def advanced_search
    if params[:advancedSearch].to_i > 1
      @power_generators = PowerGenerator.where('kwp >= ?', "#{params[:advancedSearch]}")
      render :advanced_search

    else
      flash[:notice] = 'O valor da busca deve conter mais de 1 caracter'
      redirect_to root_path
    end
  end
end
