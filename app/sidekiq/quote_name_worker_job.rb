class QuoteNameWorkerJob
  include Sidekiq::Job

  def perform(quote_id)
    quote = Quote.find_by(id: quote_id)

    return unless quote

    quote.update!(name: "#{quote.name} #{rand(100)}")
  end
end
