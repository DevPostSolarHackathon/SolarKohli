class WelcomeController < ApplicationController

  def index
  end

  def webhook
    if params[:entry]
      messaging_events = params[:entry][0][:messaging]
      messaging_events.each do |event|
      @sender = event[:sender][:id]
        if (text = event[:message] && event[:message][:text])

          # send_text_message(sender, “Hi there! You said: #{text}. The Bots”)
        end
      end
      body = {
          recipient: {
              id: @sender
          },
          message: {
              text: "Heelo"
          }
      }.to_json
      response = HTTParty.post(
      "https://graph.facebook.com/v2.6/me/messages?access_token=EAAF1EHvxHfcBAPz8aJANGPQDmBLyycz1pe0DZAq14aptxEEWeZCSjeNag9unsnfLxVZC1weYgI96einbIIEo2N4RG3r8BQSUeBg4cc1do1KxZBUQasg5TvZAmPVnyj10DdQJRTvydhWOOrueWWbALVb2F8JZBgPuMGVYZBfATI3egZDZD",
          body: body,
          headers: { "Content-Type" => "application/json" }
      )
    else
      render :json => {:s => "No Entry Found"}
    end

  end

  def verify

  end


end
