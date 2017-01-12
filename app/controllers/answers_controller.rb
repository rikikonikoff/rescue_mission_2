class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @user = User.fourth
    @answer.user = @user
    @question = Question.find(params[:question_id])
    @answer.question = @question
    if @answer.save
      redirect_to question_path(@question)
      flash[:notice] = "ANSWER ADDED SUCCESSFULLY"
    else
      render :new
      flash[:notice] = "ERROR: ANSWER MUST BE AT LEAST 50 CHARACTERS"
    end
  end

  def edit
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end

  def update
    @answer = Answer.find(params[:id])
    @question = @answer.question
    if @answer.update(answer_params)
      redirect_to question_path(@question)
      flash[:notice] = "ANSWER UPDATED SUCCESSFULLY"
    else
      render :edit
      flash[:notice] = "ERROR: ANSWER MUST BE AT LEAST 50 CHARACTERS"
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @answer.destroy
    redirect_to question_path(@question)
    flash[:notice] = "ANSWER SUCCESSFULLY DELETED"
  end

  def favorite
    if @answer.favorite?
      @answer.favorite = false;
    else
      @answer.favorite = true
    end
  end

  def answer_params
    params.require(:answer).permit(:body, :question)
  end
end
