class Tack < Formula
  desc 'tack is a one-shot deploy CLI for Tailor Platform Static Website Hosting'
  version '0.2.0'
  homepage 'https://github.com/k1LoW/tack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tack/releases/download/v0.2.0/tack_v0.2.0_darwin_arm64.zip'
      sha256 '45b975cf44b1e4c1d162a7460c38e1135e2cb8c0de59fe8babc29e78df50fe51'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tack/releases/download/v0.2.0/tack_v0.2.0_darwin_amd64.zip'
      sha256 '11ef3d0e22223f4095e4f187bde9bd5e777da835d3d9e44ef58636a0ec5b7980'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tack/releases/download/v0.2.0/tack_v0.2.0_linux_arm64.tar.gz'
      sha256 'ae178dde43ec20bf1a793bce433f2e58acee1b87045ab88f5bd1cd88ea7991a0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tack/releases/download/v0.2.0/tack_v0.2.0_linux_amd64.tar.gz'
      sha256 'c352fb9f521054a7d536e21e214fdfc0e039718f28723cb38b0d80dfbebf6d17'
    end
  end

  head do
    url 'https://github.com/k1LoW/tack.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tack'
    generate_completions_from_executable(bin/'tack', 'completion')
  end
end
