class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.48.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.48.0/runn_v0.48.0_darwin_arm64.zip'
      sha256 'ebc2671596abd95c05ad5a0a5a73a9022d94fecebab8d338c6abfd5cdd325cd7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.48.0/runn_v0.48.0_darwin_amd64.zip'
      sha256 'e24013b9318d92ae48e3055a788a3edd9595623c6f26f5a236a63ec8fe56b3ab'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.48.0/runn_v0.48.0_linux_amd64.tar.gz'
      sha256 '25d473965b88738b2868586e21ac8c48daf99d6b2c7ecf0f42ff7eb30a84a75e'
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
