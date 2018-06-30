class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '0.9.1'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 '174c0773a3bac30e771be6d4f8cb58cd70eb8d65bf7b1e8a15dc6d698f5913c8'

  def install
    bin.install 'tbls'
  end
end
