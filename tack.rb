class Tack < Formula
  desc 'tack is a one-shot deploy CLI for Tailor Platform Static Website Hosting'
  version '0.3.0'
  homepage 'https://github.com/k1LoW/tack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tack/releases/download/v0.3.0/tack_v0.3.0_darwin_arm64.zip'
      sha256 '74ee698d2c0a19de727ad556f9fa6b6bea96f4b6dd3bc9b4183cffc1c59a8e60'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tack/releases/download/v0.3.0/tack_v0.3.0_darwin_amd64.zip'
      sha256 'edc62bf6d7f5c1733a0be4425258488a7c29e02657bdaeb739a7124ce71c4e16'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tack/releases/download/v0.3.0/tack_v0.3.0_linux_arm64.tar.gz'
      sha256 'e667e16eb0c74dbbaba46d20dad1e1a1e638c1064b9aeab4ffafdf34038111f2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tack/releases/download/v0.3.0/tack_v0.3.0_linux_amd64.tar.gz'
      sha256 '20ec4111d486b1f00ac91ed4b6ea83905fe6d10b5adb24c02360c57f72c931ad'
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
