class EmployeeDestinationAccountsController < ApplicationController
  before_action :set_employee_destination_account, only: %i[ show update destroy ]

  # GET /employee_destination_accounts
  def index
    @employee_destination_accounts = EmployeeDestinationAccount.all

    render json: @employee_destination_accounts
  end

  # GET /employee_destination_accounts/1
  def show
    render json: @employee_destination_account
  end

  # POST /employee_destination_accounts
  def create
    @employee_destination_account = EmployeeDestinationAccount.new(employee_destination_account_params)

    if @employee_destination_account.save
      render json: @employee_destination_account, status: :created, location: @employee_destination_account
    else
      render json: @employee_destination_account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employee_destination_accounts/1
  def update
    if @employee_destination_account.update(employee_destination_account_params)
      render json: @employee_destination_account
    else
      render json: @employee_destination_account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /employee_destination_accounts/1
  def destroy
    @employee_destination_account.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_destination_account
      @employee_destination_account = EmployeeDestinationAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_destination_account_params
      params.require(:employee_destination_account).permit(:connection_id, :account_number)
    end
end
