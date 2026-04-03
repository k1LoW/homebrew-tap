class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.7.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.7.0/runn_v1.7.0_darwin_arm64.zip'
      sha256 '24cb021522d185c5a79f99cf23493cac5b2b8f9ea60d102ac75ce2169cf7a5bf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.7.0/runn_v1.7.0_darwin_amd64.zip'
      sha256 '8c3764e6f3a35af8d4d43b7f42246dcdbc3e90a75690e1d52df62e27ea11b237'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.7.0/runn_v1.7.0_linux_amd64.tar.gz'
      sha256 '18c09da93b2853dda372334088cc8e000c2eb59fb66cf865735aa804193b94bd'
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
