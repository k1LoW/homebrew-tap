class Alp < Formula
  desc 'Access Log Profiler'
  homepage 'https://github.com/tkuchiki/alp'
  version '1.0.12'

  if OS.mac?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.12/alp_darwin_amd64.tar.gz'
    sha256 '0a5bae8a5766ab4bd2cc4bca6c1ac4ca78104dada9b9a936d050f6ccdb3a92a6'
  elsif OS.linux?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.12/alp_linux_amd64.tar.gz'
    sha256 'c47ab3a4bf556babe728bc17da02d9aabb2087ea26e8adf5d10da8b3d5466018'
  end

  def install
    bin.install 'alp'
  end
end
