class FichasController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /fichas
  # GET /fichas.json
  def index
    @fichas = Ficha.order(:nome).paginate(per_page: 10, page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fichas }
    end
  end

  # GET /fichas/1
  # GET /fichas/1.json
  def show
    @ficha = Ficha.find(params[:id])
    
    respond_to do |format|      
      format.html # show.html.erb
      format.json { render json: @ficha }  
    end
  end
  

  # GET /fichas/search?name=fulano
  def search
    @fichas = Ficha.where('nome LIKE ?', "#{params[:name]}%").paginate(per_page: 10, page: params[:page])
    
    respond_to do |format|
      if @fichas.empty?
        flash[:error] = "Nenhum <strong>#{params[:name].to_s}</strong> foi encontrado"
        format.html { redirect_to action: "index" }
      elsif @fichas.size == 1
        @ficha = @fichas.first
        format.html { render action: "show" }
        format.json { render json: @ficha }
      else
        format.html
      end
    end
  end

  # GET /fichas/new
  # GET /fichas/new.json
  def new
    @ficha = Ficha.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ficha }
    end
  end

  # GET /fichas/1/edit
  def edit
    @ficha = Ficha.find(params[:id])
  end

  # POST /fichas
  # POST /fichas.json
  def create
    @ficha = Ficha.new(params[:ficha])
    respond_to do |format|
      if @ficha.save
        if(params[:commit] == "Criar e continuar")
          format.html { redirect_to new_ficha_url, notice: 'Ficha criada com sucesso.' }
        else
          format.html { redirect_to @ficha, notice: 'Ficha criada com sucesso.' }
        end
        format.json { render json: @ficha, status: :created, location: @ficha }
      else
        format.html { render action: "new" }
        format.json { render json: @ficha.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fichas/1
  # PUT /fichas/1.json
  def update
    @ficha = Ficha.find(params[:id])

    respond_to do |format|
      if @ficha.update_attributes(params[:ficha])
        format.html { redirect_to @ficha, notice: 'Ficha alterada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ficha.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fichas/1
  # DELETE /fichas/1.json
  def destroy
    @ficha = Ficha.find(params[:id])
    @ficha.destroy

    respond_to do |format|
      format.html { redirect_to fichas_url }
      format.json { head :no_content }
    end
  end
  
end
