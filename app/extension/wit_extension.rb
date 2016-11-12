require 'wit'
require 'singleton'

class WitExtension
  include Singleton

  def initialize
    access_token = 'XHORMFJ4NDF4MYIR36ZDIIF7WUVZHZAT'
    actions = {
        send: -> (request, response) {
          puts("sending... #{response['text']}")
        },
        getScores: -> (request) {
          context = request['context']
          entities = request['entities']

          loc = first_entity_value(entities, 'location')
          if loc
            context['forecast'] = 'sunny'
          else
            context['missingLocation'] = true
            context.delete('forecast')
          end

          return context
        },
        getSolarSaving: -> (request) {
          context = request['context']
          entities = request['entities']

          loc = first_entity_value(entities, 'location')
          if loc
            context['forecast'] = 'sunny'
          else
            context['missingLocation'] = true
            context.delete('forecast')
          end

          return context
        },
        getRandomTrivia: -> (request) {
          context = request['context']
          entities = request['entities']

          loc = first_entity_value(entities, 'location')
          if loc
            context['forecast'] = 'sunny'
          else
            context['missingLocation'] = true
            context.delete('forecast')
          end

          return context
        },
        getIntroTrivia: -> (request) {
          context = request['context']
          entities = request['entities']

          loc = first_entity_value(entities, 'location')
          if loc
            context['forecast'] = 'sunny'
          else
            context['missingLocation'] = true
            context.delete('forecast')
          end

          return context
        },
        getLinkedData: -> (request) {
          context = request['context']
          entities = request['entities']

          loc = first_entity_value(entities, 'location')
          if loc
            context['forecast'] = 'sunny'
          else
            context['missingLocation'] = true
            context.delete('forecast')
          end

          return context
        }
    }
    @client = Wit.new(access_token: access_token, actions: actions)
  end

  def client
    return @client
  end

  def set_conversation(conversation)
    @conversation = conversation
  end

  private

  def first_entity_value(entities, entity)
    return nil unless entities.has_key? entity
    val = entities[entity][0]['value']
    return nil if val.nil?
    return val.is_a?(Hash) ? val['value'] : val
  end

end