class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.8.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.8.0/mo_v0.8.0_darwin_arm64.zip'
      sha256 '666c4a1406143e72e67bad398cbb6f2a4f163a2fe396d909d127668d66debdd1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.8.0/mo_v0.8.0_darwin_amd64.zip'
      sha256 '824c362c50ecc7f0124eb2a92d69a1048e9c119dece96778fb7e8ee72410f61c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.8.0/mo_v0.8.0_linux_arm64.tar.gz'
      sha256 'd4f3c460a3e694283cf22d3af8f4907d7f1b8eeb2ee00525f91437b39068d9db'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.8.0/mo_v0.8.0_linux_amd64.tar.gz'
      sha256 'c879aacbfff2cfdb41b8324822e88ff951ab8d807f21599bc75169b921b004d5'
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
