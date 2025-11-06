class TailorLog < Formula
  desc 'tailor-log is a tool for handling logs from a workspace on the Tailor Platform.'
  version '0.5.1'
  homepage 'https://github.com/k1LoW/tailor-log'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.5.1/tailor-log_v0.5.1_darwin_arm64.zip'
      sha256 '501c7ae98eccf0ee3b7e198bd21d23d531a33cbd8c65bd1ae7236c67d6a0a8b8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.5.1/tailor-log_v0.5.1_darwin_amd64.zip'
      sha256 '6c3715cdbaa62d32b4766382e8a2e236bb1fe072e0347b57019dce05f72e92d2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.5.1/tailor-log_v0.5.1_linux_arm64.tar.gz'
      sha256 'c30fb5b2576b146ba7fb2948f1cda130bd33c685197702d49cedbe77d4d302bb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.5.1/tailor-log_v0.5.1_linux_amd64.tar.gz'
      sha256 'f94a135a62ccd1e866cf91f96161604b2e49ef6468fc8193c18032760878505b'
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
