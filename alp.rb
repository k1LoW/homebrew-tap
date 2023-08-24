class Alp < Formula
  desc 'Access Log Profiler'
  homepage 'https://github.com/tkuchiki/alp'
  version '1.0.15'

  if OS.mac?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.15/alp_darwin_amd64.tar.gz'
    sha256 '3cf87e35a5e30f094383bcc5ad68405e8e4f160d52028518cdeb4038cd2c96c6'
  elsif OS.linux?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.15/alp_linux_amd64.tar.gz'
    sha256 '39e9fd114ff5f1e4b480461893f5ad87a1a9776a25837081d4dfd22d2d6477e2'
  end

  def install
    bin.install 'alp'
  end
end
