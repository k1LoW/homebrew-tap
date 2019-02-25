class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '1.8.2'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 'fa8ab7644fa94b87b1e6c4f4ed6b3b75c88120c288bf886035a94f760dc588fd'

  def install
    bin.install 'tbls'
  end
end
