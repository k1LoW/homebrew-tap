class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.22.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.22.1/mo_v0.22.1_darwin_arm64.zip'
      sha256 '9c3bf9b40ebc4a08cfa1d11d536ce3fad0d5f3b3787841114154490ed51e64ce'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.22.1/mo_v0.22.1_darwin_amd64.zip'
      sha256 '9d8797e56e84a5f9f3e331667b52d18c082b6c6be30c71f41e7ed850c4a4b908'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.22.1/mo_v0.22.1_linux_arm64.tar.gz'
      sha256 '9b71aac3f09d794fdad8c0d9f65d0f381e3e1142afaedf9376132ee1c0fb931d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.22.1/mo_v0.22.1_linux_amd64.tar.gz'
      sha256 '4613e9c7257629873a0ce35382bdd02d6cb1ab5c59447f785d0802492c35fbb8'
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
