class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.22.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.22.0/mo_v0.22.0_darwin_arm64.zip'
      sha256 'd829dee72563a636da6942ffed216ea1725c0f8f6bac4490219485d7a549b020'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.22.0/mo_v0.22.0_darwin_amd64.zip'
      sha256 'c5cc560f3e66edfd0a311882ea0604887dfee83777f4a1c5df4da35ea7515c02'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.22.0/mo_v0.22.0_linux_arm64.tar.gz'
      sha256 'b7cf79f0bb812619e6a9b180863086103939a51154653c1fe904b84cf378ffa9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.22.0/mo_v0.22.0_linux_amd64.tar.gz'
      sha256 'dada4d9123fc2ba5829e212e97c5828fc8561eee151245a55d24b107d2aa2531'
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
