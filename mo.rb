class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.11.4'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.4/mo_v0.11.4_darwin_arm64.zip'
      sha256 '13a3d9825467cb725597f7289dcd25acd3b380fd3202aba256ad290024b3de2e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.4/mo_v0.11.4_darwin_amd64.zip'
      sha256 'bab50fa77b967c77c6e9abdc5d5432ac194b65dc348306388542ce07aea14b04'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.4/mo_v0.11.4_linux_arm64.tar.gz'
      sha256 '79104f0648263a518c7c9239ed7c34aaafa9b6868aaedda9fbd1364b7627b064'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.4/mo_v0.11.4_linux_amd64.tar.gz'
      sha256 'a835bede3a2acf8b3e22b248acd32dab131308c0460b9484fa6525a561fd83ba'
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
