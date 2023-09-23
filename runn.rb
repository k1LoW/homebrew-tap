class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.83.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.83.1/runn_v0.83.1_darwin_arm64.zip'
      sha256 '1905fd743d2752a4071815eecfabadee291aba681fc143b85b8cbba20221898b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.83.1/runn_v0.83.1_darwin_amd64.zip'
      sha256 'dd0868c0a765f41ec8ade6dae1d85635604349a3486b13c71cd1029846b07380'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.83.1/runn_v0.83.1_linux_amd64.tar.gz'
      sha256 '708fd0b0b9e5feac34a5c86884eb1640550b33eb66826530930ef106fc7cf16d'
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
