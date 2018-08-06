class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '1.1.1'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 '9cfc0782ed30673eea0d6f8c81ac9b6e5e69cc79343de869c11148d9b0663154'

  def install
    bin.install 'tbls'
  end
end
