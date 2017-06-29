class PatientsController < ApplicationController
  before_action :cancel_check, only: [:create, :update]

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
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
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update_attributes(patient_params)
      redirect_to "/patients/#{@patient.id}"
    else
      render :edit
    end
  end

  def cancel_check
    if params[:commit] == "Cancel"
      redirect_to root_path
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to root_path, notice: "Patient and their encounters have been deleted"
  end

  private
  def patient_params
    params.require(:patient).permit(:first_name, :middle_name, :last_name, :weight, :height, :mrn)
  end
end
