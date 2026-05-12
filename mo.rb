class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.5.5'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.5/mo_v1.5.5_darwin_arm64.zip'
      sha256 '0773d77f52633fcecfc3ce05d04a6fb9a6b7f57b73c7d40929c9209fbb7869f4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.5/mo_v1.5.5_darwin_amd64.zip'
      sha256 'e72bcb32ea02c1e9b05e0cff73f0934d29669c47a46a302d00aa610a5f657134'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.5/mo_v1.5.5_linux_arm64.tar.gz'
      sha256 '5f6bd7fcf56e8cb03549b0b7f0a8bdbe27a79a0954742ed0d02b0034dd27037e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.5/mo_v1.5.5_linux_amd64.tar.gz'
      sha256 '237f121cc7763cf383679fd918a24c79f59f75af6f35c354e2a00b2e2e144f31'
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
