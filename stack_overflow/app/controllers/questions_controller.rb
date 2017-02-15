class QuestionsController < ApplicationController
  before_filter :authorize

  def show
    @question = Question.find(params[:id])
  end
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
  def upvote
    @question = Question.find(params[:id])
    @question.upvote_by current_user
    redirect_to :back
  end
  def downvote
    @question = Question.find(params[:id])
    @question.downvote_by current_user
    redirect_to :back
  end

private
  def question_params
    params.require(:question).permit(:title, :user_id)
  end
end
