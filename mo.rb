class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.5.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.1/mo_v1.5.1_darwin_arm64.zip'
      sha256 '9d813c165a59e68f0d7ac7337fb37e9185504dc3edca5b46a5ba8ec08d286eaf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.1/mo_v1.5.1_darwin_amd64.zip'
      sha256 'f8668afbf7f99d4150ead02bbc3a92c92673b70f88afebc902d2f27e49fb8959'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.1/mo_v1.5.1_linux_arm64.tar.gz'
      sha256 'f2e37af80328c0bd0ca6fa5c7089ecead9cf3bc594318f666560ec8f9b61f3f0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.1/mo_v1.5.1_linux_amd64.tar.gz'
      sha256 '9aa397a3e18a8128e792e49ba1cd321fab1e5a90cdf85c00b32099cbb7e470df'
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
