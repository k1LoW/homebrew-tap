class Alp < Formula
  desc 'Access Log Profiler'
  homepage 'https://github.com/tkuchiki/alp'
  version '1.0.0'

  if OS.mac?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.0/alp_darwin_amd64.zip'
    sha256 'daa020e728000bcfe1991425a6e22a389bc09e293c2cdb518e243378fbe09df1'
  elsif OS.linux?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.0/alp_linux_amd64.zip'
    sha256 '67b1c1192496750226048144168536ecd9bc6fd1068183f2a5c893e1f7a3e6f9'
  end

  def install
    bin.install 'alp'
  end
end
