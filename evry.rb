class Evry < Formula
  desc 'evry split STDIN stream and execute specified command every N lines/seconds.'
  homepage 'https://github.com/k1LoW/evry'
  version '0.1.2'
  url "https://github.com/k1LoW/evry/releases/download/v#{version}/evry_v#{version}_darwin_amd64.zip"
  sha256 '1d927aad667ffc2b6eabab4bd9ea8724026806de31abd18043ca07db474aea56'

  def install
    bin.install 'evry'
  end
end
