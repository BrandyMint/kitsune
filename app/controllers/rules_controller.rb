class RulesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_site
  before_action :set_rule, only: [:show, :edit, :update, :destroy]

  def index
    @rules = @site.rules
  end

  def show
  end

  def new
    @rule = Rule.new
  end

  def edit
  end

  def create
    @rule = @site.rules.new(rule_params)
    if @rule.save
      redirect_to site_rule_path(@site, @rule), notice: 'Rule was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @rule.update(rule_params)
      redirect_to site_rule_path(@site, @rule), notice: 'Rule was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @rule.destroy
    redirect_to rules_url
  end

  private

    def set_site
      @site = current_user.sites.find(params[:site_id])
    end

    def set_rule
      @rule = @site.rules.find(params[:id])
    end

    def rule_params
      params.require(:rule).permit(:phrase, :link)
    end
end
