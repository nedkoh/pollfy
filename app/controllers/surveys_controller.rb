class SurveysController < ApplicationController
  #layout 'simple', :only => [:r, :thanks]
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  #skip_before_filter :authenticate_user!, only: 'r'
  #skip_before_filter :authenticate_user!, :only => [:r,:update, :thanks]
  load_and_authorize_resource :survey
  #load_and_authorize_resource :except => [:r, :update, :thanks]
  #skip_authorization_check :only => [:r, :update, :thanks]
  
  # GET /surveys
  # GET /surveys.json
  def index
    if current_user.has_role? :admin
    @surveys = Survey.all.order("user_id, created_at")
    else
      @surveys = Survey.find_all_by_user_id current_user[:id]
    end
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)
    if (!@survey.user_id) then 
      @survey.user_id = current_user.id 
    end
    
    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render action: 'show', status: :created, location: @survey }
      else
        format.html { render action: 'new' }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:title, :created_at, :updated_at, :image, :collect, :start, :end, :redirect, :user_id, :answers_attributes => [:id, :answer, {:response => []}, :survey_id, :question_id, :response_id, :user_id ], :responses_attributes => [:id, :ip, :survey_id, :user_id])
    end
end
