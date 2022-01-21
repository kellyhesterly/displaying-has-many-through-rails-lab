class AppointmentsController < ApplicationController
    def show
        @appointment = Appointment.find(params[:id])
    end

    def new
        @appointment = Appointment.new(appointment_params)
    end

    def create
        @appointment = Appointment.create(appointment_params)
        if @appointment.save?
            redirect_to appointment_path(@appointment)
        else
            render :new
        end
    end

    def edit
        @appointment = Appointment.find(params[:id])
    end

    def update
        @appointment = Appointment.update(appointment_params)
        if @appointment.update?
            redirect_to appointment_path(@appointment)
        else
            render :show
        end
    end

    def destroy
    end

    private

    def appointment_params
        params.require(:appointment).permit(:appointment_datetime, :patient_id, :doctor_id)
    end
end
