require "readme-score"
require "readme-score/document"
require "thor"
require "readme/score/definitions"

module Readme
  module Score
    module Cli
      class CLI < Thor

        attr_accessor :metrics

        def initialize(use_github_api = false)
          ReadmeScore.use_github_api = use_github_api
          @metrics = Readme::Score::Definitions.new().to_h
        end

        desc "evaluate", "Appraise the quality of a README from a Terminal"
        method_option :source, :aliases => "-s"
        def evaluate(source)
          evaluation = to_evaluation(to_score(source))
        end

        desc "score", "Create a ReadmeScore::Document::Score"
        def to_score(source)
          contents = File.read(source)
          html = ReadmeScore::Document::Parser.new(contents).to_html
          return ReadmeScore::Document.new(html).score
        end

        desc "appraise", "Create a decorated ReadmeScore::Document::Score"
        def to_evaluation(score)
          breakdown = score.breakdown(false).to_h          
          total = score.to_i
          evaluation = { 
            :appraisal => breakdown,
            :err => nil, 
            :score => total,
            :url => nil
          }
          return evaluation
        end
      end
    end
  end
end