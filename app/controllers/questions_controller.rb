class QuestionsController < ApplicationController
  def index
    flash[:notice] = ""
    if params[:asker_id].nil?
      @title = "All Questions"
      @questions = Question.all.order("updated_at DESC")
    elsif params[:asker_id]
      @title = "Questions asked by #{User.find(params[:asker_id]).name}"
      @questions = Question.where(asker_id: params[:asker_id]).order("updated_at DESC")
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order("favorite DESC", "updated_at ASC")
    @asker = @question.asker
    @user = User.new
    @answer = Answer.new
    @answer.user = @user
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.asker = User.second
    if @question.save
      redirect_to questions_path
      flash[:notice] = "QUESTION ASKED SUCCESSFULLY"
    else
      render :new
      flash[:notice] = "ERROR: TITLE MUST BE AT LEAST 50 CHARACTERS & DESCRIPTION MUST BE AT LEAST 150"
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@question)
      flash[:notice] = "QUESTION UPDATED SUCCESSFULLY"
    else
      render :edit
      flash[:notice] = "ERROR: TITLE MUST BE AT LEAST 50 CHARACTERS & DESCRIPTION MUST BE AT LEAST 150"
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.answers.destroy_all
    @question.destroy
    redirect_to questions_path
    flash[:notice] = "QUESTION SUCCESSFULLY DELETED"
  end

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
