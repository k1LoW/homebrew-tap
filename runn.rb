class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.122.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.122.1/runn_v0.122.1_darwin_arm64.zip'
      sha256 'c01f512c83a374ce7cb753fc7709d085bb0928eeddba7c37e40ef530b09b0f24'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.122.1/runn_v0.122.1_darwin_amd64.zip'
      sha256 'a58711ae5fce36190dd0ec0910dc2c4333c8b7311c9f49935f3960f6c5cbed6c'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.122.1/runn_v0.122.1_linux_amd64.tar.gz'
      sha256 '674c8901b3f41275950f6461067891db122329b607d0008ec3fc007ace6d508c'
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
