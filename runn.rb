class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.74.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.74.0/runn_v0.74.0_darwin_arm64.zip'
      sha256 'a74984a4d014d2b7d1c61c175c3d29429dbd8040ae333cbb9fb259787324328a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.74.0/runn_v0.74.0_darwin_amd64.zip'
      sha256 '04606e0783f150ef09bf8cf2177aa842207ae7a2c39c58e664f62e65b26dbfe2'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.74.0/runn_v0.74.0_linux_amd64.tar.gz'
      sha256 '33913a4ca16c0ecc9d42bb65fc055be55f8cfeb7e38aded9f9c4e439e9ae6233'
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
