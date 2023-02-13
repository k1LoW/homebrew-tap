class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.59.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.59.3/runn_v0.59.3_darwin_arm64.zip'
      sha256 'ab57c998e1b66e5786d9d5c9eb5ab71e548a79bd70e886f84d84c664245ef3e9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.59.3/runn_v0.59.3_darwin_amd64.zip'
      sha256 '7c97492330f689296c81472d2415e2a9b0d64436ff3bf8b88bfe5f918ce97c66'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.59.3/runn_v0.59.3_linux_amd64.tar.gz'
      sha256 '1f92545e4bc70ebd9ae8e14af7ccd54488ddfe8476785714deeddbf9ba606406'
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
