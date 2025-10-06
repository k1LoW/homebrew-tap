class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.138.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.138.0/runn_v0.138.0_darwin_arm64.zip'
      sha256 '166371b411bda79facdf709b76ee3788ba39744c3427608677ff82ae29379dc3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.138.0/runn_v0.138.0_darwin_amd64.zip'
      sha256 'ae64b81d8ca74db3b6b719580a08a15e67a4a12659362ad236f09d2e61166581'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.138.0/runn_v0.138.0_linux_amd64.tar.gz'
      sha256 '108126b1612f7a7a66d651920ef384c3520ec4427692206f401213f4341235b4'
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
