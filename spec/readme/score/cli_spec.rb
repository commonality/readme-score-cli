RSpec.describe Readme::Score::Cli do
  it "has a version number" do
    expect(Readme::Score::Cli::VERSION).not_to be nil
  end

  it "evaluates READMEs from URLs" do
    url = "https://raw.githubusercontent.com/AFNetworking/AFNetworking/master/README.md"
    score = ReadmeScore.for(url)
    expect(score.total_score).to eq 100
  end

  it "evaluates the quality of a README.md" do
    cli = Readme::Score::Cli::CLI.new()
    score = cli.evaluate('./spec/readme/score/fixtures/afnetworking.md')
    # puts score.to_s
  end

  it "displays an error message when no README is found" do
    cli = Readme::Score::Cli::CLI.new()
    expect(cli).not_to be nil
    expect(cli.evaluate('./lib/README.md')).to raise_error()
  end
end
