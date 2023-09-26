class Gostyle < Formula
  version '0.18.0'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.0/gostyle_v0.18.0_darwin_arm64.zip'
      sha256 'f803c29aad8893caad60b33bff8f5edf82307ee2dab5d1177faa548bd83b01e0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.0/gostyle_v0.18.0_darwin_amd64.zip'
      sha256 '7dcc23471c83d3716a8ae39c9d7a127c815b0fa2bc4b8f88bca5c972cc66e705'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.0/gostyle_v0.18.0_linux_arm64.tar.gz'
      sha256 '0580f56dadb5ae7aee9201a4623aec87e6358233894b30b60320583a7cd7fb68'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.0/gostyle_v0.18.0_linux_amd64.tar.gz'
      sha256 'f7008c92cfa98d95b3328dcf17fe443a116beeb54f6025149c6f4925f0388117'
    end
  end

  head do
    url 'https://github.com/k1LoW/gostyle.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gostyle'
  end
end
