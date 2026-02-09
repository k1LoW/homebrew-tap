class Tcmux < Formula
  desc 'tcmux is a terminal and Claude Code mux viewer.'
  version '0.3.2'
  homepage 'https://github.com/k1LoW/tcmux'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.3.2/tcmux_v0.3.2_darwin_arm64.zip'
      sha256 'd0e455d73e7831e1a2b2ea089b048432446a958b73dba43a2bdac633e62045d8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.3.2/tcmux_v0.3.2_darwin_amd64.zip'
      sha256 'bec859859ddae6b518e5ad9091ca74ef85c31d7ab6ecf0f7d5648bbda81f2203'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.3.2/tcmux_v0.3.2_linux_arm64.tar.gz'
      sha256 '6688333761609d1f5848122332fae6956cc33d70f589e6afc2db1b663413d9f7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.3.2/tcmux_v0.3.2_linux_amd64.tar.gz'
      sha256 '421ddeaff1b0f6ed40e43da6d2019a5d97b38a5b0e60877e91c50e8091014bd7'
    end
  end

  head do
    url 'https://github.com/k1LoW/tcmux.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tcmux'
  end
end
