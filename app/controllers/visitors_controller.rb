class VisitorsController < ApplicationController
  def index
  end

  def contact
    h = JSON.generate(
      name: params[:person][:name],
      email: params[:person][:email],
      message: params[:person][:message])

    PostmanWorker.perform_async(h)
    ExampleJob.perform_later(h)

    redirect_to :root
  end
end
