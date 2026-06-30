class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.9.4'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.9.4/runn_v1.9.4_darwin_arm64.zip'
      sha256 '20cc0cf61c37730e7622c3d4abf8381819a14f63790a9d258df8cedc9b55f1c2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.9.4/runn_v1.9.4_darwin_amd64.zip'
      sha256 'a782d3e31a4c843e94536f1277bd41793d26b7d1156377efd11b955e1316369e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.9.4/runn_v1.9.4_linux_amd64.tar.gz'
      sha256 'ccdbb6338223e3fa61f0a4da992fcdb55a562955b6a5c72b45063bea4cee50a2'
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
