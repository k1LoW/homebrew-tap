class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.36.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.36.2/runn_v0.36.2_darwin_arm64.zip'
      sha256 'bac94df0f2f8d1ac38028825beb39206bc0c58af19b53dd678062999288ba58a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.36.2/runn_v0.36.2_darwin_amd64.zip'
      sha256 '8d668bedb4997d49b67d55bc61075afb075837cffdf97a4ce79f9bd9335880e1'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.36.2/runn_v0.36.2_linux_amd64.tar.gz'
      sha256 'a1132dc18777855f7c474c1e48b6a9e767bc405ec8a499e2d7082364ece6f45c'
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
