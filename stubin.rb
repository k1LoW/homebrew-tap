class Stubin < Formula
  desc 'This is stub binary'
  version '0.0.2'
  homepage 'https://github.com/k1LoW/stubin'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/stubin/releases/download/v0.0.2/stubin_v0.0.2_darwin_arm64.zip'
      sha256 '4f618d3d0f57dd4521e1364c87aab83ba31af086145e15d6375a05aadfe11dc5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/stubin/releases/download/v0.0.2/stubin_v0.0.2_darwin_amd64.zip'
      sha256 '366683fb90aaf3399b212da049e363a82adda7a918f9c7391d4acb66ac225aeb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/stubin/releases/download/v0.0.2/stubin_v0.0.2_linux_arm64.tar.gz'
      sha256 'b9386f48cdc6be074b1dd6dd7d898be3b9b06c666d30670760e519c757541e14'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/stubin/releases/download/v0.0.2/stubin_v0.0.2_linux_amd64.tar.gz'
      sha256 '6a481382fb3a9ce33e80b334c7d9784310a20da569564025a8f6ec53152ffa45'
    end
  end

  head do
    url 'https://github.com/k1LoW/stubin.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'stubin'
  end
end
