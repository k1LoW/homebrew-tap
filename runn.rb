class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.128.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.128.2/runn_v0.128.2_darwin_arm64.zip'
      sha256 '01dc2a65b169c0bb096dae59b68b4ba8190ec6d54384af71aa9ed90fffd091eb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.128.2/runn_v0.128.2_darwin_amd64.zip'
      sha256 '94d48be1ac69e5b047049768aab0f2f5b29b061b4db9c2284697479ff7e395cf'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.128.2/runn_v0.128.2_linux_amd64.tar.gz'
      sha256 '7665f6663647e2b15147b0fe8a67936d6c09dbc200a54f802ae8d20689c3a48e'
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
