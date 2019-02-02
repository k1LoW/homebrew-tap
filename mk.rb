class Mk < Formula
  desc 'mk find Makefile by walking up parent directories and execute `make`.'
  homepage 'https://github.com/k1LoW/mk'
  version '0.1.0'
  url "https://github.com/k1LoW/mk/releases/download/v#{version}/mk_v#{version}_darwin_amd64.zip"
  sha256 '06555b40c0d3ef342ec0db62c536a340e66db8d0f9189a772d0e702f2c5ac2c0'

  def install
    bin.install 'mk'
  end
end
