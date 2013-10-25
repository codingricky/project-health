class RatingsController < ApplicationController
  def index
    @indicators = Indicator.find(:all, :order => "sort_order")
    @project = Project.find(params[:project_id])
    @iteration = Iteration.where(project: @project).where(status: 'current').first
  end

  def create
    iteration = Iteration.where(project_id: params[:project_id]).where(status: 'current').first
    indicators = Indicator.find(:all)
    indicators.each do |indicator|
      score = params[:scores]["#{indicator.id}"]
      score = nil if score == "0"
      Rating.create(iteration: iteration, indicator: indicator, score: score)

      message = params[:comments]["#{indicator.id}"]
      unless message.blank?
        Comment.create(iteration: iteration, indicator: indicator, comment: message)
      end
    end

    flash[:message] = "Vote submitted"
    redirect_to project_ratings_path(project_id: params[:project_id])
  end
end