class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '1.2.1'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 'f79d22a3cfe0b1d3cf64a72afe057b9686147dd450e6af9cbd2a0d4a9304faa0'

  def install
    bin.install 'tbls'
  end
end
