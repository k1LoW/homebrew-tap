class Harvest < Formula
  desc 'Portable log aggregation tool for middle-scale system operation/observation.'
  homepage 'https://github.com/k1LoW/harvest'
  version '0.2.1'
  url "https://github.com/k1LoW/harvest/releases/download/v#{version}/harvest_v#{version}_darwin_amd64.zip"
  sha256 '2e0c551d9adece6789686c734e3cc1484d27646660f96152231843f0fa9e6921'

  def install
    bin.install 'hrv'
  end
end
