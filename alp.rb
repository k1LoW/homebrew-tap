class Alp < Formula
  desc 'Access Log Profiler'
  homepage 'https://github.com/tkuchiki/alp'
  version '1.0.14'

  if OS.mac?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.14/alp_darwin_amd64.tar.gz'
    sha256 '3ba476adfb4f2dfc89bb8ff7b5e6929e4667c5f825ee0c99db445dd53344c034'
  elsif OS.linux?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.14/alp_linux_amd64.tar.gz'
    sha256 'f9c6c55199e427da77943410f4a43192233ca52df4def0f7c1a2ddadba3a857e'
  end

  def install
    bin.install 'alp'
  end
end
