class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.56.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.56.2/runn_v0.56.2_darwin_arm64.zip'
      sha256 'fe73d090f4a34fd359235f1d392298b7094a4963ed7c6d31f0ee962528e52c39'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.56.2/runn_v0.56.2_darwin_amd64.zip'
      sha256 'a31f805b4c5f84b5646d8267cf156865f7d47be69a62ca2ceb0c6fe563da00ca'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.56.2/runn_v0.56.2_linux_amd64.tar.gz'
      sha256 '3ebbb6d2fcb46db7cf14062d339e25bb6930d27fa92ad545b8c701def1a62881'
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
