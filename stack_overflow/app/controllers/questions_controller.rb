class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice]= "Question added!"
      redirect_to '/'
    else
      flash[:alert]= @question.errors.full_messages.each {|m| m.to_s}.join(" | ")
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice]= 'Question update!'
      redirect_to '/'
    else
      flash[:alert]= @question.errors.full_messages.each {|m| m.to_s}.join(" | ")
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to '/'
  end

private
  def question_params
    params.require(:question).permit(:title, :user_id)
  end
end
