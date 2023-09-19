class Gostyle < Formula
  version '0.13.2'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.13.2/gostyle_v0.13.2_darwin_arm64.zip'
      sha256 '351b0303111788deaf9e72b02d05db4e35da98b2909c3ea046eab51fa1710c5e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.13.2/gostyle_v0.13.2_darwin_amd64.zip'
      sha256 '87b483934249a1dfe1146dfa01a739240c67976becf48816d8aca83ec7533eae'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.13.2/gostyle_v0.13.2_linux_arm64.tar.gz'
      sha256 'f64bb17b244ca3b719ab24a5b5ad18e70d4fc01a640aa2b438d964dcf83bb674'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.13.2/gostyle_v0.13.2_linux_amd64.tar.gz'
      sha256 '13423b470b68e401d2ca7da4f8632eb1b90c3a516e28daa520872a59857c832f'
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
