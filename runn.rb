class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.10.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.10.0/runn_v1.10.0_darwin_arm64.zip'
      sha256 'b5d55dea66030feb2757f331748a76ba58c19128c6abb611f94d94c483735bbf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.10.0/runn_v1.10.0_darwin_amd64.zip'
      sha256 '2bc21a2d2985483fbe87346950d6684582cc41b9616bd2aea231a0225a403824'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.10.0/runn_v1.10.0_linux_amd64.tar.gz'
      sha256 '8e62268c5007a64fb5c4f6f06a8654f89972a7b713bf579f0ca9273dbd931570'
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
