class Alp < Formula
  desc 'Access Log Profiler'
  homepage 'https://github.com/tkuchiki/alp'
  version '1.0.17'

  if OS.mac?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.17/alp_darwin_amd64.tar.gz'
    sha256 'a6818ec7d3be2fd82974fb0aa8eae1f872b0e8ad3d09c9ff66f39c5fd1c7afa3'
  elsif OS.linux?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.17/alp_linux_amd64.tar.gz'
    sha256 '709403d3d424e570cca266e94b70e9339ed3998e1b03f202808d36a6816c956e'
  end

  def install
    bin.install 'alp'
  end
end
