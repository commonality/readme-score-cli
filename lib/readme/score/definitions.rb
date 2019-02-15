module Readme
  module Score
    class Definitions
      attr_accessor :metrics
      def initialize
        @metrics = [
          {
            metric: :number_of_code_blocks,
            description: "Number of code blocks",
            value_per: 5,
            max: 40
          },
          {
            metric: :number_of_non_code_sections,
            description: "Number of non-code sections",
            value_per: 5,
            max: 30
          },
          {
            metric: :has_lists?,
            description: "Has any lists?",
            value: 10
          },
          {
            metric: :number_of_images,
            description: "Number of images",
            value_per: 5,
            max: 15
          },
          {
            metric: :number_of_gifs,
            description: "Number of GIFs",
            value_per: 5,
            max: 15
          },
          {
            metric: :cumulative_code_block_length,
            description: "Amount of code",
            value_per: 0.0009475244447271192,
            max: 10
          },
          {
            metric_name: :low_code_block_penalty,
            description: "Penalty for lack of code blocks",
            metric: :number_of_code_blocks,
            if_less_than: 3,
            value: -10
          }
        ]
      end

      def to_h
        @metrics.group_by { |metric| metric[:metric]}.values
      end
    end
  end
end