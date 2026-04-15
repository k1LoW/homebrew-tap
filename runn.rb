class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.9.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.9.1/runn_v1.9.1_darwin_arm64.zip'
      sha256 'ce020224bff9ea9d090c30d589e45b1c03fd918ecb1d0129a70555aafe01d117'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.9.1/runn_v1.9.1_darwin_amd64.zip'
      sha256 'cedef2b3f0e203ebe94c518e572ada6baf1bfa4bfb2bd10c19421ac8303293df'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.9.1/runn_v1.9.1_linux_amd64.tar.gz'
      sha256 'ee52e876474c660f891befec81608453a426c8c8ea988271b6d83d8b93be2409'
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
