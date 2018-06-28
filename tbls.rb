class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '0.9.0'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 '9d5f6970031a9e7edc7c8472ab79b4c088319b22c908b5e2078b0beaa0f8e3c1'

  def install
    bin.install 'tbls'
  end
end
