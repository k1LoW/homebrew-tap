class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '1.8.3'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 '2bf1fa4fea607a512966e7bc6ff53784f17b167cb3dfd628258e910dc651890b'

  def install
    bin.install 'tbls'
  end
end
