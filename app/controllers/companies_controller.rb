class CompaniesController < ApplicationController
  before_filter :get_co, :except => [:index, :create]
  
  # GET /companies
  # GET /companies.xml
  def index
    @company = Company.first
    @departments = @company.departments

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @company }
    end
  end

  def import_staff
    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @company }
    end
  end
  
  def export_staff
    @exp = @company.to_csv
    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @company }
    end
  end
  
  def terminated_staff
    @terminated = @company.people.terminated
    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @terminated }
    end
  end
  
  def map
    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @terminated }
    end
  end
  
  # GET /companies/new
  # GET /companies/new.xml
  def new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company }
    end
  end

  # GET /companies/1/edit
  # Assumes will be called from Ajax link
  def edit
    render :layout => false
  end

  # POST /companies
  # POST /companies.xml
  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to(@company, :notice => 'Company was successfully created.') }
        format.xml  { render :xml => @company, :status => :created, :location => @company }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.xml
  def update

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to(companies_path, :notice => @company.name + ' was successfully updated.') }
        format.js   { redirect_to(companies_path, :notice => @company.name + ' was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.js   { render :action => "edit", :layout => false }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.xml
  def destroy
    @company.destroy

    respond_to do |format|
      format.html { redirect_to(companies_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  def get_co
    @company = Company.find(params[:id])
  end
end
