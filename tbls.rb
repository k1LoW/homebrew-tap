class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '0.8.2'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 '0391b362aa49d9cf6a0307ba5cae64f37d5e8e7924f61e96c268f3339cc2c704'

  def install
    bin.install 'tbls'
  end
end
