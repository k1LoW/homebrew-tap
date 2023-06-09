class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.75.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.75.1/runn_v0.75.1_darwin_arm64.zip'
      sha256 'dc24ebe79118dee13108f9b14b865613e2f7153070a04c40b2644c95023207f4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.75.1/runn_v0.75.1_darwin_amd64.zip'
      sha256 '116a7a66361ad8a129108d246315415e0035bb98b891d23b4ea22e4ef624f295'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.75.1/runn_v0.75.1_linux_amd64.tar.gz'
      sha256 'a4396f5a804c0b5769f82526f034db5c15c2ca999540bbee1ac396f8e8cf78ba'
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
