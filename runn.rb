class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.69.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.69.0/runn_v0.69.0_darwin_arm64.zip'
      sha256 'ca87d1ee77ceb893f74fad0b688bc0d343eb75a8a97161b142b3c0a5a591b5b7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.69.0/runn_v0.69.0_darwin_amd64.zip'
      sha256 '5c88c184bc7ff31562ef49165d8421ccc7c6ab9bdcdd0e6accbc5e5dec16d87c'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.69.0/runn_v0.69.0_linux_amd64.tar.gz'
      sha256 '0f7d4469de236994ab5708ca89ce2802cb9b562d4f8933ea2d2c92274c81809e'
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
