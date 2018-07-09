class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '0.9.2'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 '5197a3c8ebf9f5318ee917f89c28280c398c55ab683255404b6dd7ac7fe6254b'

  def install
    bin.install 'tbls'
  end
end
