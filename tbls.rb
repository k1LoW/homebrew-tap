class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '1.0.0'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 '7839f38cf163cadf04feef333735f4746a85a3c38c423d3445bd8c39aa8adce2'

  def install
    bin.install 'tbls'
  end
end
