class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.116.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.116.2/runn_v0.116.2_darwin_arm64.zip'
      sha256 'e86b6808b966b040817938425cd8cfd9139fd565f4fffc83e6de734eb43d5a52'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.116.2/runn_v0.116.2_darwin_amd64.zip'
      sha256 'f98bb2ff184e9c12bb6f2e7c2246fe714db31aa1b51f4ac73940f30b322e8e49'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.116.2/runn_v0.116.2_linux_amd64.tar.gz'
      sha256 '8fa96527afa96b883863c7e430a3387f05bc853f3ff30aab2dafe3406dcf64db'
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
