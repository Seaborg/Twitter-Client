require 'rho/rhocontroller'
require 'helpers/browser_helper'

class TwitterController < Rho::RhoController
  include BrowserHelper

  # GET /Twitter
  def index
    @twitters = Twitter.find(:all)
    render :back => '/app'
  end

  # GET /Twitter/{1}
  def show
    @twitter = Twitter.find(@params['id'])
    if @twitter
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Twitter/new
  def new
    @twitter = Twitter.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Twitter/{1}/edit
  def edit
    @twitter = Twitter.find(@params['id'])
    if @twitter
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Twitter/create
  def create
    @twitter = Twitter.create(@params['twitter'])
    redirect :action => :index
  end

  # POST /Twitter/{1}/update
  def update
    @twitter = Twitter.find(@params['id'])
    @twitter.update_attributes(@params['twitter']) if @twitter
    redirect :action => :index
  end

  # POST /Twitter/{1}/delete
  def delete
    @twitter = Twitter.find(@params['id'])
    @twitter.destroy if @twitter
    redirect :action => :index  
  end
end
