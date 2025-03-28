class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.129.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.129.2/runn_v0.129.2_darwin_arm64.zip'
      sha256 '110a7e149c32ee69a883cf94d2736b0cd80371e316a4a931e3d12b0d1f1ae6fe'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.129.2/runn_v0.129.2_darwin_amd64.zip'
      sha256 'd960d8ca39f748f4542bb70a27dc78d373ce2901f513fa1816eefea8946f5b4e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.129.2/runn_v0.129.2_linux_amd64.tar.gz'
      sha256 '95486205b4e6660dde0aca98e59e9dd73ed35232830b74666c3d1a48f60b211f'
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
