class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.42.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.42.0/runn_v0.42.0_darwin_arm64.zip'
      sha256 '811bf6f24e0671d8be0f13045e92f9ee5e1bce9c665b5112609c04ebacbb205f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.42.0/runn_v0.42.0_darwin_amd64.zip'
      sha256 'dc8f2630f1b2fda4df9684d460a24c9330bd01593f83005546ed15415cd76838'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.42.0/runn_v0.42.0_linux_amd64.tar.gz'
      sha256 '926a1714317c1937e8d1e8aa20d81991806971f8f8512b827351f5160bcd2517'
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
