class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.47.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.47.3/runn_v0.47.3_darwin_arm64.zip'
      sha256 'ae105cc832270feb55cd3036ba4ecf5df418cb94600c0d1f905d652e1c448203'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.47.3/runn_v0.47.3_darwin_amd64.zip'
      sha256 '20fa1db24a3390b3e35e608485f0fc8f6e480cf5b9e40c0453f9b85154dccbf3'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.47.3/runn_v0.47.3_linux_amd64.tar.gz'
      sha256 '06688e4b047cb57fa12fa27203555a979f1827a75d5518c738543f5907199260'
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
