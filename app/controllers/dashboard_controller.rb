# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @imports = Import.all
  end

  def new_import
    @import = Import.new
  end

  def import
    ImportFileService.new.execute(params[:import][:import_file])

    flash[:success] = '<strong>File Imported!</strong>'

    redirect_to dashboard_index_path
  rescue StandardError => e
    flash[:error] = "There was a problem importing that file.<br>
        <strong>#{e.message}</strong><br>"

    redirect_to dashboard_new_import_path
  end
end
