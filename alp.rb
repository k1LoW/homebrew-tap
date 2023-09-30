class Alp < Formula
  desc 'Access Log Profiler'
  homepage 'https://github.com/tkuchiki/alp'
  version '1.0.19'

  if OS.mac?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.19/alp_darwin_amd64.tar.gz'
    sha256 '8c694e711b991059b97511b3fc30206db731a762fe7b4a69f6621f72b01ae927'
  elsif OS.linux?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.19/alp_linux_amd64.tar.gz'
    sha256 'b5e26686624dac8a1c8ed022f015780154c7d9327b4594d25a8ebc775892083e'
  end

  def install
    bin.install 'alp'
  end
end
