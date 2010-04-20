class DepartmentsController < ApplicationController
  # GET /departments
  # GET /departments.xml
  def index
    # department for a company
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @departments = @company.departments
    # all departments
    else
      @departments = Department.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @departments }
    end
  end

  # GET /departments/1
  # GET /departments/1.xml
  def show
    @department = Department.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @department }
    end
  end

  # GET /departments/new
  # GET /departments/new.xml
  def new
    @department = Department.new
    if params[:id]
      @department.company = Company.find(params[:id])
      @company_people = @department.company.people.active
    end

    respond_to do |format|
      format.html { render :layout => false } # new.html.erb
      format.xml  { render :xml => @department }
    end
  end

  # GET /departments/1/edit
  def edit
    @department = Department.find(params[:id])
    @company_people = @department.company.people.active
  end

  # POST /departments
  # POST /departments.xml
  def create
    params[:department][:company_id] = 1
    @department = Department.new(params[:department])
    @department.manager = Person.find(params[:department][:manager_id])
    @company_people = @department.company.people.active

    respond_to do |format|
      if @department.save
        format.html { redirect_to(companies_path, :notice => 'Department was successfully created.') }
        format.xml  { render :xml => @department, :status => :created, :location => @department }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @department.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /departments/1
  # PUT /departments/1.xml
  def update
    @department = Department.find(params[:id])

    respond_to do |format|
      if @department.update_attributes(params[:department])
        format.html { redirect_to(companies_path, :notice => 'Department was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @department.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.xml
  # TODO Must add 'reassign staffers' functionality
  def destroy
    @department = Department.find(params[:id])
    @department.destroy

    respond_to do |format|
      format.html { redirect_to(departments_url) }
      format.xml  { head :ok }
    end
  end
end
