class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.84.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.84.1/runn_v0.84.1_darwin_arm64.zip'
      sha256 '89348214917cac497b347ff59633d39891801c13ab60bd284a5bb0077898602d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.84.1/runn_v0.84.1_darwin_amd64.zip'
      sha256 '11b027a555ea5a7aaa4fc0bf659145e1f097df8b9deafa2dee9f84154330f617'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.84.1/runn_v0.84.1_linux_amd64.tar.gz'
      sha256 '17d92cc272b424ef98ed545d2ee0aefb5897d6a7bd242a0a76edc699a7575b01'
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
