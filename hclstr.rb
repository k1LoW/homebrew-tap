class Hclstr < Formula
  desc 'hclstr is a utility tool for string literals in HCL files.'
  version '0.2.0'
  homepage 'https://github.com/k1LoW/hclstr'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/hclstr/releases/download/v0.2.0/hclstr_v0.2.0_darwin_arm64.zip'
      sha256 '4337450a574199e76c94e3b9989d3add09f08bf0dbf37afe01a458db42f3bf2c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/hclstr/releases/download/v0.2.0/hclstr_v0.2.0_darwin_amd64.zip'
      sha256 '72f30cbd7d8eac1d7bf2217e6f6417f4fa58aa6bf2d944f53527cff5e35b376d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/hclstr/releases/download/v0.2.0/hclstr_v0.2.0_linux_arm64.tar.gz'
      sha256 '3f1352f00bc8cd43d9d1c8c8139eb8c91895120aab49ae5642e79bfd48279fe8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/hclstr/releases/download/v0.2.0/hclstr_v0.2.0_linux_amd64.tar.gz'
      sha256 'f6730c2d3a999825eed3ab552b404864e8159562aedc2a26a67b09f5a1033a16'
    end
  end

  head do
    url 'https://github.com/k1LoW/hclstr.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'hclstr'
  end
end
