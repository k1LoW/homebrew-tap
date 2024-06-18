class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.112.4'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.112.4/runn_v0.112.4_darwin_arm64.zip'
      sha256 'cb534b2380805733e30c8288ee74ac4ee4aed5354f45c02e608ea2559579ada3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.112.4/runn_v0.112.4_darwin_amd64.zip'
      sha256 '06c642221af1d718f6a90d7497d792939fa876ad62d8b893124ca1795b7b3efb'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.112.4/runn_v0.112.4_linux_amd64.tar.gz'
      sha256 '38f9ca2754386a652d7ee86ebdae53e2cfb6fd919276723ec8fadf41ae069778'
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
