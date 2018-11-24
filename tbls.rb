class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '1.5.1'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 'b91f12d223d55d0b189a6420106d77a5f4ae52f54602de2f9f0c8a82c826ac25'

  def install
    bin.install 'tbls'
  end
end
