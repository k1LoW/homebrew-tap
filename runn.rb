class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.130.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.130.2/runn_v0.130.2_darwin_arm64.zip'
      sha256 '18c11c910fc8a0e377fff3a8bffd5d4aaf6c485c2ca20918a4f093eab8a04223'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.130.2/runn_v0.130.2_darwin_amd64.zip'
      sha256 '5464d339ff71043b749dc34f5ade1f8cbc87642793f2063fbeeb89b4b8670862'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.130.2/runn_v0.130.2_linux_amd64.tar.gz'
      sha256 '61fa548c3ae64b58fcb67fa711f3a17d422423a2e882c5403f754f2242f713bf'
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
