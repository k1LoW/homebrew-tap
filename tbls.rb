class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '0.10.2'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 'd291fe156eb262b0b7331baa49f034a5408a581c98f52a1b0336b41c663c7df6'

  def install
    bin.install 'tbls'
  end
end
