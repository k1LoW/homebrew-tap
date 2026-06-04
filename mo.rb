class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.5.6'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.6/mo_v1.5.6_darwin_arm64.zip'
      sha256 '737f420617119bcaf9f467cdd638391341154e21c1e23f7deecb2596c2fdb706'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.6/mo_v1.5.6_darwin_amd64.zip'
      sha256 'c6b951885616f5d1030460fa942e071cf64636374f89201427c726b2c4245e93'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.6/mo_v1.5.6_linux_arm64.tar.gz'
      sha256 '610603cd188cabf5acc514850839eb0b58f356db8eedab8af1a7d4d00767f96c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.6/mo_v1.5.6_linux_amd64.tar.gz'
      sha256 '3195dfcd6735fabade901a6153f21cfa61913955f1c50564fdf59c6350cbc2d3'
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
