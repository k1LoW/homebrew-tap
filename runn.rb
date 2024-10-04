class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.120.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.120.0/runn_v0.120.0_darwin_arm64.zip'
      sha256 '514fe33b46f489e2d6b09405bd2a0a01c30ed365a55bc3cb31077bb8810b4d28'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.120.0/runn_v0.120.0_darwin_amd64.zip'
      sha256 '42739391b6da2467ddef5b4ad29fd347ae7b6b0d460fa041357010f181bec133'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.120.0/runn_v0.120.0_linux_amd64.tar.gz'
      sha256 '6cbd31e80f28970744597ed817479af21b724efe5c0ed25e0747f425fafef2e6'
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
