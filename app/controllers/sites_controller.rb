class SitesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_site, only: [:show, :edit, :update, :destroy, :kitsune]

  def index
    @sites = Site.all
  end

  def show
  end

  def new
    @site = Site.new
  end

  def edit
  end

  def create
    @site = current_user.sites.new(site_params)
    if @site.save
      redirect_to @site, notice: 'Site was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @site.update(site_params)
      redirect_to @site, notice: 'Site was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @site.destroy
    redirect_to sites_url
  end

  def kitsune
    render 'layouts/kitsune', :locals=>{:site=>@site}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = current_user.sites.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:name, :language_id)
    end
end
