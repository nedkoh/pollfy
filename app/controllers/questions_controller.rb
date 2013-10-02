class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /questions
  # GET /questions.json
  def index
    if current_user.has_role? :admin
      @questions = Question.all
      @survey = Survey.find(params[:survey_id])
    else
      @questions = Question.find_all_by_user_id current_user[:id]
      @survey = Survey.find(params[:survey_id])
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    @survey = Survey.find(params[:survey_id])
    @question.survey_id = params[:survey_id]
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    @survey = Survey.find(params[:survey_id])
    #@question.survey_id = @survey.id
    @question.survey_id = params[:survey_id]

    respond_to do |format|
      if @question.save
        format.html { redirect_to survey_question_path(@survey.id), notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to survey_question_path(@question.survey_id, @question.id), notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to survey_questions_path(params[:survey_id]) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :qtype, :desc, :answer, :definition, :require, :validate, :page, :order, :created_at, :updated_at, :survey_id, :user_id)
    end
end
