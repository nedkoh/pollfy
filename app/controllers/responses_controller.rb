class ResponsesController < ApplicationController
  layout 'simple', :only => [:new, :thanks]
  before_action :set_response, only: [:show, :edit, :update, :destroy]
  #load_and_authorize_resource :survey
  #load_and_authorize_resource :response, :through => :survey

  skip_before_filter :authenticate_user!, :only => [:new, :thanks, :create]
  load_and_authorize_resource :except => [:new, :thanks, :create]
  skip_authorization_check :only => [:new, :thanks, :create]
  
  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
  end

  #redirect survey submission
  # GET /responses/1/thanks
  def thanks
  end

  # GET /responses/new
  def new
    @response = Response.new
    #all mine
    @survey = Survey.find(params[:survey_id])
    @questions = @survey.questions
    @answers = Array.new(@survey.questions.length) { @response.answers.build }
    #@response.ip = request.remote_ip
    #@answers = Array.new(@survey.questions.length) { @survey.answers.build }
    #@response.answers = @answers
  end

  # GET /responses/1/edit
  def edit
    @survey = Survey.find(params[:survey_id])
  end

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(response_params)
    #mine
    @survey = Survey.find(params[:survey_id])
    @response.ip = request.remote_ip
    @response.survey_id = @survey.id
    @response.survey_id = params[:survey_id]

    respond_to do |format|
      if @response.save
        if user_signed_in?
          format.html { redirect_to survey_response_path(@survey.id, @response.id), notice: 'Thank you. Survey was successfully submitted.' }
        else
          redirecturl = (@survey.redirect.nil? || @survey.redirect.empty?) ? thanks_survey_response_path(@survey, 5) : @survey.redirect 
          format.html { redirect_to redirecturl, notice: 'Thank you. Survey was successfully submitted.'  }
          format.json { render action: 'show', status: :created, location: @response }
        end
      else
        Rails.logger.info(@response.errors.full_messages.join(', '))
        format.html { render action: 'new' }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responses/1
  # PATCH/PUT /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to survey_response_path(params[:survey_id], @response.id), notice: 'Response was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(
        :ip, 
        :survey_id, 
        :answers_attributes => [
          :id, 
          :answer, 
          {:resp => []}, 
          :survey_id, 
          :question_id, 
          :response_id, 
          :user_id 
          ])
    end
end
