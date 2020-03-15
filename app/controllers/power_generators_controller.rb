class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = PowerGenerator.all
  end

  def show
    @power_generator = PowerGenerator.find(params[:id])
  end

  def delivery_tax
    zip_code = params[:zip_code]

    if zip_code.length > 8 || zip_code.length < 8
      flash[:notice] = 'CEP inválido. Tente novamente'
      @power_generator = PowerGenerator.find(params[:power_generator_id])
      render :show
    end

    @power_generator = PowerGenerator.find(params[:power_generator_id])
    weight = @power_generator.weight
    uf = ZipCodeApi.new(zip_code).call

    freight = Freight.where(state: 'SP').where('? BETWEEN weight_min AND weight_max', weight).order(:cost)
    freight = freight.first

    @cost = freight.cost
    @power_generator = PowerGenerator.find(params[:power_generator_id])
    render :show
  end

  def simple_search
    if params[:simpleSearch].length > 1
      @power_generators = PowerGenerator.where('name like ?', "%#{params[:simpleSearch].upcase}%")
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
