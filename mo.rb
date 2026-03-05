class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.13.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.13.0/mo_v0.13.0_darwin_arm64.zip'
      sha256 '62c20092253d545d97b88af91574df2a9d182efe116784dbc0c3a3f54fc9e63c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.13.0/mo_v0.13.0_darwin_amd64.zip'
      sha256 '96386e8440cf37f25bf7b148cf868f3de6ed78e057506173fc9868925f4b0325'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.13.0/mo_v0.13.0_linux_arm64.tar.gz'
      sha256 'd636e41dc7e67e94aac1f220d97bd7be34393630aac8732ab6287177127dab1a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.13.0/mo_v0.13.0_linux_amd64.tar.gz'
      sha256 '6565772853a827834e53d5fa3132a203026047d058965d8366c95029bdb3e13b'
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
