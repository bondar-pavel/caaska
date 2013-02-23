class UnitToolsController < ApplicationController
  # GET /unit_tools
  # GET /unit_tools.json
  def index
    @unit_tools = UnitTool.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @unit_tools }
    end
  end

  # GET /unit_tools/1
  # GET /unit_tools/1.json
  def show
    @unit_tool = UnitTool.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @unit_tool }
    end
  end

  # GET /unit_tools/new
  # GET /unit_tools/new.json
  def new
    @unit_tool = UnitTool.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @unit_tool }
    end
  end

  # GET /unit_tools/1/edit
  def edit
    @unit_tool = UnitTool.find(params[:id])
  end

  # POST /unit_tools
  # POST /unit_tools.json
  def create
    @unit_tool = UnitTool.new(params[:unit_tool])

    respond_to do |format|
      if @unit_tool.save
        format.html { redirect_to @unit_tool, notice: 'Unit tool was successfully created.' }
        format.json { render json: @unit_tool, status: :created, location: @unit_tool }
      else
        format.html { render action: "new" }
        format.json { render json: @unit_tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /unit_tools/1
  # PUT /unit_tools/1.json
  def update
    @unit_tool = UnitTool.find(params[:id])

    respond_to do |format|
      if @unit_tool.update_attributes(params[:unit_tool])
        format.html { redirect_to @unit_tool, notice: 'Unit tool was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unit_tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_tools/1
  # DELETE /unit_tools/1.json
  def destroy
    @unit_tool = UnitTool.find(params[:id])
    @unit_tool.destroy

    respond_to do |format|
      format.html { redirect_to unit_tools_url }
      format.json { head :no_content }
    end
  end

  def unit
    @unit_tools = UnitTool.find_all_by_unit_id(params[:unit])

    respond_to do |format|
      format.html { render action: "index"}# index.html.erb
      format.json { render json: @unit_tools }
    end

  end

  def tool
    @unit_tools = UnitTool.find_all_by_tool_id(params[:tool])

    respond_to do |format|
      format.html { render action: "index"}
      format.json { render json: @unit_tools }
    end
  end

  def find
    t = params[:tool]
    u = params[:unit]
    if !u.blank?
      @unit_tools = UnitTool.find_all_by_unit_id(u)
    else
      @unit_tools = UnitTool.find_all_by_tool_id(t)
    end

    respond_to do |format|
      format.html { render action: "index" }
      format.json { render json: @unit_tools}
    end
  end
end
