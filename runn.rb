class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.129.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.129.1/runn_v0.129.1_darwin_arm64.zip'
      sha256 'e76f8454eb0ca4e7a4e796b10774b078d4ca43ca33c0adf136cf2683d368ffa9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.129.1/runn_v0.129.1_darwin_amd64.zip'
      sha256 '152a55f90425d8167a1444da6f6b70f8ff1eba55af73acb265e4c47670424471'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.129.1/runn_v0.129.1_linux_amd64.tar.gz'
      sha256 '038aa3adb9c150f2f1581d85272403dd161a0c33ba8212117ef66057dc349253'
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
