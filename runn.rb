class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.120.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.120.1/runn_v0.120.1_darwin_arm64.zip'
      sha256 'be12457c01d0a2f7c8c5cdc7e6a1acf65526b272fa21c346150a33a0db897eb1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.120.1/runn_v0.120.1_darwin_amd64.zip'
      sha256 '754ac0bee8c785a3ca74ff70fc2098a8a363e7b85280766cb24a3039a8913f23'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.120.1/runn_v0.120.1_linux_amd64.tar.gz'
      sha256 '628870b1e8d34e29a18993638a8eb9b7e8388ef89939954aad82db09135aa773'
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
