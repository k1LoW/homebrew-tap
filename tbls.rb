class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '1.4.0'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 '1202da18eade7a9b6c35c14c7b90f56b461967d3c85246a3872b2715c1340594'

  def install
    bin.install 'tbls'
  end
end
