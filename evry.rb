class Evry < Formula
  desc 'evry split STDIN stream and execute specified command every N lines/seconds.'
  homepage 'https://github.com/k1LoW/evry'
  version '0.1.1'
  url "https://github.com/k1LoW/evry/releases/download/v#{version}/evry_v#{version}_darwin_amd64.zip"
  sha256 '0412a3d94077ad9ff287e6f80cc49e29d3805557c7719b460f045a6ff206f02f'

  def install
    bin.install 'evry'
  end
end
