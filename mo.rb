class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.17.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.17.0/mo_v0.17.0_darwin_arm64.zip'
      sha256 '75dbc71f8fc40131516188889c41833a793b856021a9ef6989c3e67af6446025'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.17.0/mo_v0.17.0_darwin_amd64.zip'
      sha256 '9ba332af7cedd711c9a948a994bc7789fbf98944169a3d8370d4e7e1b819cb7d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.17.0/mo_v0.17.0_linux_arm64.tar.gz'
      sha256 'ab71d127244237fca09eb957aecee9c49560e321b1543e96a794c3c7c1298fe9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.17.0/mo_v0.17.0_linux_amd64.tar.gz'
      sha256 'a4e5c30bd59d9560d02b82db5ae754511efbe4be23ad291180cbbf4341215a17'
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
