class DashboardController < ApplicationController
  # Uploads a file to the server

  def upload
    file = params[:file]
    filename = file.original_filename
    directory = "public/uploads"
    # create the file path
    path = File.join(directory, filename)
    # Create XML record in the database
    xml_file = XmlFile.create(file_name: filename, data: file.read)

    render json: { success: true, status: 200, message: "File uploaded successfully" } if xml_file
  end
end
