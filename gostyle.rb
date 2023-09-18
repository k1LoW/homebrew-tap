class Gostyle < Formula
  version '0.12.0'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.12.0/gostyle_v0.12.0_darwin_arm64.zip'
      sha256 '0cfed50ea907c089b002a1053c91149c9e98052e31c935366ab41c594c1a4f38'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.12.0/gostyle_v0.12.0_darwin_amd64.zip'
      sha256 '44fe51944d882f47a3e5b6b05cf67d954ba4c23c55176d9088bf3d6e833ba90e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.12.0/gostyle_v0.12.0_linux_arm64.tar.gz'
      sha256 'c9f69f666348ae579fe186c0943cc73fdb813a5274b48f1f2411edd85b030408'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.12.0/gostyle_v0.12.0_linux_amd64.tar.gz'
      sha256 '6b5e884fa5d7db692b26e22a9ffcf8cb43cd3024a74418819b91dab309ca628c'
    end
  end

  head do
    url 'https://github.com/k1LoW/gostyle.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gostyle'
  end
end
