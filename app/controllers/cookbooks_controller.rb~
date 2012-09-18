class CookbooksController < ApplicationController
  # GET /cookbooks
  # GET /cookbooks.xml
  def index
    @cookbooks = Cookbook.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cookbooks }
    end
  end

  # GET /cookbooks/1
  # GET /cookbooks/1.xml
  def show
    @cookbook = Cookbook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cookbook }
    end
  end

  # GET /cookbooks/new
  # GET /cookbooks/new.xml
  def new
    @cookbook = Cookbook.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cookbook }
    end
  end

  # GET /cookbooks/1/edit
  def edit
    @cookbook = Cookbook.find(params[:id])
  end

  # POST /cookbooks
  # POST /cookbooks.xml
  def create
    @cookbook = Cookbook.new(params[:cookbook])

    respond_to do |format|
      if @cookbook.save
        format.html { redirect_to(@cookbook, :notice => 'Cookbook was successfully created.') }
        format.xml  { render :xml => @cookbook, :status => :created, :location => @cookbook }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cookbook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cookbooks/1
  # PUT /cookbooks/1.xml
  def update
    @cookbook = Cookbook.find(params[:id])

    respond_to do |format|
      if @cookbook.update_attributes(params[:cookbook])
        format.html { redirect_to(@cookbook, :notice => 'Cookbook was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cookbook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cookbooks/1
  # DELETE /cookbooks/1.xml
  def destroy
    @cookbook = Cookbook.find(params[:id])
    @cookbook.destroy

    respond_to do |format|
      format.html { redirect_to(cookbooks_url) }
      format.xml  { head :ok }
    end
  end
end
