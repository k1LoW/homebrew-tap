class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.4.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.4.1/mo_v1.4.1_darwin_arm64.zip'
      sha256 '80c92fae9fbb93eb4c62d0eb23a25616c355ad7b467bab5f38f377836fa23aed'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.4.1/mo_v1.4.1_darwin_amd64.zip'
      sha256 'c80f0c247694a6bd2abcc376d351b8f4eea70872c7be030ef45d30bd3c913b6d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.4.1/mo_v1.4.1_linux_arm64.tar.gz'
      sha256 '958acf7b19d3421097c9ed5435d1a0dd2f1df3ecb2be195387ebe9ecb965834e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.4.1/mo_v1.4.1_linux_amd64.tar.gz'
      sha256 '74bfc06122792e2a2304c5fc93df01a8db66fb8299dfa9d1e0560bed03b635fd'
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
