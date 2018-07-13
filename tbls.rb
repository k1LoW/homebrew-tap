class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '0.9.3'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 '6952d0af9a763bd8f409f7787c0367c93e424ad1d4aebe2e6de167b0a3f23b9d'

  def install
    bin.install 'tbls'
  end
end
