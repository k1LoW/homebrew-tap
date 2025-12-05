class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.1.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.1.1/runn_v1.1.1_darwin_arm64.zip'
      sha256 'f379c522f50752563c9b01f37743e856c3a9820369572ad0f290967718b06425'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.1.1/runn_v1.1.1_darwin_amd64.zip'
      sha256 '2d57f7ce2ce9111f6f5ef66ccca6311e0eaae5464e5ff75a40586bff50d2a5d8'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.1.1/runn_v1.1.1_linux_amd64.tar.gz'
      sha256 '74509a65b00e308e86e59875dd710b32d71e989b71e22b92be5bc1140f2a9ef2'
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
