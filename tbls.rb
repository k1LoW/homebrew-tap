class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '1.7.1'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 'e85061df5656390447f14ca0a35633b25c8ef4311bcbc108f0b9f798362ba636'

  def install
    bin.install 'tbls'
  end
end
