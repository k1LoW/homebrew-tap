class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.0.3'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.3/tbls-ask_v0.0.3_darwin_arm64.zip'
      sha256 '43c5d76facba0df680be9531edd15b8386bedfb6e3c516885e8e02663012e742'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.3/tbls-ask_v0.0.3_darwin_amd64.zip'
      sha256 '5154d94e800ee2d686111b7912d84d85da27beb12a86a535d82a8c1dcaa70611'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.3/tbls-ask_v0.0.3_linux_arm64.tar.gz'
      sha256 'cda08582634be1616f8268c078a9ae42e96a06f285bfff9f45a88db86affce75'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.3/tbls-ask_v0.0.3_linux_amd64.tar.gz'
      sha256 '322878cde53acf72bef2d3bd66a2ecd6acd41975a19a234b52a9b3884cd670ed'
    end
  end

  head do
    url 'https://github.com/k1LoW/tbls-ask.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tbls-ask'
  end
end
