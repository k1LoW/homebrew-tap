class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.70.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.70.0/runn_v0.70.0_darwin_arm64.zip'
      sha256 'b4b81ec099f158fd2b464bedaff66adcfa5d8dc6c4c310d79fb8863d82058744'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.70.0/runn_v0.70.0_darwin_amd64.zip'
      sha256 'ee27cd719c9639962345d59111205c3060d5e37469a8149c31bc62a9cf0533ce'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.70.0/runn_v0.70.0_linux_amd64.tar.gz'
      sha256 '7868bbd9548b50fca43c6d307c57acf58ebdafe5e45dedb775d8b401e9b839b2'
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
