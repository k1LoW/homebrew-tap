class Alp < Formula
  desc 'Access Log Profiler'
  homepage 'https://github.com/tkuchiki/alp'
  version '1.0.13'

  if OS.mac?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.13/alp_darwin_amd64.tar.gz'
    sha256 '845ee66a8431d3895182167aa9576082646ae6e8e100225b63c496c82c86d0e1'
  elsif OS.linux?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.13/alp_linux_amd64.tar.gz'
    sha256 '5d63c6712522f901c379bfbcbf1562a70c82410409434516b42adf3478143a44'
  end

  def install
    bin.install 'alp'
  end
end
