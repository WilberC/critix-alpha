class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to game_path(@company)
    else
      render :new
    end
  end

  def update
    if @company.update(company_params)
      redirect_to(@company)
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:name, :description, :start_date, :country)
  end
end
