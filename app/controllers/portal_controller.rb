class PortalController < ApplicationController
  caches_page :index
  def index
#     @groups = Group.find(:all, :order => "start")
#     respond_to do |format| 
#       format.html { render :action => "index"}
#       format.xml  { render :xml    => @groups}
#     end
    @groups = Group.find(:all)
  end
end

