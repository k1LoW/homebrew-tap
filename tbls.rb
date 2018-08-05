class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '1.1.0'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 '5c402cb70068706910238cbe0958cff6de2106b3552c5d29d3be42c8a3b18b9e'

  def install
    bin.install 'tbls'
  end
end
