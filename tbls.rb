class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '1.8.1'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 'fd881208e4edbd74fd7ae077d88c5fa14d818f19c3aa39e8c0c61645b4cbc406'

  def install
    bin.install 'tbls'
  end
end
