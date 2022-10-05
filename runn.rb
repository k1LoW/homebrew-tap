class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.37.4'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.37.4/runn_v0.37.4_darwin_arm64.zip'
      sha256 '9d0e2b0ed3e7542924212b723b5c5819b593dd2adb4c787767ee1bab9f138ccd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.37.4/runn_v0.37.4_darwin_amd64.zip'
      sha256 'e1ff541c5f067911bb9e801fa441b85a7aa5c63d1c7b5a01998c6336bd8061ed'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.37.4/runn_v0.37.4_linux_amd64.tar.gz'
      sha256 'f9b85b965f89aeceb59dc1574c4834a76b37ab2ad685865d4413e6d94fe98f85'
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
