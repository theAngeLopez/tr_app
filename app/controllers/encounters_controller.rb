class EncountersController < ApplicationController

  def index
    @encounters = Encounter.all
  end

  def show
    @encounter = Encounter.find(params[:id])
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @encounter = Encounter.new
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @encounter = Encounter.new(encounter_params)
    @encounter.patient = @patient

    if @encounter.save
      redirect_to patient_path(@patient), notice: "Encounter has been added"
    else
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:patient_id])
    @encounter = Encounter.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:patient_id])
    @encounter = Encounter.find(params[:id])

    if @encounter.update_attributes(encounter_params)
      redirect_to patient_encounter_path(@encounter)
    else
      render :edit
    end
  end

  def destroy
    @encounter = Encounter.find(params[:id])
    @encounter.destroy
    redirect_to patient_path(@encounter.patient_id), notice: "Encounter has been deleted"
  end

  private
  def encounter_params
    params.require(:encounter).permit(:visit_number, :admitted_at, :discharged_at, :location, :room, :bed, :patient_id)
  end
end
