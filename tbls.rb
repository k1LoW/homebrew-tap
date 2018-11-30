class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '1.7.0'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 '391ea2afb240d39020a1a2f1cded029f513883456aa28b8710ba1979c64f7e79'

  def install
    bin.install 'tbls'
  end
end
