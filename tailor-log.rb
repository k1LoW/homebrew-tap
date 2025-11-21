class TailorLog < Formula
  desc 'tailor-log is a tool for handling logs from a workspace on the Tailor Platform.'
  version '0.5.2'
  homepage 'https://github.com/k1LoW/tailor-log'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.5.2/tailor-log_v0.5.2_darwin_arm64.zip'
      sha256 '98e408c3efced9e57908c7468bf26c400ef0f0a334a3f16e3cbd318a351f4ece'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.5.2/tailor-log_v0.5.2_darwin_amd64.zip'
      sha256 '65d0298a7c140020ce1730cc9580d248556991ca95da6bac7471bcb58d26a91c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.5.2/tailor-log_v0.5.2_linux_arm64.tar.gz'
      sha256 '18091decca900f16e71191806436d5eb52ccb604c748c67cf188b2734411c5fe'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.5.2/tailor-log_v0.5.2_linux_amd64.tar.gz'
      sha256 '624e194045260af406e4e6c971dc9a6e62d6eb6ba85eb42979a6da7d93092344'
    end
  end

  head do
    url 'https://github.com/k1LoW/tailor-log.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tailor-log'
  end
end
