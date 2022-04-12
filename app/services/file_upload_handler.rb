# Processes xml file and creates 
require 'nokogiri'

class FileUploadHandler
  def initialize(file)
    @file = file
  end

  def process
    Nokogiri::XML(@file).xpath('//row').each do |row|
      CreateRowDataWorker.perform_async(row)
    end
  end

  private

  def find_or_create_employee(employee_data)
    CreateEmployeeWorker.perform_async(employee_data)
  end

  def find_or_create_checking_account(payor_data)
    checking_account = CheckingAccount.find_or_create_by!(id: payor_data.at_css("DunkinId").text) do |checking_account|
      checking_account.id = payor_data.at_css("DunkinId").text
      checking_account.account_number = payor_data.at_css("AccountNumber").text
      checking_account.aba_routing = payor_data.at_css("ABARouting").text
      checking_account.ein = payor_data.at_css("EIN").text
      checking_account.account_id = Account.first.id
    end

    find_or_create_address(payor_data, checking_account)
  end

  def find_or_create_address(payor_data, checking_account)
    address = Address.find_or_create_by!(id: payor_data.at_css("Zip").text) do |address|
      address.line_1 = payor_data.at_css("Line1").text
      address.city = payor_data.at_css("City").text
      address.state = payor_data.at_css("State").text
      address.zip = payor_data.at_css("Zip").text
      address.checking_account_id = checking_account.id
    end

    checking_account.save!
  end
end
