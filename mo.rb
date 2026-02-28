class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.4.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.4.0/mo_v0.4.0_darwin_arm64.zip'
      sha256 '4be86083cb27d6eb90c89ef2965eeced8b25b934be9afaaa67cfe1ceeb595670'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.4.0/mo_v0.4.0_darwin_amd64.zip'
      sha256 '4de96e2318a25c5c83f65bd681380c6eff3dc233c511857154d876a667104109'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.4.0/mo_v0.4.0_linux_arm64.tar.gz'
      sha256 '06fdf5c85b57aac66844a67cbd92e1fe6ef656b96c780c49ab98a86d74e813bc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.4.0/mo_v0.4.0_linux_amd64.tar.gz'
      sha256 'a8627a8a45e46accc257003332d41faba19b6709192d98d52abdb806ff178168'
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
  end
end
