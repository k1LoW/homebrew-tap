class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '0.10.1'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 '84a5bb0773150d8eca9b2097abd7487c6d2c7ffc09d7b5d2df5e1fc17e8a51df'

  def install
    bin.install 'tbls'
  end
end
