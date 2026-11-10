class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.8.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.8.0/mo_v1.8.0_darwin_arm64.zip'
      sha256 'e533b07109a6dc7cf2be5ce16e1bbc3b5fb6891efeacd951b2b17bda4aa80028'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.8.0/mo_v1.8.0_darwin_amd64.zip'
      sha256 'bfd7b378c3f7dd0ac288db74f3a143c49b7a7ebf6a27a32395a5a79b708223cb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.8.0/mo_v1.8.0_linux_arm64.tar.gz'
      sha256 'cd12fffedc2e00ea0587411e40d76036d189ad584eb0b542ab555f4a92041568'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.8.0/mo_v1.8.0_linux_amd64.tar.gz'
      sha256 'd5c19224248756bd6948d1f549c876bf5f6540ae3d74bf4799cb12d87a5f8f4b'
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
