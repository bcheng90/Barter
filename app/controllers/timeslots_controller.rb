require 'date'
module DateTimeMixin

  def next_week
    self + (7 - self.wday)
  end

  def next_wday (n)
    n > self.wday ? self + (n - self.wday) : self.next_week.next_day(n)
  end

end
class TimeslotsController < ApplicationController

  def show
    @timeslot = Timeslot.find_by(id: params[:id])
    render json: @timeslot
  end

  def edit
    @timeslot = Timeslot.find_by(id: params[:id])
    render json: @timeslot
  end

  def create
    days = {"Monday" => "1", "Tuesday"=> "2", "Wednesday" => "3", "Thursday" => "4", "Friday"=> "5", "Saturday"=> "6", "Sunday"=> "0"}
    puts "--------------"
    puts params
    day = days[params["day"]].to_i
    hour = params[:hour].split(":").first.to_i
    p "DAY: #{day}, HOUR: #{hour}"

    x = DateTime.now.extend(DateTimeMixin)
    string = x.next_wday(day).to_s
    year = string.split("T").first.split("-").first.to_i
    month = string.split("T").first.split("-")[1].to_i
    day = string.split("T").first.split("-")[2].to_i
    time = DateTime.new(year,month, day, hour)
    @timeslot = Timeslot.create!(user: current_user, time: time)
    render json: @timeslot
  end

  def update
    @timeslot = Timeslot.find_by(id: params[:id])
    @timeslot.update!(timeslot_params)
    render json: @timeslot
  end

  def destroy
    @timeslot = Timeslot.find_by(id: params[:id])
    @timeslot.destroy
    render json: @timeslot
  end

  private
  def timeslot_params
    params.require(:timeslot).permit(:time, :offer_id).merge(user_id: current_user.id)
  end
end
