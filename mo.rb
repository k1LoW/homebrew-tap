class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.6.2'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.2/mo_v1.6.2_darwin_arm64.zip'
      sha256 'bfdbf54af2aafcd79b985abc974fed0545472dbcc07f7aa81d81d0ca9b4ea148'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.2/mo_v1.6.2_darwin_amd64.zip'
      sha256 '156ad15caea989ab50415b5bc0d525392f97b6577d0f812ca0217ab9767ec929'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.2/mo_v1.6.2_linux_arm64.tar.gz'
      sha256 'd928b3ad188903cd2a71a10a863db0573a11d13fe935c3206555e6d814eb25f8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.2/mo_v1.6.2_linux_amd64.tar.gz'
      sha256 '7e576572073885d28b8c45d801bfe1c283ee2424dc1cd55df4460fe7146a6b66'
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
