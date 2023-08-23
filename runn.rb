class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.81.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.81.1/runn_v0.81.1_darwin_arm64.zip'
      sha256 '72691daccc8c45ffb02282e9ecc015c53c8d84ee6f4b6abb225eb30cbd663c54'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.81.1/runn_v0.81.1_darwin_amd64.zip'
      sha256 '98955224ab7dd8d25286aca85aa6adfddbab492a37453639e0aea12b118beb8f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.81.1/runn_v0.81.1_linux_amd64.tar.gz'
      sha256 '972d1df1dc0f0bbf6b3f3771d69ec74fcf5fb7cb17ef204d8bfabc30894832bc'
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
