class PeopleController < ApplicationController
  # GET /people
  # GET /people.xml
  def index
    # active people for a department in a company
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @department = @company.departments.find(params[:department_id])
      @people = @department.people.active
      @ph = {:company => @company.name, :department => @department.name}
      xh = false
    # active people for a department
    elsif params[:department_id]
      @department = Department.find(params[:department_id])
      @people = @department.people.active
      @ph = {:department => @department.name}
      xh = false
    # all active people
    else
      @people = Person.order(:last_name).active
      xh = true
    end
    
    if params[:q] && params[:q] == '1'
      xh = true
    end

    respond_to do |format|
      format.html {render :layout  => xh} # index.html.erb
      format.xml  { render :xml => @people }
    end
  end

  # action for meta_search to call
  def search
    ppl = Person.search(params[:search])
    if ppl.count == 1
      @person = ppl.first
      render :show
    elsif ppl.count > 1
      @people = ppl
      render :index
    else
      flash[:error] = 'No staff found with name including ' + params[:search][:plain_fullname_contains]
      redirect_to :back
    end
  end

  # GET /people/1
  # GET /people/1.xml
  def show
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/new
  # GET /people/new.xml
  def new
    @person = Person.new
    if params[:department_id]
      @person.department = Department.find(params[:department_id])
      @person.company = @person.department.company
    end
    @person.hired_on = DateTime.current

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people
  # POST /people.xml
  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        format.html { redirect_to(@person, :notice => 'Person was successfully created.') }
        format.xml  { render :xml => @person, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.xml
  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to(@person, :notice => 'Person was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.xml
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to(people_url) }
      format.xml  { head :ok }
    end
  end
  
  # Terminate an employee
  def terminate
    @person = Person.find(params[:id])
    respond_to do |format|
      if @person.update_attribute(:terminated_on, DateTime.now)
        format.html { redirect_to :back, :notice => @person.full_name+' was terminated.' }
        format.xml  { head :ok }
      else
        format.html { redirect_to :back }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end
end
