class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.23.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.0/mo_v0.23.0_darwin_arm64.zip'
      sha256 '63647d2561628e794f0b4890f7b60dd8ab0028cf2306e9a3c4a1fbf30d31c7d1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.0/mo_v0.23.0_darwin_amd64.zip'
      sha256 '6ac6d14150a39ad03f9f468c4c865a34ce57bdbedf87ddbbff678cec2d096ae4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.0/mo_v0.23.0_linux_arm64.tar.gz'
      sha256 '457691040e2e6e3acac986c6cc3950bfff49e9f2a2d85294710b4cb64f828b0e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.0/mo_v0.23.0_linux_amd64.tar.gz'
      sha256 '282076629877fbaec7c967a8ce0adb731184b39988df86685ef244f47260f959'
    end
  end

  head do
    url 'https://github.com/k1LoW/mo.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mo'
    generate_completions_from_executable(bin/'mo', 'completion')
  end
end
