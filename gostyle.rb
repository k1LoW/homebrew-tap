class Gostyle < Formula
  version '0.21.0'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.21.0/gostyle_v0.21.0_darwin_arm64.zip'
      sha256 '14a24fcb3b0d7ca767bcc3a704d8d24fdf98b8e92e21cc50af784358bbd78557'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.21.0/gostyle_v0.21.0_darwin_amd64.zip'
      sha256 'b05d4842d97ddd732e0d98a9d48a94fe4b0de33745c7f9d97de96d131ea24756'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.21.0/gostyle_v0.21.0_linux_arm64.tar.gz'
      sha256 'd1a526363710fd01ab3f0e1aa3e45c5530c25c69852ccd166ed15cfe857d8088'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.21.0/gostyle_v0.21.0_linux_amd64.tar.gz'
      sha256 'd0825514a35ad49ed5d48273e9106d2c01b9fa27963e4b4a40d8cb0cc0e22037'
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
