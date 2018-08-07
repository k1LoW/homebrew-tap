class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '1.2.0'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 '6d28bc06d72b7d763eaff68a8ad4a2d1a7a671372bcce72b7227148ac05f4855'

  def install
    bin.install 'tbls'
  end
end
