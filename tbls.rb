class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '1.0.1'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 '83e077d648c9a1fc49d32c79483eae87774e1834b28663b5528112aebc3f73ad'

  def install
    bin.install 'tbls'
  end
end
