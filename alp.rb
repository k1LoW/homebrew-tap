class Alp < Formula
  desc 'Access Log Profiler'
  homepage 'https://github.com/tkuchiki/alp'
  version '1.0.21'

  if OS.mac?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.21/alp_darwin_amd64.tar.gz'
    sha256 'b0bfbbcc7289afa9e8ac7d48200779f3c8203a46ff1b5404f5eea2b6e823a045'
  elsif OS.linux?
    url 'https://github.com/tkuchiki/alp/releases/download/v1.0.21/alp_linux_amd64.tar.gz'
    sha256 '890628b2fe5307b637e4f875fd854a737f787d9ebc73d5f36554cfeaa7acd00d'
  end

  def install
    bin.install 'alp'
  end
end
