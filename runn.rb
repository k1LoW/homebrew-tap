class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.49.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.49.2/runn_v0.49.2_darwin_arm64.zip'
      sha256 'd5edc42e9cff038b5abc59ca828cb50e206ea187416f1c6f1593de7d08feacf4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.49.2/runn_v0.49.2_darwin_amd64.zip'
      sha256 '37e7820762db557041fab79860452651f409bd6678dca84bc37dafe57bc499fb'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.49.2/runn_v0.49.2_linux_amd64.tar.gz'
      sha256 '945eb823f54c190fa1f66585e694d533d22c7fb441bd5e1ec20a573f8de35365'
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
