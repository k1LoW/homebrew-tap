class Alp < Formula
  desc 'Access Log Profiler'
  homepage 'https://github.com/tkuchiki/alp'
  version '1.0.20'

  if OS.mac?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.20/alp_darwin_amd64.tar.gz'
    sha256 '04996fcbe18fb7b6aa191e0e7479c3faf4ad5bab2ee16f250f28468ed92b049a'
  elsif OS.linux?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.20/alp_linux_amd64.tar.gz'
    sha256 '7a4f2ca387607417fa31ef3ebbf981b03a388298e3623a15cec8a55def2c2719'
  end

  def install
    bin.install 'alp'
  end
end
