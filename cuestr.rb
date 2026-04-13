class Cuestr < Formula
  desc 'cuestr is a utility tool for string literals in CUE files.'
  version '0.4.3'
  homepage 'https://github.com/k1LoW/cuestr'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.4.3/cuestr_v0.4.3_darwin_arm64.zip'
      sha256 'aabee519823dd22b94e697e8161b9195ae0befed161ca7cd5d163215cd8a17e2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.4.3/cuestr_v0.4.3_darwin_amd64.zip'
      sha256 '3e27c00f210178e95a5f42671f09b38b5d7f44838510c6013a97632a6f980395'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.4.3/cuestr_v0.4.3_linux_arm64.tar.gz'
      sha256 'c6d733fa7345ea64b5b6df931db49726edc1cb9fb6d155ab1d5169750fe169b6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.4.3/cuestr_v0.4.3_linux_amd64.tar.gz'
      sha256 '428683edf5af1e2a73075997848c270776f7609f2dbccbcd73f448a206727549'
    end
  end

  head do
    url 'https://github.com/k1LoW/cuestr.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'cuestr'
  end
end
