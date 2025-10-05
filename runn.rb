class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.137.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.137.0/runn_v0.137.0_darwin_arm64.zip'
      sha256 '12e4fdf4ca7ef31b2e65dcc260cbbe0db8f2b86234ae8359910e8ee7713e65f8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.137.0/runn_v0.137.0_darwin_amd64.zip'
      sha256 '9ab1eeb299b5533b023fad7ec9a4bfee9899770c8e8d0dcf791ac2fa85a508a9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.137.0/runn_v0.137.0_linux_amd64.tar.gz'
      sha256 '87d199ec774464dcb518ff9c7e6f3ee0378bd2c3950dacc24272ec8757efc612'
    end
  end

  head do
    url 'https://github.com/k1LoW/runn.git'
    depends_on 'go' => :build
  end

  def install
    system 'make', 'build' if build.head?
    bin.install 'runn'
    output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'bash')
    (bash_completion/'runn').write output
    output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'zsh')
    (zsh_completion/'_runn').write output
  end
end
