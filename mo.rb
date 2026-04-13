class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.1.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.1.1/mo_v1.1.1_darwin_arm64.zip'
      sha256 '6be9b6e774f39dbe7773b259d357f4d9e54c4af4e88610c4dc5b84de4e2bb94c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.1.1/mo_v1.1.1_darwin_amd64.zip'
      sha256 'a989e67c5af5a8a72cd261613a226d858e1eef7ddfceb343347bd889442036c5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.1.1/mo_v1.1.1_linux_arm64.tar.gz'
      sha256 '5a70ac26b0b51ed23ebb1e66335d9e7453fae3f5df58ec50ebe3da6f3360a624'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.1.1/mo_v1.1.1_linux_amd64.tar.gz'
      sha256 '5aa67d3dfe5b46eb70c57930e55921f6409653c3e4223c71b95cc78105560474'
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
