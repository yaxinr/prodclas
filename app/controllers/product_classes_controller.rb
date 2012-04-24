class ProductClassesController < ApplicationController
  # GET /product_classes
  # GET /product_classes.json
  def index
    #@product_classes = ProductClass.all
    if params[:q]
      table2=ProductClass.arel_table
      @product_classes = ProductClass.where(table2[:name].matches('%'+params[:q]+'%')).page(params[:page])
    else
      @product_classes = ProductClass.page(params[:page])
    end

      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_classes }
    end
  end

  # GET /product_classes/1
  # GET /product_classes/1.json
  def show
    @product_class = ProductClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_class }
    end
  end

  # GET /product_classes/new
  # GET /product_classes/new.json
  def new
    @product_class = ProductClass.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_class }
    end
  end

  # GET /product_classes/1/edit
  def edit
    @product_class = ProductClass.find(params[:id])
  end

  # POST /product_classes
  # POST /product_classes.json
  def create
    @product_class = ProductClass.new(params[:product_class])

    respond_to do |format|
      if @product_class.save
        format.html { redirect_to @product_class, notice: 'Product class was successfully created.' }
        format.json { render json: @product_class, status: :created, location: @product_class }
      else
        format.html { render action: "new" }
        format.json { render json: @product_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_classes/1
  # PUT /product_classes/1.json
  def update
    @product_class = ProductClass.find(params[:id])

    respond_to do |format|
      if @product_class.update_attributes(params[:product_class])
        format.html { redirect_to @product_class, notice: 'Product class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_classes/1
  # DELETE /product_classes/1.json
  def destroy
    @product_class = ProductClass.find(params[:id])
    @product_class.destroy

    respond_to do |format|
      format.html { redirect_to product_classes_url }
      format.json { head :no_content }
    end
  end
end
