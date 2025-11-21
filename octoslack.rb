class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.13.4'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.4/octoslack_v0.13.4_darwin_arm64.zip'
      sha256 'f3e2dfbfe951fe802da86b99d9e4dd4ef4542d1b830ae26e68a6693832390e32'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.4/octoslack_v0.13.4_darwin_amd64.zip'
      sha256 'e9ae5b70701bbd7c413ca4857d901032db5432c85df1d4f0984cb6f3972ce7b1'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.4/octoslack_v0.13.4_linux_amd64.tar.gz'
      sha256 'a0032c1e8402db70964e05729af9d6800441f01365a2c1d1d278dc03e49e3f91'
    end
  end

  head do
    url 'https://github.com/k1LoW/octoslack.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'octoslack'
  end
end
