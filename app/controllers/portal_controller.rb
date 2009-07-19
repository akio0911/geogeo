class PortalController < ApplicationController
  def index
    @groups = Group.find(:all, :order => "start")
    respond_to do |format| 
      format.html { render :action => "index"}
      format.xml  { render :xml    => @groups}
    end
  end
end

