class Envdo < Formula
  version '0.2.1'
  homepage 'https://github.com/k1LoW/envdo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.2.1/envdo_v0.2.1_darwin_arm64.zip'
      sha256 '1f0c55ff034828098598c1137d2b7d7c29c5f01e9437dd14bbb8ff26fac36735'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.2.1/envdo_v0.2.1_darwin_amd64.zip'
      sha256 '7c99199683a66d2dac194ce705cff64bf52e1331e54741571de90c05c8b6ab8e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.2.1/envdo_v0.2.1_linux_arm64.tar.gz'
      sha256 '272fbd08c978da1cb91140924c8cbde5aaab827518ee8639b166916c025a811b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.2.1/envdo_v0.2.1_linux_amd64.tar.gz'
      sha256 '5e0d46da3edfddf4aa8d1b75971351cec5669b4683570eb027ed89330fc51a8a'
    end
  end

  head do
    url 'https://github.com/k1LoW/envdo.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'envdo'
  end
end
