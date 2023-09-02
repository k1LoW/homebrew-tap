class Alp < Formula
  desc 'Access Log Profiler'
  homepage 'https://github.com/tkuchiki/alp'
  version '1.0.16'

  if OS.mac?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.16/alp_darwin_amd64.tar.gz'
    sha256 '6af543c2d8a7ea26b9441722f7675bca9676f7bbcad0a9386dbe2813a0d7dbfc'
  elsif OS.linux?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.16/alp_linux_amd64.tar.gz'
    sha256 'eb79c24e83824217b1d9532692523c9cd4b55474d7ff3fded8bb2dd58042233a'
  end

  def install
    bin.install 'alp'
  end
end
