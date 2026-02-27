class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.1.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.1.1/mo_v0.1.1_darwin_arm64.zip'
      sha256 '0509b6a7903889bcbabdfc93d8b33e3dab1725ee22513c7b7ccb406ee83bac8d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.1.1/mo_v0.1.1_darwin_amd64.zip'
      sha256 '148607170d2953d2595a12fe09099dc65b5bca44345894ed4144e1727fa0cd2e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.1.1/mo_v0.1.1_linux_arm64.tar.gz'
      sha256 '51155699a11514c9b855e2593f9fa118aa377bf12897ff5b3a955f7d3a0c6879'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.1.1/mo_v0.1.1_linux_amd64.tar.gz'
      sha256 'f6e09ed0bf4078aae49dd2e98fd3118b8e9b3fa1878af352cf05d2b3b2a32d27'
    end
  end

  head do
    url 'https://github.com/k1LoW/mo.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mo'
  end
end
