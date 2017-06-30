class EncountersController < ApplicationController
  before_action :cancel_check, only: [:create]
  before_action :set_patient, except: [:show, :destroy]
  before_action :set_encounter, except: [:new, :create]

  def show
  end

  def new
    @encounter = Encounter.new
  end

  def create
    @encounter = Encounter.new(encounter_params)
    @encounter.patient = @patient

    if @encounter.save
      redirect_to patient_path(@patient), notice: "Encounter has been added"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @encounter.update_attributes(encounter_params)
      redirect_to patient_encounter_path(@encounter)
    else
      render :edit
    end
  end

  def destroy
    @encounter.destroy
    redirect_to patient_path(@encounter.patient_id), notice: "Encounter has been deleted"
  end

  private
  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_encounter
    @encounter = Encounter.find(params[:id])
  end

  def cancel_check
    @patient = Patient.find(params[:patient_id])

    if params[:commit] == "Cancel"
      redirect_to patient_path(@patient)
    end
  end

  def encounter_params
    params.require(:encounter).permit(:visit_number, :admitted_at, :discharged_at, :location, :room, :bed, :patient_id)
  end
end
