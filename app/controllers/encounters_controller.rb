class EncountersController < ApplicationController
  def index
    @encounters = Encounter.all
  end

  def show
    @encounter = Encounter.find(params[:id])
  end

  def edit
    @encounter = Encounter.find(params[:id])
  end

  def destroy
  end
end
