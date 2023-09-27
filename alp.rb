class Alp < Formula
  desc 'Access Log Profiler'
  homepage 'https://github.com/tkuchiki/alp'
  version '1.0.18'

  if OS.mac?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.18/alp_darwin_amd64.tar.gz'
    sha256 'e4fa06a091d2360f5dc399bbe4c6e3deb931123427f41d1ce6cb87de6cd98939'
  elsif OS.linux?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.18/alp_linux_amd64.tar.gz'
    sha256 'b53e6662d6f2134dd61a63ca9c451c8ceb2a97caa2b133ee6d4bfed52b46a136'
  end

  def install
    bin.install 'alp'
  end
end
