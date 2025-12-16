class Cuestr < Formula
  desc 'cuestr is a utility tool for string literals in CUE files.'
  version '0.4.2'
  homepage 'https://github.com/k1LoW/cuestr'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.4.2/cuestr_v0.4.2_darwin_arm64.zip'
      sha256 'd9f294c571ee14de4241bd35925c085e1dabab838d6e2211a8598f0e30c97afa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.4.2/cuestr_v0.4.2_darwin_amd64.zip'
      sha256 'aa35c56350a0a46f3673e0c24e3356f84697a89ca9e9977851ce12a8ab780aff'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.4.2/cuestr_v0.4.2_linux_arm64.tar.gz'
      sha256 'b901f0c6baba2e678f7031a0a940c70ab298f94ec0ff9c534e6d450d8c7c6b01'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.4.2/cuestr_v0.4.2_linux_amd64.tar.gz'
      sha256 'a92491d26ee57fd79c5de73b5b5e27bc830f19deafddb67614996635ec063fa9'
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
