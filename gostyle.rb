class Gostyle < Formula
  version '0.11.0'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.11.0/gostyle_v0.11.0_darwin_arm64.zip'
      sha256 '5f79d78154c710333d3de28e12a567180349ded6ec512204f0fde77e044998d5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.11.0/gostyle_v0.11.0_darwin_amd64.zip'
      sha256 '5c885088d0dcd10e466b50e08199b187ea42b0cee27d249625b997b42a5f136a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.11.0/gostyle_v0.11.0_linux_arm64.tar.gz'
      sha256 '7745a85ef3ee411553d90f52cd84a486730c13a19a2d63ab14608a45bbd7e858'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.11.0/gostyle_v0.11.0_linux_amd64.tar.gz'
      sha256 'b180f3aacc212b5a7d03fc2b331f84adc49dc6271dafb7dc5de0cdf8d1c9f8bd'
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
