class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.112.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.112.1/runn_v0.112.1_darwin_arm64.zip'
      sha256 '904aacbc0f62e24fab9ab4b8d47a6bfbaede9e8ae54c574d3754ebe937aa3bdf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.112.1/runn_v0.112.1_darwin_amd64.zip'
      sha256 'ea803ca2a759b29ed8560cf911fa43b3fd6e7a8c10703cdda14d99355a0f632f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.112.1/runn_v0.112.1_linux_amd64.tar.gz'
      sha256 'df8657aaccc2a1baab99883a12b54aa39889981601c54c08a5770f59fd7dbb75'
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
