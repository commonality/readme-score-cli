Feature: CLI
  In order to evaluate README files
  As a CLI
  I want to execute readme-score with the file system

  Scenario: no-README
    When I run `readme-score-cli evaluate --source ./lib/README.md`
    Then the output should contain "No README document found."

  Scenario: evaluate README.md
    When I run `readme-score-cli evaluate --source .`
    Then the output should contain "Evaluating..."