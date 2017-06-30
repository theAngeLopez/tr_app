class PatientsController < ApplicationController
  before_action :cancel_check, only: [:create, :update]
  before_action :set_patient, except: [:index, :new, :create]

  def index
    @patients = Patient.all
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to root_path, notice: "Patient has been added"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update_attributes(patient_params)
      redirect_to patient_path(@patient)
    else
      render :edit
    end
  end


  def destroy
    @patient.destroy
    redirect_to root_path, notice: "Patient and their encounters have been deleted"
  end

  private
  def set_patient
    @patient = Patient.find(params[:id])
  end

  def cancel_check
    if params[:commit] == "Cancel"
      redirect_to root_path
    end
  end

  def patient_params
    params.require(:patient).permit(:first_name, :middle_name, :last_name, :weight, :height, :mrn)
  end
end
