require 'nokogiri'

class CreateEmployeeWorker
  include Sidekiq::Worker
  sidekiq_options throttle: { threshold: 600, period: 1.minute }

  def perform(employee_data)
    employee = Employee.find_or_create_by!(id: employee_data.at_css("DunkinId").text) do |employee|
      employee.id = employee_data.at_css("DunkinId").text
      employee.first_name = employee_data.at_css("FirstName").text
      employee.last_name = employee_data.at_css("LastName").text
      employee.dob = employee_data.at_css("DOB").text
      employee.phone_number = employee_data.at_css("PhoneNumber").text
      employee.branch_id = employee_data.at_css("DunkinBranch").text
    end
  end
end