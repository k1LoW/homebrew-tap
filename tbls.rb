class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '0.10.0'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 'fd202b2aa875c97afc6cc05b70a7ed5e171ffa34395a05d88c01c537a3042dbe'

  def install
    bin.install 'tbls'
  end
end
