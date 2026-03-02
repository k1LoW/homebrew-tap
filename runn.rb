class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.5.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.5.1/runn_v1.5.1_darwin_arm64.zip'
      sha256 '9ce0d8c80003f4be16fba22e7a436dfafb0d296fa44fac0aa479e7b19157c83e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.5.1/runn_v1.5.1_darwin_amd64.zip'
      sha256 '87a2e016c1b3a767e45797b0f136365ced2b14cb22993f4dd5c6ace473de5e21'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.5.1/runn_v1.5.1_linux_amd64.tar.gz'
      sha256 '0f79530a30b1f02d1fd81aec6410c2a8588f0fc2848e7723e92cf68ec32f0d74'
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
