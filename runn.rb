class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.111.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.111.0/runn_v0.111.0_darwin_arm64.zip'
      sha256 '0e6ce3efd101651188cd818e21e22c12ac3482cb5ee14360e20ecaf63967e42c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.111.0/runn_v0.111.0_darwin_amd64.zip'
      sha256 '59ef5df7a5373c9784cf72e800b28a07c67dff15b3edd92521cee97cd445ab2b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.111.0/runn_v0.111.0_linux_amd64.tar.gz'
      sha256 'c1fb6adcdf5609212908d09d919428e50c21c8e28dd619dc2b3a08cf485ce4ef'
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
