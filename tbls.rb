class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '1.6.0'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 'fbfe3458f02caa7ddf95f1e17fe108ba9e2c06769d369df3c474a6c15cf3fbab'

  def install
    bin.install 'tbls'
  end
end
