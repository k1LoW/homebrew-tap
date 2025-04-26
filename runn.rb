class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.129.5'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.129.5/runn_v0.129.5_darwin_arm64.zip'
      sha256 'ee46e43adfb898e13b82df01f9d07d48f830174cc8ba523111c7890a2f53eaba'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.129.5/runn_v0.129.5_darwin_amd64.zip'
      sha256 '5926e85ba0d634dd2f5f1c8a6f22b15b84451ded40eb5afda0ec9e8c2bbb68e4'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.129.5/runn_v0.129.5_linux_amd64.tar.gz'
      sha256 'a0a060a84f73a524a6585f0190b052ae58c943bd52b0a0dc13adecaeb2fb1b2e'
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
