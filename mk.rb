class Mk < Formula
  desc 'mk find Makefile by walking up parent directories and execute `make`.'
  homepage 'https://github.com/k1LoW/mk'
  version '0.2.0'
  url "https://github.com/k1LoW/mk/releases/download/v#{version}/mk_v#{version}_darwin_amd64.zip"
  sha256 '81801a0217938a4baa72cc0f629b03213e170d6172a7d41311c86a1c822e6eb5'

  def install
    bin.install 'mk'
  end
end
