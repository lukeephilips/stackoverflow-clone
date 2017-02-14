class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    question = Question.find(params[:question_id])
    @answer = question.answers.new(answer_params)
    if @answer.save
      flash[:notice]= "Answer added!"
      redirect_to question_path(question)
    else
      flash[:alert]= @answer.errors.full_messages.each {|m| m.to_s}.join(" | ")
      render :new
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice]= 'Answer updated!'
      redirect_to question_path(question)
    else
      flash[:alert]= @answer.errors.full_messages.each {|m| m.to_s}.join(" | ")
      render :edit
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_path(question)
  end

private
  def answer_params
    params.require(:answer).permit(:content, :user_id)
  end
end
