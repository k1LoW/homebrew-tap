class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.127.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.127.1/runn_v0.127.1_darwin_arm64.zip'
      sha256 '0cf03a24d9a86c1085eed307588f173521b194136e31371260e2808d032bcbe9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.127.1/runn_v0.127.1_darwin_amd64.zip'
      sha256 'b9907e9b8e2a8a3d1d56464f0ec47a3f4038405ce73a20361aa30fab9ca3a047'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.127.1/runn_v0.127.1_linux_amd64.tar.gz'
      sha256 '588c26cb880c78cc45eabef85cf3cfe96563da7651cf4ff718721e31e6f331ae'
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
