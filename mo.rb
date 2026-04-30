class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.5.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.0/mo_v1.5.0_darwin_arm64.zip'
      sha256 'd35b631e4481c9fd2070a13d587d1a383b177e57604d6826e9fa5bcd5c4ae2a2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.0/mo_v1.5.0_darwin_amd64.zip'
      sha256 'c62bf279a06567de31a20262eb490c4b231e12f48b3303cd32fc73616f7ca6db'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.0/mo_v1.5.0_linux_arm64.tar.gz'
      sha256 'f067519fd6daed0d679bc2f13d082d28815184f4b23d2b780d69833a783df444'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.0/mo_v1.5.0_linux_amd64.tar.gz'
      sha256 '9abd7d8c7d3ef6138c3f60c280d2aeb9af56d9554f9bf5f6b203f71d119b15e9'
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
