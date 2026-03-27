class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.6.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.6.2/runn_v1.6.2_darwin_arm64.zip'
      sha256 '8c833d602e53ed586f03b46643b3b45b5f51d63ae704ba968a76c06eb2c812eb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.6.2/runn_v1.6.2_darwin_amd64.zip'
      sha256 '0a94c5b91bda3cc5dcab35a924c119d7e7fa9ac2084daaca13b6a5a9859ab8e0'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.6.2/runn_v1.6.2_linux_amd64.tar.gz'
      sha256 '3e7db9284f88812f0679ef6cffe2dfeb1cd8fcbab27d731c4f3504f345dfa656'
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
