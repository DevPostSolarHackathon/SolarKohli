class WelcomeController < ApplicationController
  def index
  end

  def webhook
     render :json => {:hello => "Hello"}
  end

  def verify

    render :json => {:hello => "asda"}
  end

  def solartrivia

    facts = {"1":"1 GWh can light 1000 Indian homes.","2":"The world's largest solar power plant is in Tamil Nadu which generates 648-mw entailing an investment of Rs 4,550 crore.","3":"According to World Bank, 300 million of people  have no access to electricity in India.","4":"88% of Asia's population will experience water scarcity.","5":"The Ministry of New and Renewable Energy provides 70 percent subsidy on the installation cost of a solar photovoltaic power plant in North-East states and 30 percentage subsidy in other regions.","6":"7 years from now, in 2023, the ICC cricket world Cup will return to the Indian shores. India will play hosts for the fourth time.","7":"The only cricketer to play Test cricket for India and England is Saif Ali Khanís grandfather, Iftikhar Ali Khan Pataudi.","8":"Adam Gilchrist holds the record for playing the most number of Tests straight after debut(96).","9":"Chris Gayle is the only batsman to hit a six off the first ball of a Test match.","10":"Adam Gilchrist holds the record for playing the most number of Tests straight after debut.(96)","11":"The energy used to score 3 million boundaries is equivalent to the energy required by one household in India."}
    render json: {facts: facts[:"#{rand(1..11)}"]}, status: 200 

  end

end
