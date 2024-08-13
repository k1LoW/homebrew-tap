class Tmpmod < Formula
  desc 'tmpmod is a tool for temporary use of modified modules.'
  version '0.4.0'
  homepage 'https://github.com/k1LoW/tmpmod'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.0/tmpmod_v0.4.0_darwin_arm64.zip'
      sha256 '3e0a4d6b01e374ff7e366db6080309b1ed5c32ab7f96899c1d797dd8a57feb0e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.0/tmpmod_v0.4.0_darwin_amd64.zip'
      sha256 '42b6385cd0e0806cc4632272857ec1388f042957f5dbf87fdf13d2b024eed549'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.0/tmpmod_v0.4.0_linux_arm64.tar.gz'
      sha256 'ba742e9e3de1477c363d680fcc1b21c6c7e14057e099bcf57efa4ba5ef74e47c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.0/tmpmod_v0.4.0_linux_amd64.tar.gz'
      sha256 'abe851005cddd0464ded7f120b3ed98c4a0044e153f35f598de51711b8756521'
    end
  end

  head do
    url 'https://github.com/k1LoW/tmpmod.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tmpmod'
  end
end
